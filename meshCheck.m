function [] = meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel)
%meshCheck Function to run checks on the nodes/segments to confirm that it

numNodes = length(nodeConnect);

%% Check to see if nodes are attached to themselves in the connectivity matrix
for n = 1:numNodes
    if nodeConnect(n,n)==1
        fprintf(" *** Warning: node %i -> node %i connectivity ***\n",n,n);
    end
end

%% Make sure that there are no quadruple+ junctions
for n = 1:numNodes
    numConnections = length(unique(nodeBelong(n,:)))-1;
    if numConnections>3
        fprintf(" *** Warning: node %i belongs to >3 grains (%i grains,quadruple+ junction) ***\n",n,numConnections);
    end
end

%% Make sure the feature matrices are consistent sizes
if ~all(size(segRadius)==size(nodeConnect))
    [rNode,cNode]=size(nodeConnect);
    [rSeg,cSeg]=size(segRadius);
    fprintf(" *** Warning: nodeConnect and segRadius matrices are different sizes\n");
    fprintf("\tnodeConnect: %i rows, %i columns\n",rNode,cNode);
    fprintf("\tsegRadius: %i rows, %i columns\n",rSeg,cSeg);
end

if ~(length(nodeBelong) == length(nodeLoc) && length(nodeConnect) == length(nodeBelong) && length(segRadius)==length(nodeLoc))
    fprintf(" *** Warning: Size mismatch between feature matrices\n");
    fprintf("\tlength(nodeBelong)=%i\n",length(nodeBelong));
    fprintf("\tlength(nodeLoc)=%i\n",length(nodeLoc));
    fprintf("\tlength(nodeConnect)=%i\n",length(nodeConnect));
    fprintf("\tlength(segRadius)=%i\n",length(segRadius));
end

if ~(length(nodeVel) == length(nodeLoc))
    fprintf(" *** Warning: Size mismatch between node locations and velocities\n");
    fprintf("\tlength(nodeVel)=%i\n",length(nodeVel));   
    fprintf("\tlength(nodeLoc)=%i\n",length(nodeLoc));
end

%% Make sure that the entire volume is conserved


%% Make sure that none of the grains overlap

%% Make sure that boundary segments do not have curvature

end
