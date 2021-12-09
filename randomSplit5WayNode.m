function [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = randomSplit5WayNode(nodeToSplit,nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance)
%randomSplit5WayNode Function to do a preliminary split of a 5-way junction
%into a triple juntion and quadruple junction

splitDist=1.25*minRemeshDistance; %arbitrary distance to split the nodes 

nodeRemoveID=nodeToSplit; %node to be removed

%Find the connecting nodes and the clockwise order they're situated
connectNodes = find(ismember(nodeConnect(:,nodeRemoveID),1,'rows'));
connectNodePos= nodeLoc(connectNodes,:); %position of the nodes connecting to the quadruple junction
elimNodePos = nodeLoc(nodeRemoveID,:);

b = clockWiseOrder(connectNodePos(:,1),connectNodePos(:,2)); %construct the boundayr matrix by hand

%% Generate the two new positions

%Select the two nodes that we will build towards - the other 4-way junction
%will have the rest
node1Index=randi(length(b));

if node1Index==length(b)
    node2Index=1;
else
    node2Index=node1Index+1;
end

%convert from local to global reference from of node number
node1Index=connectNodes(b(node1Index));
node2Index=connectNodes(b(node2Index));

targetNodesTriple = [node1Index,node2Index]; %connections being passed to the triple junction
targetNodesQuadruple = setdiff(connectNodes,targetNodesTriple); %connections being passed to the quadruple junction

bisector1=elimNodePos-mean(nodeLoc(targetNodesTriple,:));
bisector2=elimNodePos-mean(nodeLoc(targetNodesQuadruple,:));

splitNodeLoc1 = elimNodePos-bisector1/norm(bisector1)*splitDist/2; %new positions of the nodes <- triple junction node
splitNodeLoc2 = elimNodePos-bisector2/norm(bisector2)*splitDist/2; %<- quadruple junction node


%% Gather the required connections for the triple and quadruple junction as well as the grains they will belong to

allGrains = nodeBelong(nodeRemoveID,nodeBelong(nodeRemoveID,:)~=0); %all grains connected to the 5-way node

%grain that will be passed to triple junction alone
uniqueGrainForTriple =intersect(nodeBelong(targetNodesTriple(1),nodeBelong(targetNodesTriple(1),:)~=0),nodeBelong(targetNodesTriple(2),nodeBelong(targetNodesTriple(2),:)~=0));

uniqueGrainsForQuadruple = setdiff(allGrains,uniqueGrainForTriple); %grains that will be passed to quadruple junction, final

%Find the other two grains that will along be passed to the triple junction
grainsForTriple1=intersect(nodeBelong(targetNodesTriple(1),nodeBelong(targetNodesTriple(1),:)~=0),allGrains);
grainsForTriple2=intersect(nodeBelong(targetNodesTriple(2),nodeBelong(targetNodesTriple(2),:)~=0),allGrains);

allGrainsForTriple= union(grainsForTriple1,grainsForTriple2); %final grains for the triple junction
allGrainsForQuadruple = uniqueGrainsForQuadruple; %final grains for the quadruple junction

%% Print Progress
fprintf("Triple Juction\n");
fprintf("\tLocation: %.1f, %.1f\n",splitNodeLoc1(1),splitNodeLoc1(2));
fprintf("\tGrains: %i, %i, %i\n", allGrainsForTriple(1), allGrainsForTriple(2),allGrainsForTriple(3));
fprintf("\tNodes: %i, %i, + connection to new node\n", targetNodesTriple(1), targetNodesTriple(2));
fprintf("Quadruple Juction\n");
fprintf("\tLocation: %.1f, %.1f\n",splitNodeLoc2(1),splitNodeLoc2(2));
fprintf("\tGrains: %i, %i, %i, %i\n", allGrainsForQuadruple(1), allGrainsForQuadruple(2), allGrainsForQuadruple(3),allGrainsForQuadruple(4));
fprintf("\tNodes: %i, %i, %i, + connection to new node \n", targetNodesQuadruple(1), targetNodesQuadruple(2), targetNodesQuadruple(3));

%% Adjust the node locations
currentNumNodes=length(nodeLoc);
nodeID1=currentNumNodes;
nodeID2=currentNumNodes+1;

%% Add the new node locations (nodeLoc) 
nodeLoc=[nodeLoc;splitNodeLoc1;splitNodeLoc2];
nodeLoc(nodeRemoveID,:)=[]; %elimiate the old 5-way junction junction

%% Update which nodes belong to which grains (nodeBelong)
[~,columns]=size(nodeBelong);
nodeBelong=[nodeBelong;zeros(2,columns)];

for i = 1:3
    nodeBelong(nodeID1+1,i)=allGrainsForTriple(i); %having these backwards seems to work better...
    nodeBelong(nodeID2+1,i)=allGrainsForQuadruple(i);
end
nodeBelong(nodeID2+1,4)=allGrainsForQuadruple(4); %add the 4th connection for the quadruple junction
nodeBelong(nodeRemoveID,:)=[]; %remove the node from the nodeBelong array

%% Update the connectivity matrix (nodeConnect)

%Add the necessary connectivity value
for i = 1:2
    nodeConnect(nodeID1+1,targetNodesTriple(i))=1;
    nodeConnect(targetNodesTriple(i),nodeID1+1)=1;

    nodeConnect(nodeID2+1,targetNodesQuadruple(i))=1;
    nodeConnect(targetNodesQuadruple(i),nodeID2+1)=1;
end
nodeConnect(nodeID2+1,targetNodesQuadruple(3))=1;
nodeConnect(targetNodesQuadruple(3),nodeID2+1)=1; %make the additional connection for the 4-way junction

nodeConnect(nodeID1+1,nodeID2+1)=1;
nodeConnect(nodeID2+1,nodeID1+1)=1; %make the connection across the newly created segment

nodeConnect(:,nodeRemoveID)=[];
nodeConnect(nodeRemoveID,:)=[]; %eliminate the old node

%% Update the segment radius/curvature matrix (segRadius)

% % Assign arbitrary random radius values
% segRadius = [segRadius,(rand(currentNumNodes,1)-0.5)*1300];
% segRadius = [segRadius,(rand(currentNumNodes,1)-0.5)*1300];
% 
% segRadius =[segRadius; (rand(1,currentNumNodes+2)-0.5)*1300];
% segRadius =[segRadius; (rand(1,currentNumNodes+2)-0.5)*1300];

%Assign all the new radius values to zero
segRadius = [segRadius,zeros(currentNumNodes,1)];
segRadius = [segRadius,zeros(currentNumNodes,1)];

segRadius =[segRadius; zeros(1,currentNumNodes+2)];
segRadius =[segRadius; zeros(1,currentNumNodes+2)];


for i = 1:currentNumNodes+1 %conversve the radius directons
    segRadius(currentNumNodes,i)=segRadius(i,currentNumNodes);
    segRadius(currentNumNodes+1,i)=segRadius(i,currentNumNodes+1);
end

segRadius(:,nodeRemoveID)=[];
segRadius(nodeRemoveID,:)=[]; %eliminate the old node

%% Update the node velocity matrix

nodeVel=[nodeVel;zeros(2,2)];
nodeVel(nodeRemoveID,:)=[]; %eliminate the old node


end

