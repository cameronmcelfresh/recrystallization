function [] = plotTimers(codeTimers)
%plotTimers Function to plot the computational expense of each process

%Find the number of fields
theFields = fields(codeTimers);
numFields = length(theFields);

%Running counter for the total time
totalTime = 0;

%Extract the timer values
vals = [];
for i=1:numFields
    vals(i) = getfield(codeTimers,theFields{i});
    
    totalTime = totalTime + vals(i);
end

figure
barh(vals);
set(gca,'yticklabel',theFields)

title(sprintf("Computational Profile of the Simulation,total time = %.2f s",totalTime));
xlabel("Computation Time");

end

