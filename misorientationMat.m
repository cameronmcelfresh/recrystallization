function misorientMat = misorientationMat(grainMat)
%misorientationMat Function to generate a full matrix with all inter-grain
%misorientation values to use as a lookup table

numGrains = length(grainMat);
misorientMat=zeros(numGrains,numGrains);

for i = 1:numGrains
    for j = 1:i
        if i ==j
            continue
        else
            %Calculate then assign the misorientation value
            misOrientVal=misorientation(grainMat(i,3:5), grainMat(j,3:5),'bcc','bcc');
            misorientMat(i,j)=misOrientVal;
            misorientMat(j,i)=misOrientVal;
        end
    end
end

end

