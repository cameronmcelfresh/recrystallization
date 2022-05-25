function [runningDislocationDensity] = dislocationDensityEvolution(storedInfo,constants,maxIter)
%dislocationDensityEvolution Function to plot the evolving dislocation
%density of a simulation

runningDislocationDensity=zeros(maxIter,1); %running list to hold the dislocation density

for iter = 1:maxIter %loop through each timestep
    runningDislocationDensity(iter) = extractDislocationDensity(storedInfo,constants.gridSize,iter);
end

% %Plot the evolution of the grain size and count
% figure
% plot([1:maxIter]*constants.dt*constants.inflationParameter,runningDislocationDensity);
% xlabel("Time");
% ylabel("Dislocation Density [m^-2]");

end

