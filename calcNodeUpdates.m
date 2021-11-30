function [posUpdates] = calcNodeUpdates(dt,maxV,nodeLoc,nodeConnect,grid)
%calcNodeUpdates Function to calculate the positional updates of the nodes.
%Uses only the dihedral angle
%   dt is the timestep
%   maxV is the maximum node velocity
%   posUpdates is the x,y step that each node will take over the next dt

numNodes=length(nodeLoc);
gridLength=length(grid);
posUpdates=zeros(numNodes,2); % empty array

for n = 1:numNodes
    
    %Do not allow boundary nodes to move
    pos=nodeLoc(n,:);
    if ismember(1,pos) || ismember(gridLength,pos)
        continue;
    end
   
    %Calculate the best direction to move in
    maxiter=60;
    vec=dihedralAngleStep(n,nodeLoc,nodeConnect,dt*maxV,maxiter);
    
    posUpdates(n,1)=vec(1);
    posUpdates(n,2)=vec(2);
end

end

