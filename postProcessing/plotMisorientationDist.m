function [] = plotMisorientationDist(grainMat)
%PLOTMISORIENTATIONDIST Function to plot the distribution of misorientation
%values for a cubic crystal

%Find how many grains currently exist in the crystal
numGrains = sum(grainMat(:,2)); 

misorientationValues=zeros(numGrains,1);
iter=1;
for i = 1:numGrains
    for j = 1:numGrains/2 %loop through all grain comparisons  
        if i ==j 
            continue
        else
            misorientationValues(iter)=misorientation(grainMat(i,3:5),grainMat(j,3:5),'bcc','bcc');
            iter=iter+1;
        end
    end
end

figure
histogram(misorientationValues)
xlabel("Disorientation Angle");
ylabel("Frequency");

end

