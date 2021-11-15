function [] = meshCheck(nodeConnect,nodeBelong)
%meshCheck Function to run checks on the nodes/segments to confirm that it

numNodes = length(nodeConnect);

%Check to see if nodes are attached to themselves in the connectivity matrix
for n = 1:numNodes
    if nodeConnect(n,n)==1
        fprintf(" *** Warning: node %i -> node %i connectivity ***\n",n,n);
    end
end

%Make sure that there are no quadruple+ junctions
for n = 1:numNodes
    numConnections = length(unique(nodeBelong(n,:)))-1;
    if numConnections>3
        fprintf(" *** Warning: node %i belongs to >3 grains (%i grains,quadruple+ junction) ***\n",n,numConnections);
    end
end


%Make sure that the entire volume is conserved


%Make sure that none of the grains overlap



end
