function [adjustPosUpdates] = restrictNodeOverlap(posUpdates,nodeLoc,grid,minRemeshDistance)
%restrictNodeOverlap Function to restrict the overlap of nodes

numNodes=length(nodeLoc);
gridLength=length(grid);
adjustPosUpdates=posUpdates; % empty array

newPos = nodeLoc+posUpdates;

for n = 1:numNodes
    
    %Do not allow boundary nodes to move
    pos=newPos(n,:);
    if ismember(1,pos) || ismember(gridLength,pos)
        continue;
    end
    
    closeNode=0; %closest node
    
    for n2=1:numNodes
        
        pos1=newPos(n2,:);
        
        %Ignore self-comparison
        if n==n2
            continue;
        end
        
        if ((pos(1)-pos1(1))^2+(pos(2)-pos1(2))^2)^0.5 < minRemeshDistance
            closeNode=n2;
            fprintf("Adjusting closeness of nodes %i and %i\n",n,n2);
            break;
        end
    end
    
    %update the position adjustment if the the movement would trigger a remesh
    if closeNode>0 
        vec=newPos(closeNode,:)-pos; 
        adjustPosUpdates(n,:)=vec/norm(vec)*minRemeshDistance*1.4;
    end
end


end

