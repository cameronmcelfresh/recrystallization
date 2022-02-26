function [GrainCount] = runningGrainCount(storedInfo,maxIter)
%runningGrainCount Function to return the running grain count
GrainCount=zeros(maxIter,1); %running list to hold the number of grains

for iter = 1:maxIter %loop through each timestep
    
    grainMat=storedInfo{iter,4};
    
    GrainCount(iter)=sum(grainMat(:,2)==1); %skip the grain if the display indicator is turned off
end

end

