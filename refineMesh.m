function [nodeBelong,nodeLoc,nodeConnect] = refineMesh(nodeBelong,nodeLoc,nodeConnect,minDist,gridLength)
%refineMesh Refines the nodes based on a minimum distance
%   minDist is the minimum distance between nodes

meshIter=0;

doneRemesh=0;

while doneRemesh==0 %repeat 
    
    doneRemesh=1; %assume that no remeshes are needed 
    for nIter=1:length(nodeLoc)
        x1=nodeLoc(nIter,1);
        y1=nodeLoc(nIter,2);
            for jIter=1:length(nodeLoc) %loop through all the other nodes

                if nIter==jIter %don't remesh a node with itself
                    continue;
                end

                x2=nodeLoc(jIter,1);
                y2=nodeLoc(jIter,2);              

                meshIter=meshIter+1;

                %Remesh if the distance between nodes is less than minDist
                if minDist>((x1-x2)^2 + (y1-y2)^2)^(0.5)
                    nodeElim=jIter;
                    nodeAbsorb=nIter;
                    
%                     %Do not permit the construction of quadruple junctions
%                     if length(unique([nodeBelong(nodeAbsorb,:),nodeBelong(nodeElim,:)]))>3
%                         fprintf("Restricting 4-way mergy junction of node "+jIter+" and node " + nIter+"\n");
%                         continue
%                     end
                    
                    fprintf("Merging node "+jIter+" into node " + nIter+"\n");
                    [nodeLoc,nodeBelong,nodeConnect] = mergeNodes(nodeElim,nodeAbsorb,nodeLoc,nodeBelong,nodeConnect,gridLength);
                    doneRemesh=0;
                    break
                end 
            end    
            
            if doneRemesh==0 %restart the meshing process if node eliminated
                break 
            end
    end  
end

end

