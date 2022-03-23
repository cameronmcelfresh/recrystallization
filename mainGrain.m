%% A script to and model grain recrystallization

%add the post-processing functions
addpath("./postProcessing");

%add the functions to facilitate the COMSOL handshake and data passing
addpath("./COMSOL_HandshakeFunctions");

%% Physical Variables

gridSize = 1000; % side length for square grid of size (gridSize,gridSize) when first constructing the vertices
realGridSize=3e-6; %"true" size of the grid. Relevant to the velocity of the boundary motion
numGrains = 20; %number of grains to pack into the grid
const.realGridSize=realGridSize;
const.gridSize=gridSize;
const.numGrains = numGrains;

minRemeshDistance=3; %minimum distance before combining nodes
minGrainArea=150; %minimum grain area before removing grain
dt = 1; %timestep each iteration
totalTime=200; %total time to run the simulation [s]

const.Temp =800; %Temperature [K]

%Mobility Parameters
const.TJ_mobilityRatio = 100; % Multiplicative factor to find the triple junction mobility using the GB mobility
const.mobilityGB_Q = 3; % grain boundary activation energy [eV]
const.mobilityGB_max = max(mobilityGB_lookup(const,sqrt(const.realGridSize^2/const.numGrains),(1:60))); %maimum grain boundary mobility
const.mobility=const.mobilityGB_max*const.TJ_mobilityRatio; % Reduced Triple junction mobility in units of [m^3/J/s]
const.inflationParameter = 10^-18/const.mobility; % factor to artificially increase or decrease the mobilities

% Scale the constant TJ mobility
const.mobility=const.mobility*const.inflationParameter;

const.dt = dt; % timestep for RX model to use
const.totalTime = totalTime; % total simulation time to evolve the microstructure [s]
const.numGrains=numGrains;
const.realGridSize=realGridSize;
const.gridSize=gridSize;
const.G=78*1E9; %Shear Modulus [Pa]
const.b=2.8*10^-10; %Burgers vector [m]
const.v=0.28; %Poisson's ratio
const.coreWidth=2*const.b; %Dislocation Core Width [m]
const.useCurvature = 1; % whether or not to allow grain boundaries to be curved via plastic strain energy differential

%Variables to influence change of misorientation due to dislocation
%absorption (boundary nucleation)
const.f = 0.4; % fraction of dislocations absorbed by the boundaries
const.L = 10^-6; % assumed length of the boundary [m]

%COMSOL Interaction Variables
const.useCOMSOL = 0; %whether or not to co-evolve the CPFEM COMSOL code for realistic dislocation densities
const.strainRate = 100; % strain rate - used in generation of COMSOL .java file
const.dt_COMSOL = 1e-6; %timestep for COMSOL to use [s]
const.totalTime_COMSOL = 35e-6; % total time to run the simulation in COMSOL
const.COMSOL_path = "/u/home/c/cmcelfre/project-jmarian/RX/"; % path for COMSOL file
const.comsol_file_name = "./COMSOL_HandshakeFunctions/poly_cp_2D_raw.java"; %original java file to copy then rewrite with correct variables
const.comsol_written_name = "poly_cp_2D_raw.java";

%Set the dislocation density minimum and maximum. Used for plotting the
%dislocation density map and also for assigning dislocation densities (if
%needed)
const.minDislocationDensity = 5e12;
const.maxDislocationDensity = 5e14;

%Scale ratio for the x and y directions for elongated grain structures
const.scalex = 0.3;
const.scaley = 0.3;

%% Non-physical Variables

%const.asymetricMicro = 0; %1==build an assymetric microstructure with small grains in side regions, 0== build normal microstructure
%const.asymetricGrains = 26; %number of grains to build on the corners iff asymetricMicro==1

const.plotMicrostructure=1; %1==plot the evolving grains, 0==don't generate plot. plotMicrostructure variable will override the writeMovie variable
const.plotBoundaries = 0; %1==only plot the boundaries of all the grains, exclude any color. Default is random coloring
const.plotNodeNumbers = 0; %1==plot the nodeIDs and boundary connections each iteration
const.plotDislocationDensity = 1; %1==plot the dislocation density of each grain instead of a random color
const.runPostProcessing = 0; %1==run all the post processing analysis 
const.writeMovie=0; %1==write frames to an avi file, 0==don't generate movie
const.saveMovieFreq = 5; % frequency to save snapshots for the video
const.movieTitle="CPFEM_RX"; % title of the movie and .mat file to be saved
const.movieHeight = 700; %controls the height of the video
const.movieWidth = 840; %controls the width of the video

