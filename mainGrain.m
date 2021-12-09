%% A script to and model grain recrystallization

%add the post processing functions
addpath("./postProcessing");

%% To-do list

% Physics Implementations
    % institute curvature-dependent calculation of the local dihedral angle
    % temperature-based mobility
    % node-specific mobility to relate to the node velocity
    % plastic `r strain density distribution as a driving force for boundary
        % mobility
    % curvature of segments based on node velocities

% Post-simulation analysis
    % pole figures
    % calculation of GB lengths of certain boundaries (HABG, LAGB, etc.)
    
% Unit Tests
    % no points outside of the boundary
    % no crossing segments
    
% "Other"
    % write more thorough descriptions for all the variables and functions
    % organize the functions in different directories using the "addPath"
        % command so debugging will be easier 
    % look into using a more nuanced data structure for code readability
    % explore speedups
    % go through and remove (or explain) unused variables/code

%% Physical Variables

gridSize = 1000; %side length
realGridSize=1e-3; %"true" size of the grid. Relevant to the velocity of the boundary motion
numGrains = 20; %number of grains to pack into the grid

minRemeshDistance=3; %minimum distance before combining nodes
minGrainArea=150; %minimum grain area before removing grain
dt = 0.01; %timestep each iteration
totalTime=5; %total time to run the simulation
maxNodeVelocity=1.5; %maximum node velocity in a given timestep

const.mobility=3; %triple junction mobility
const.mobilityGB=0.075; %grain boundary mobility
const.dt = dt;
const.numGrains=numGrains;
const.realGridSize=realGridSize;
const.gridSize=gridSize;
const.Temp = 400; %Temperature
const.G=78*1E9; %Shear Modulus [Pa]
const.b=2.8*10^-10; %Burgers vector [m]
const.v=0.28; %Poisson's ratio
const.coreWidth=2*const.b; %Dislocation Core Width [m]
const.useCurvature = 1; % whether or not to allow grain boundaries to be curved via plastic stra

%% Non-physical Variables

plotMicrostructure=1; %1==plot the evolving grains, 0==don't generate plot. plotMicrostructure variable will override the writeMovie variable
plotNodeNumbers = 0; %1==plot the nodeIDs and boundary connections each iteration
constant.plotDislocationDensity = 1; %1==plot the dislocation density of each grain
writeMovie=1; %1==write frames to an avi file, 0==don't generate movie
movieTitle="unchecked_curved_boundary_motion";

%videoFrames =[];
if writeMovie==1 %Record a movie if specified to do so   
    moviename=sprintf(movieTitle+'.avi'); %update the name of the file
    aviobj=VideoWriter(moviename);
    aviobj.Quality=100;
    open(aviobj);
    
    %Initialize the video structure to hold the frames
%     videoFrames.cdata=zeros(840,1120,3,'uint8');
%     videoFrames.colormap = [];
%     videoFrames(length(dt:dt:totalTime)).cdata =zeros(840,1120,3,'uint8');
%     videoFrames(length(dt:dt:totalTime)).colormap =[];
end

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


%% Build a grain structure using a 2D Voronoi Tesselation. Assign chemistry
tic %start timer for initilization

fprintf("Generating grain centers and euler angles...\n");
[grid,grainMat] = buildMicro(gridSize,numGrains);
C = linspecer(numGrains); %color map with unique distinguishable colors 

%Generate disorientation distribution
%plotMisorientationDist(grainMat)

%% Find the node locations, grain corners, connectivity, and starting radii values

fprintf("Generating node locations and connectivity matrices...\n");
[nodeLoc,nodeBelong,nodeConnect,segRadius,nodeVel] = grainConnectivity(grid);

meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel);
%% Generate grain misorientation Matrix to speed up calculations down the line
fprintf("Generating grain misorientation look-up matrix...\n");
misorientMat = misorientationMat(grainMat); %generate the grain misorientation matrix

%% Show the gridded image
% figure
% imagesc(grid')
% hold on
% scatter(nodeLoc(:,1),nodeLoc(:,2),55,'filled');

%% Refine the initial mesh
fprintf("Refining mesh...\n");
[nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel]=refineMesh(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance,gridSize);
[nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);

meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel);

codeTimer.initialization=toc; %end initilization timer
%% Refine and Plot
figure
f = figure(1);
iter = 1;

for t = dt:dt:totalTime
    fprintf("Iter %i\n",iter);
    %Refine the mesh if needed (merging nodes that are too close)
    tic
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel]=refineMesh(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance/2,gridSize); %merge nodes that need to be merged
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);
    codeTimer.refineMesh=codeTimer.refineMesh+toc;

    %Calculate the position updates
    tic
    %[posUpdates] = calcNodeUpdates(dt,maxNodeVelocity,nodeLoc,nodeConnect,grid); %calculate the positional changes for all the nodes
    [posUpdates,nodeVel,segRadius] = forwardEuler(nodeBelong,grainMat,nodeConnect,nodeLoc,nodeVel,misorientMat,segRadius,const); %forward euler method for position integration
    nodeLoc=nodeLoc+posUpdates; %update positions
    codeTimer.calcNodeUpdates=codeTimer.calcNodeUpdates+toc;
    
    %Remove any grains that are below the size threshold - added in a
    %requireTripleJunctions to see if it can help avoid the formation of
    %quadruple junctions
    tic
    [nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,nodeVel] = grainRemesh(nodeBelong,nodeLoc,nodeConnect,grainMat,minGrainArea,segRadius,nodeVel,gridSize); %remove grains that are too small
    [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance);
    codeTimer.grainRemesh=codeTimer.grainRemesh+toc;    
    
    %Plot the grains and save to video
    tic
    clf(f)
    if plotMicrostructure
        plotGrains(grid,nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,C,plotNodeNumbers); %plot the grains to axis
    end
    if writeMovie && plotMicrostructure
        theframe = getframe(gcf);
        %x(frame_counter) = theframe;
        videoFrames(iter) = theframe;
        %frame_counter=frame_counter+1;
    end    
    pause(0.001);
    codeTimer.plotGrains=codeTimer.plotGrains+toc;
    
    %Save data and re-check mesh
    tic
    storedInfo{iter,1} = nodeLoc;
    storedInfo{iter,2} = nodeBelong;
    storedInfo{iter,3} = nodeConnect;
    storedInfo{iter,4} = grainMat;
    storedInfo{iter,5} = segRadius;    
    storedInfo{iter,6} = nodeVel;

    meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel); %run unit tests / sense checks on the structure
    codeTimer.meshCheckANDSave=codeTimer.meshCheckANDSave+toc;

    iter=iter+1;
end

%% Post-Processing

%Generate the movie associated with the simulation
if writeMovie==1 %Record a movie if specified to do so   
    aviobj=VideoWriter(moviename);
    aviobj.Quality=100;
    %aviobj.Compression='Indeo5';
       
    open(aviobj);
    for frameIter = 1:iter-1
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