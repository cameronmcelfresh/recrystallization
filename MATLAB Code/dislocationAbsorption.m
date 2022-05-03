function [updatedMisorientMat] = dislocationAbsorption(grainMat,misorientMat,const)
%dislocationAbsorption Function to calcualte the change in boundary
%misorientation due to dislocation densities in a given grain (currently
%section 4.2.5 in the notes). 

numGrains = length(grainMat);
updatedMisorientMat=zeros(numGrains,numGrains);

f = const.f; % fraction of dislocations absorbed by the boundaries
L = const.L; % assumed length of the boundary
b = const.b; % Burgers vector

for i = 1:numGrains
    for j = 1:i
        if i ==j
            continue
        else
            %Find the original misorientation angle
            misOrientVal=misorientMat(i,j); 
            
            %Extract the larger dislocation denisty
            dislocationDensity = max(grainMat(i,6),grainMat(j,6));
            
            %Calculate the misorientation value after considering
            %dislocation absorption
            shifted_misOrientVal = 2*atand( tand(misOrientVal/2)+f*b*L*dislocationDensity);
            
            %Update the misorientation matrix
            updatedMisorientMat(i,j)=shifted_misOrientVal;
            updatedMisorientMat(j,i)=shifted_misOrientVal;
        end
    end
end




end

