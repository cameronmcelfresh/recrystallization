%% A script to try and model grain recrystallization

%% To-do list
%include grain removal in remesh via minimum grain size
%grain size and distribution functions
%change units to 'real' or temperature-depedent units
%multiphase growth with different interphase surface energies
%change the grain removal so the colors remain constant
%add penalty for triangle grains? Improve energy function for quadruple
    %junctions

gridSize =800; %side length
numGrains = 80; %number of grains

minRemeshDistance=3; %minimum distance before combining nodes
minGrainArea=80; %minimum grain area before removing grain
dt = 0.2; %timestep each iteration
totalTime=400; %total time to run the simulation
maxNodeVelocity=1; %maximum node velocity in a given timestep

%Cell to store all location info
storedInfo = cell(round(totalTime/dt),4);
% column 1 = nodeLoc
% column 2 = nodeBelong
% column 3 = nodeConnect
% column 4 = grainMat

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

[grid,grainMat] = buildMicro(gridSize,numGrains);
C = linspecer(numGrains); %color map with unique distinguishable colors 

%% Find the grain corners and connectivity

[nodeLoc,nodeBelong,nodeConnect] = grainConnectivity(grid);

meshCheck(nodeConnect,nodeBelong);
%% Show the gridded image
% figure
% imagesc(grid')
% hold on
% scatter(nodeLoc(:,1),nodeLoc(:,2),55,'filled');

%% Refine the initial mesh
fprintf("Refining mesh...\n");
[nodeBelong,nodeLoc,nodeConnect]=refineMesh(nodeBelong,nodeLoc,nodeConnect,minRemeshDistance,gridSize);
[nodeBelong,nodeLoc,nodeConnect] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,minRemeshDistance);
%plotGrains(grid,nodeBelong,nodeLoc,nodeConnect,grainMat,C);
%[nodeBelong,nodeLoc,nodeConnect,grainMat] = grainRemesh(nodeBelong,nodeLoc,nodeConnect,grainMat,minGrainArea);

meshCheck(nodeConnect,nodeBelong);

codeTimer.initialization=toc; %initilization timer
%% Refine and Plot

f = figure(1);
iter = 1;

for t = 1:dt:totalTime
    fprintf("Iter %i\n",iter);
    %Refine the mesh if needed
    tic
    [nodeBelong,nodeLoc,nodeConnect]=refineMesh(nodeBelong,nodeLoc,nodeConnect,minRemeshDistance/8,gridSize);
    [nodeBelong,nodeLoc,nodeConnect] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,minRemeshDistance);
    codeTimer.refineMesh=codeTimer.refineMesh+toc;
    
    %Remove any grains that are below the size threshold
    tic
    [nodeBelong,nodeLoc,nodeConnect,grainMat] = grainRemesh(nodeBelong,nodeLoc,nodeConnect,grainMat,minGrainArea,gridSize);
    codeTimer.grainRemesh=codeTimer.grainRemesh+toc;

    %Calculate the position updates
    tic
    [posUpdates] = calcNodeUpdates(dt,maxNodeVelocity,nodeLoc,nodeConnect,grid);
    codeTimer.calcNodeUpdates=codeTimer.calcNodeUpdates+toc;
    
    nodeLoc=nodeLoc+posUpdates; %update positions
    
    %Plot the grains
    tic
    %clf(f)
    %plotGrains(grid,nodeBelong,nodeLoc,nodeConnect,grainMat,C);
    %pause(0.00001);
    codeTimer.plotGrains=codeTimer.plotGrains+toc;
    
    %Save data and re-check mesh
    tic
    storedInfo{iter,1} = nodeLoc;
    storedInfo{iter,2} = nodeBelong;
    storedInfo{iter,3} = nodeConnect;
    storedInfo{iter,4} = grainMat;
    meshCheck(nodeConnect,nodeBelong); %run unit tests / sense checks on the structure
    codeTimer.meshCheckANDSave=codeTimer.meshCheckANDSave+toc;

    iter=iter+1;
end

%% Post-Processing

%Plot the computation time
plotTimers(codeTimer);

%Calculate the evolving grain size and count
[runningGrainSize,runningGrainCount] = grainAnalysis(storedInfo,iter-1,gridSize);