const.OLDnodeLoc=[]; %array to hold the last step's node positions
const.OLDnodeBelong=[]; %array to hold the last step's grain assignments

%% Prepare video writer if needed
%videoFrames =[];
% if const.writeMovie==1 %Record a movie if specified to do so   
%     moviename=sprintf(const.movieTitle+'.avi'); %update the name of the file
%     
%     aviobj=VideoWriter(moviename);
%     aviobj.Quality=100;
%     open(aviobj);
%     
%     %Initialize the video structure to hold the frames
% %     videoFrames.cdata=zeros(840,1120,3,'uint8');
% %     videoFrames.colormap = [];
% %     videoFrames(length(dt:dt:totalTime)).cdata =zeros(840,1120,3,'uint8');
% %     videoFrames(length(dt:dt:totalTime)).colormap =[];
% end

%% Prepare cell to hold simulation info and set timers

%Cell to store all location info
storedInfo = cell(round(totalTime/dt),6);
% column 1 = nodeLoc
% column 2 = nodeBelong
% column 3 = nodeConnect
% column 4 = grainMat
% column 5 = segRadius
% column 6 = nodeVel

%Create a timer to time the internal processes
codeTimer=struct;
codeTimer.initialization=0;
codeTimer.refineMesh=0;
codeTimer.grainRemesh=0;
codeTimer.calcNodeUpdates=0;
codeTimer.plotGrains=0;
codeTimer.meshCheckANDSave=0;
codeTimer.COMSOL_handshake=0;
codeTimer.COMSOL_computation=0;
%% Build a grain structure using a 2D Voronoi Tesselation. Assign chemistry
tic %start timer for initilization

fprintf("Generating grain centers and euler angles...\n");
[grid,grainMat] = buildMicro(gridSize,numGrains,const);

C = linspecer(numGrains); %color map with unique distinguishable colors
const.C = C; %save to constant dictionary

%% Find the node locations, grain corners, connectivity, and starting radii values

fprintf("Generating node locations and connectivity matrices...\n");
[nodeLoc,nodeBelong,nodeConnect,segRadius,nodeVel] = grainConnectivity(grid);

meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel,grainMat,const);
%% Generate grain misorientation Matrix to speed up calculations down the line
fprintf("Generating grain misorientation look-up matrix...\n");
misorientMat = misorientationMat(grainMat); %generate the grain misorientation matrix

%% Refine the initial mesh
fprintf("Refining mesh...\n");
[nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel]=refineMesh(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance,gridSize);
[nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel]=requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);

meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel,grainMat,const);

codeTimer.initialization=toc; %end initilization timer
%% Generate the COMSOL .java file and associated seed files to simulate low temperature static deformation

if const.useCOMSOL==1
    %Generate poly_cp_2D_raw.java in the working directory
    fprintf("Generating COMSOL .java file...\n");
    generateCOMSOLfile(const);

    %Generate the orientation1.txt, orientation2.txt, orientation3.txt,
    %u1.txt, u2.txt files in the /COMSOL_input/ directory
    fprintf("Generating orientation files for COMSOL...\n");
    continuousToSpreadSheet(nodeLoc,nodeBelong,grainMat,const.realGridSize,const.gridSize,400);
end
%% Run the low-temperature deformation of the 2D poly crystal

% Generate COMSOL output to produce accurate dislocation densities
if const.useCOMSOL==1
    fprintf("Running COMSOL CPFEM...\n");
    COMSOL_Succeed = simulateCOMSOL_CP();
    
    if COMSOL_Succeed ==1
        fprintf("COMSOL Crystal Plasticity model run successfully\n");
    else
        fprintf("Failed to run COMSOL Crystal Plasticity model\n");
    end
end
%% Integrate the dislocation density from COMSOL if it exists

if const.useCOMSOL==1 && isfile("./COMSOL_output/dislocationDensity.txt")
    %Integrate the dislocation density for each grain
    grainMat=integrateCOMSOL(nodeLoc, nodeBelong, grainMat,const.realGridSize,const.gridSize);
    
    %Reset the dislocation density min and max for plotting
    const.minDislocationDensity = min(grainMat(:,6));
    const.maxDislocationDensity = max(grainMat(:,6));
