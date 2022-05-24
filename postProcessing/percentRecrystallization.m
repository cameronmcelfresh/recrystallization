function [percentRX] = percentRecrystallization(storedInfo,maxIter,constants)
%percentRecrystallization Function to calculate the percent
%recrystalliation of a microstructure as a function of time
%Use the grid method

%Define the grid point 
gridWidth = 20; %number of steps to use in each x,y direction
stepSize = constants.gridSize/(gridWidth+1); %step to take in each direction
[xGrid,yGrid] = meshgrid(stepSize:gridWidth:constants.gridSize-stepSize, stepSize:gridWidth:constants.gridSize-stepSize);

%grid with column 1 as x position, column 2 as y position, and column 3 as the grain it belongs to
gridPoints = [xGrid(:),yGrid(:),-1*ones(numel(xGrid),1)];

%Vector to hold the RX values
percentRX = zeros(maxIter,1);


%% Iterate through all the grains to find the change the grid points that have been swept
for iter = 1:maxIter %loop through each timestep
    
    %Load the variables for the iteration of interest
    nodeLoc=storedInfo{iter,1};
    nodeBelong=storedInfo{iter,2};
    grainMat=storedInfo{iter,4};
    segRadius=storedInfo{iter,5};
    
    %Update which gridpoints belong to which grain
    gridPoints = returnGrainGridPoints(gridPoints,nodeBelong,nodeLoc,grainMat,segRadius,constants);
    
    %Calculate the fraction recrystallized
    percentRX(iter) = sum(gridPoints(:,3)==0)/length(gridPoints);
    
end


end

