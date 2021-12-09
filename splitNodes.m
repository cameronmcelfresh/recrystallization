function [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = splitNodes(newNodePos1,newNodePos2,nodesForNewPos1,nodesForNewPos2,oldNodeID,nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel)
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

allGrains = nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0); %all of the grains in the 4-way junction

grainIgnoredforNode1 = intersect(nodeBelong(nodesForNewPos1(1),nodeBelong(nodesForNewPos1(1),:)~=0), nodeBelong(nodesForNewPos1(2),nodeBelong(nodesForNewPos1(2),:)~=0));
grainIgnoredforNode2 = intersect(nodeBelong(nodesForNewPos2(1),nodeBelong(nodesForNewPos2(1),:)~=0), nodeBelong(nodesForNewPos2(2),nodeBelong(nodesForNewPos2(2),:)~=0));

grainsForNode1=setdiff(allGrains,grainIgnoredforNode1);
grainsForNode2=setdiff(allGrains,grainIgnoredforNode2);

% grainIgnoredforNode1 = intersect(nodeBelong(nodesForNewPos1(1),nodeBelong(nodesForNewPos1(1),:)~=0), nodeBelong(nodesForNewPos1(2),nodeBelong(nodesForNewPos1(2),:)~=0));
% grainIgnoredforNode1 = intersect(grainIgnoredforNode1,nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0));
% 
% grainIgnoredforNode2 = intersect(nodeBelong(nodesForNewPos2(1),nodeBelong(nodesForNewPos2(1),:)~=0), nodeBelong(nodesForNewPos2(2),nodeBelong(nodesForNewPos2(2),:)~=0));
% grainIgnoredforNode2 = intersect(grainIgnoredforNode2,nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0));
% 
% %nodeBelong=[nodeBelong,zeros(2,columns)];
% grainsForNode1=nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0);
% grainsForNode1
% grainIgnoredforNode1
% grainsForNode1(grainsForNode1==grainIgnoredforNode1)=[];
% 
% 
% grainsForNode2=nodeBelong(oldNodeID,nodeBelong(oldNodeID,:)~=0);
% grainsForNode2
% grainIgnoredforNode2
% grainsForNode2(grainsForNode2==grainIgnoredforNode2)=[];

for i = 1:3
    nodeBelong(nodeID1+1,i)=grainsForNode2(i); %having these backwards seems to work better...
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


%% Update the segRadius Matrix
% currentNumNodes
% size(segRadius)

% col1 = (rand(currentNumNodes,1)*100+600 ).*sign(rand(currentNumNodes,1)-0.5);
% col2 = (rand(currentNumNodes,1)*100+600 ).*sign(rand(currentNumNodes,1)-0.5); 
% row1 = (rand(1,currentNumNodes+2)*100+600).*sign(rand(1,currentNumNodes+2)-0.5); 
% row2 = (rand(1,currentNumNodes+2)*100+600).*sign(rand(1,currentNumNodes+2)-0.5); 

%Set the new segRadius values to zero
col1 = zeros(currentNumNodes,1);
col2 = zeros(currentNumNodes,1);
row1 = zeros(1,currentNumNodes+2);
row2 = zeros(1,currentNumNodes+2);

segRadius = [segRadius,col1]; %add the first node
segRadius = [segRadius,col2]; %add the second node

% segRadius =[segRadius; ((rand(1,currentNumNodes+2)-0.5)*1300)]; %add the first node
% segRadius =[segRadius; ((rand(1,currentNumNodes+2)-0.5)*1000)]; %add the second node

segRadius =[segRadius; row1]; %add the first node
segRadius =[segRadius; row2]; %add the second node


for i = 1:currentNumNodes+1 %conserve the radius directons
    segRadius(currentNumNodes+1,i)=segRadius(i,currentNumNodes+1);
    segRadius(currentNumNodes+2,i)=segRadius(i,currentNumNodes+2);
end

segRadius(:,oldNodeID)=[];
segRadius(oldNodeID,:)=[]; %eliminate the old node

%% Update the node velocity list

nodeVel=[nodeVel;zeros(2,2)];
nodeVel(oldNodeID,:)=[]; %eliminate the old node


end

