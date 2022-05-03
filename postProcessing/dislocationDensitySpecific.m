function [runningDislocationDensity] = dislocationDensitySpecific(storedInfo,constants,iters)
%dislocationDensitySpecific Function to plot the evolving dislocation
%density of a simulation

runningDislocationDensity=zeros(length(iters),1); %running list to hold the dislocation density

for i = 1:length(iters) %loop through each timestep
    
    iter = iters(i);
    runningDislocationDensity(i) = extractDislocationDensity(storedInfo,constants.gridSize,iter);
end

%Plot the evolution of the grain size and count
% figure
% plot(runningDislocationDensity,[1:maxIter]*constants.dt*constants.inflationParameter);
% xlabel("Time");
% ylabel("Dislocation Density [m^-2]");


end

