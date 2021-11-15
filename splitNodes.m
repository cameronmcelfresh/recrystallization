function [nodeBelong,nodeLoc,nodeConnect] = splitNodes(newNodePos1,newNodePos2,nodesForNewPos1,nodesForNewPos2,oldNodeID,nodeBelong,nodeLoc,nodeConnect)
%splitNodes Function to split a 4-way junction into 2, 3-way junctions

currentNumNodes=length(nodeLoc);

nodeID1=currentNumNodes;
nodeID2=currentNumNodes+1;

%% Add the new node locations (nodeLoc) 
nodeLoc=[nodeLoc;newNodePos1;newNodePos2];
nodeLoc(oldNodeID,:)=[]; %elimiate the old quadruple junction

%% Update which nodes belong to which grains (nodeBelong)
[~,columns]=size(nodeBelong);
nodeBelong=[nodeBelong;zeros(2,columns)];

grainIgnoredforNode1 = intersect(nodeBelong(nodesForNewPos1(1),nodeBelong(nodesForNewPos1(1),:)~=0), nodeBelong(nodesForNewPos1(2),nodeBelong(nodesForNewPos1(2),:)~=0));
grainIgnoredforNode1 = intersect(grainIgnoredforNode1,nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0));

grainIgnoredforNode2 = intersect(nodeBelong(nodesForNewPos2(1),nodeBelong(nodesForNewPos2(1),:)~=0), nodeBelong(nodesForNewPos2(2),nodeBelong(nodesForNewPos2(2),:)~=0));
grainIgnoredforNode2 = intersect(grainIgnoredforNode2,nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0));

%nodeBelong=[nodeBelong,zeros(2,columns)];
grainsForNode1=nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0);
% grainsForNode1
% grainIgnoredforNode1
grainsForNode1(grainsForNode1==grainIgnoredforNode1)=[];


grainsForNode2=nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0);
% grainsForNode2
% grainIgnoredforNode2
grainsForNode2(grainsForNode2==grainIgnoredforNode2)=[];

for i = 1:3
    nodeBelong(nodeID1+1,i)=grainsForNode2(i);
    nodeBelong(nodeID2+1,i)=grainsForNode1(i);
end

nodeBelong(oldNodeID,:)=[]; %remove the node from the nodeBelong array

%% Update the connectivity matrix (nodeConnect)

%Add the necessary connectivity value
for i = 1:2
    nodeConnect(nodeID1+1,nodesForNewPos1(i))=1;
    nodeConnect(nodesForNewPos1(i),nodeID1+1)=1;

    nodeConnect(nodeID2+1,nodesForNewPos2(i))=1;
    nodeConnect(nodesForNewPos2(i),nodeID2+1)=1;
end

nodeConnect(nodeID1+1,nodeID2+1)=1;
nodeConnect(nodeID2+1,nodeID1+1)=1; %make the connection across the newly created segment

nodeConnect(:,oldNodeID)=[];
nodeConnect(oldNodeID,:)=[]; %eliminate the old node

end