end

%% Calculate the change of misorientation due to dislocation absorption
fprintf("Calculating change of misorientation due to dislocation absorption...\n");
misorientMat = dislocationAbsorption(grainMat,misorientMat,const); % use dislocation densities to calculate the change of misorientation

%% Refine and Plot

%Create figure to plot on
if const.plotMicrostructure
    figure
    f = figure(1);
end

iter = 1;

for t = dt:dt:totalTime
    fprintf("Iter %i\n",iter);
    
    %Refine the mesh if needed (merging nodes that are too close). Snap
    %nodes back to boundary if necessary. 
    tic
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel]=refineMesh(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance/2,gridSize); %merge nodes that need to be merged
    [nodeLoc] = snapGrid(nodeLoc,gridSize);
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);
    [nodeLoc] = snapGrid(nodeLoc,gridSize);
    codeTimer.refineMesh=codeTimer.refineMesh+toc;

    %Calculate the position updates
    tic
    %[posUpdates] = calcNodeUpdates(dt,maxNodeVelocity,nodeLoc,nodeConnect,grid); %calculate the positional changes for all the nodes
    [posUpdates,nodeVel,segRadius] = forwardEuler(nodeBelong,grainMat,nodeConnect,nodeLoc,nodeVel,misorientMat,segRadius,const); %forward euler method for position integration
    nodeLoc=nodeLoc+posUpdates; %update positions
    [nodeLoc] = snapGrid(nodeLoc,gridSize);
    codeTimer.calcNodeUpdates=codeTimer.calcNodeUpdates+toc;
    
    %Remove any grains that are below the size threshold - added in a
    %requireTripleJunctions to see if it can help avoid the formation of
    %quadruple junctions
    tic
    [nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,nodeVel] = grainRemesh(nodeBelong,nodeLoc,nodeConnect,grainMat,minGrainArea,segRadius,nodeVel,gridSize); %remove grains that are too small
    [nodeLoc] = snapGrid(nodeLoc,gridSize);
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);
    codeTimer.grainRemesh=codeTimer.grainRemesh+toc;    
    
    %Plot the grains and save to video
    tic
    if const.plotMicrostructure
        clf(f)
        plotGrains(nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,const); %plot the grains to axis
        pause(0.001); %pause to generate the plot
        if const.writeMovie && mod(iter,const.saveMovieFreq)==0
            set(gcf,'Position',[15 15 const.movieWidth,const.movieHeight]); %set the position and size of the figure of the figure
            theframe = getframe(gcf);
            videoFrames(round(iter/const.saveMovieFreq)) = theframe;
        end
    end    
    codeTimer.plotGrains=codeTimer.plotGrains+toc;
    
    %Save data and re-check mesh
    tic
    storedInfo{iter,1} = nodeLoc;
    storedInfo{iter,2} = nodeBelong;
    storedInfo{iter,3} = nodeConnect;
    storedInfo{iter,4} = grainMat;
    storedInfo{iter,5} = segRadius;    
    storedInfo{iter,6} = nodeVel;

    meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel,grainMat,const); %run unit tests / sense checks on the structure
    codeTimer.meshCheckANDSave=codeTimer.meshCheckANDSave+toc;

    iter=iter+1;
end

%% Save all of the data
save(sprintf('%s',const.movieTitle));

%% Post-Processing

if const.runPostProcessing==1   
    %Generate the movie associated with the simulation
    if const.writeMovie==1 %Record a movie if specified to do so   
        moviename=sprintf(const.movieTitle+'.avi'); %update the name of the file
        aviobj=VideoWriter(moviename);
        aviobj.Quality=100;

        open(aviobj);    
        for frameIter = 1:length(videoFrames)
            writeVideo(aviobj,videoFrames(frameIter));
        end
        close(aviobj);
    end

    %Plot the computation time for each process
    plotTimers(codeTimer);

    %Calculate the evolving grain size and count - then plot it
    [runningGrainSize,runningGrainCount] = grainAnalysis(storedInfo,iter-1);

    %Generate Misorientation distribution
    compMisorientationDist(2,iter-1, storedInfo,misorientMat)
end