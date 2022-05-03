function [] = meshCheck(nodeConnect,nodeBelong,segRadius,nodeLoc,nodeVel,grainMat,constants)
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

%% Make sure that the curvature points in the corect direction
if constants.useCurvature==1 %only update the curvature if user specifies
    %cycle through all the connections
    for n1 = 1:length(nodeLoc)
        for n2 = 1:n1 

            if n1==n2
                continue
            end

            %Check to see if the connection exists
            if nodeConnect(n1,n2)==1 && segRadius(n1,n2)>0
                if ~SED_Direction_Convention(n1,n2,nodeLoc,nodeBelong,grainMat,segRadius,constants)
                    fprintf(" *** Warning: Segment %i -> %i fails SED direction convention\n",n1,n2);
                end
            end
        end
    end
end

%% Check to see any out-of-bounds nodes
outOfBoundsNodes = sum(sum(nodeLoc<1)) + sum(sum(nodeLoc>constants.gridSize));

if outOfBoundsNodes
    fprintf(" *** Warning: %i node(s) out of bounds of the grid\n",outOfBoundsNodes);
end

%% Make sure that none of the grains overlap

%% Make sure that boundary segments do not have curvature

end
