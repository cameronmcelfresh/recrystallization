function [] = plotTimers(codeTimers)
%plotTimers Function to plot the computational expense of each process

%Find the number of fields
theFields = fields(codeTimers);
numFields = length(theFields);

%Extract the timer values
vals = [];
for i=1:numFields
    vals(i) = getfield(codeTimers,theFields{i});
end

figure
barh(vals);
set(gca,'yticklabel',theFields)

title("Computational Profile of the Simulation");
xlabel("Computation Time");

end

