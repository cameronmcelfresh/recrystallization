function [posUpdates,nodeVel] = forwardEuler(nodeBelong,grainMat,nodeConnect,nodeLoc,nodeVel,misorientMat,constants)
%forwardEuler Function to calculate the next positions of the nodes given
%the total collective forces from the plastic and misorientation
%contributions.

numNodes=length(nodeLoc);
gridLength=constants.gridSize;
mobility = constants.mobility; %use an arbitrary mobility value for now

posUpdates=nodeVel.*constants.dt; %positional updates to apply at the end of the timestep

for n = 1:numNodes
    
    %Do not allow boundary nodes to move
    pos=nodeLoc(n,:);
    if ismember(1,pos) || ismember(gridLength,pos)
        continue;
    end
    
    %Skip nodes with less than 2 connections as they are likely to soon be
    %remeshed
    if sum(ismember(nodeConnect(:,n),1))<3
        continue;
    end
    
    %Calculate the resolved force on the node given the misorientation
    %values across each boundary
    RSForce = readShockleyForce(n,nodeBelong,grainMat,nodeConnect,nodeLoc,misorientMat,constants);
    
    %Calculate the updated velocity for the next timestep
    nodeVel(n,:)=nodeVel(n,:)+RSForce*mobility;
    %nodeVel(n,:)=RSForce*mobility;
    
end

