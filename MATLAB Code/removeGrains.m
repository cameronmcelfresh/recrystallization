function [nodeBelong,grainMat] = removeGrains(nodeBelong,nodeLoc,grainMat)
%removeGrains Function to remove grains that have been collapsed
% do so by finding any grains that have less than 3 nodes related to it

maxGrainNum=max(max(nodeBelong));
grainsToRemove=[];

for g = 1:maxGrainNum
    
    if grainMat(g,2)==0
        continue;
    end
    
    %Array to hold the nodes associated with each grain
    %Temp array that resets
    grainNodes=[];
    
    for i=1:length(nodeBelong)
        if ismember(g,nodeBelong(i,:))
            grainNodes=[grainNodes;nodeLoc(i,1),nodeLoc(i,2)];
        end
    end
    
    %Count the number of nodes associated with the grains
    [numNodes,~]=size(grainNodes);
    
    %Delete the grain if there are less than 3 nodes associated with it
    if numNodes<3
        grainsToRemove=[g,grainsToRemove]; %add to the front of the array
        fprintf("Removing grain %i\n",g);
    end
end

%Remove the nodes in backwards order from highest
if ~isempty(grainsToRemove)
    
    for g=1:length(grainsToRemove)
        nodeBelong(nodeBelong==grainsToRemove(g))=0;
        grainMat(grainsToRemove(g),2)=0; %turn off the display of the grain
    end
end

end

