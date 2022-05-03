function [nodeLoc] = snapGrid(nodeLoc,gridLength)
%snapGrid Function to snap the points back to the grid that may have
%shifted outside. 
%   Detailed explanation goes here
% Snap nodes back to boundary if necessary
for nIter=1:length(nodeLoc)
    x1=nodeLoc(nIter,1);
    y1=nodeLoc(nIter,2);
    
    if x1>gridLength
        nodeLoc(nIter,1)=gridLength;
        fprintf("\tSnapping node %i (%.2f,%.2f) back to (%.2f,%.2f)\n",nIter,nodeLoc(nIter,1),nodeLoc(nIter,2),gridLength,nodeLoc(nIter,2));
    end
    
    if x1<1
        nodeLoc(nIter,1)=1;
        fprintf("\tSnapping node %i (%.2f,%.2f) back to (%.2f,%.2f)\n",nIter,nodeLoc(nIter,1),nodeLoc(nIter,2),1,nodeLoc(nIter,2));
    end    
    
    if y1>gridLength
        nodeLoc(nIter,2)=gridLength;
        fprintf("\tSnapping node %i (%.2f,%.2f) back to (%.2f,%.2f)\n",nIter,nodeLoc(nIter,1),nodeLoc(nIter,2),nodeLoc(nIter,1),gridLength);
    end
    
    if y1<1
        nodeLoc(nIter,2)=1;
        fprintf("\tSnapping node %i (%.2f,%.2f) back to (%.2f,%.2f)\n",nIter,nodeLoc(nIter,1),nodeLoc(nIter,2),nodeLoc(nIter,1),1);
    end 
    
    %Vectorized version
%     nodeLoc(nodeLoc<1)=1;
%     nodeLoc(nodeLoc>gridLength)=gridLength;    
end

end

