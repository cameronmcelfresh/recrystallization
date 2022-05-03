function [nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,nodeVel] = grainRemesh(nodeBelong,nodeLoc,nodeConnect,grainMat,minGrainArea,segRadius,nodeVel,gridLength)
%grainRemesh Function to remove grains that have an area below the
%minGrainArea cutoff

maxGrainNum=max(max(nodeBelong));
grainsToRemove=[];

for g = 1:maxGrainNum
    
    if grainMat(g,2)==0 %if the grain is already not displayed (i.e. removed) then skip it
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
    
    %Calculate the area within the grain
    b=boundary(grainNodes(:,1),grainNodes(:,2),0.01);
    grainArea = polyarea(grainNodes(b,1),grainNodes(b,2));
    
    %Delete the grain if there are less than 3 nodes associated with it
    if grainArea<minGrainArea
        grainsToRemove=[g,grainsToRemove]; %add to the front of the array
        fprintf("Removing grain %i at %.1f, %.1f\n",g,mean(grainNodes(:,1)),mean(grainNodes(:,2)));
        %pause(3)
    end
end

%% Remove the grains in backwards order from highest

%save a list nodes that absorb other nodes to make sure that the joining
%segments don't create any nodes that only span direct lines
boundaryNodes=[];


if ~isempty(grainsToRemove)
    
    for g=1:length(grainsToRemove)
        
        grainRemoving=grainsToRemove(g);
        
        %Collapse the closest nodes one by one until the grain becomes a
        %line
        
        %Count the number of nodes associated with the grain the node locations
        NumGrainNodes=0;
        for i=1:length(nodeBelong)
            if ismember(grainRemoving,nodeBelong(i,:))
                NumGrainNodes=NumGrainNodes+1;
            end
        end        
        
        for i = 1:NumGrainNodes-2 %collapse the nearest nodes one by one
            %Find all the node positions first. Nodes to be reduced by 1
            %each time
            grainNodes=[]; %holds x,y position of the nodes in this grain
            grainNodeID=[]; %holds the ID of the nodes in the grain

            for j=1:length(nodeBelong)
                if ismember(grainRemoving,nodeBelong(j,:))
                    grainNodes=[grainNodes;nodeLoc(j,1),nodeLoc(j,2)];
                    grainNodeID=[grainNodeID,j];
                end   
            end
            
            node1=0; %to hold the ID of the two nodes that will be merged
            node2=0;
            minDist=10000; %arbitrarily high number, to hold the minimum distance between nodes
            
            for n1 = 1:length(grainNodes)
                for n2 = 1:length(grainNodes)
                    
                    if n1==n2
                        continue;
                    end
                    
                    dist = ((grainNodes(n1,1)-grainNodes(n2,1))^2+(grainNodes(n1,2)-grainNodes(n2,2))^2)^0.5;
                    
                    %Reassign the minimum distance if necessary
                    if dist<minDist
                        minDist=dist;
                        node1=n1;
                        node2=n2;
                    end
                end
            end
            
            
            %Merge the two nearest nodes
            [nodeLoc,nodeBelong,nodeConnect,segRadius,nodeVel] = mergeNodes(grainNodeID(node1),grainNodeID(node2),nodeLoc,nodeBelong,nodeConnect,nodeVel,segRadius,gridLength);
            
            
%             %Add the boundary nodes (with adjusted positions)
%             adjacentNodesAdd = find(nodeConnect(:,grainNodeID(node1)))==1;%             %Add the boundary node to the list to make a sense check
%             %afterwards
%             if ~ismember(grainNodeID(node2),boundaryNodes)
%                 boundaryNodes=[boundaryNodes,grainNodeID(node2)];
%             end
%             
%             %Remove the node being eliminated so we don't accidentally
%             %check it
%             if ismember(grainNodeID(node1),boundaryNodes)
%                 boundaryNodes(boundaryNodes==grainNodeID(node1))=[];
%             end
            
        end
        
        %Remove all the grains that are below the minimum area
        nodeBelong(nodeBelong==grainRemoving)=0;
        grainMat(grainRemoving,2)=0; %turn off the display of the grain
    end

    %% Check the 'boundaryNodes' to ensure that we don't have any straight triple-segments

    fprintf("\tChecking nodes for straight junctions...\n");

    %for n = 1:length(boundaryNodes)
    for n = 1:length(nodeConnect)

        %Node being examined
        %nodeOfInterest=boundaryNodes(n);
        nodeOfInterest=n; %try checking all the nodes for now...
        %fprintf("\tchecking node %i\n",nodeOfInterest);

        %If we've reached the end of the list (after removing a node), break
        %out
        if n>length(nodeLoc)
            break;
        end

        %Don't perform check if it is a boundary node
        if ismember(1,nodeLoc(nodeOfInterest,:)) || ismember(gridLength,nodeLoc(nodeOfInterest,:))
            continue
        end

        %Count the number of nodes that the node is a part of
        numAdjacentGrains=length(unique(nodeBelong(nodeOfInterest,:)))-1; %don't count 0 as a unique grain

        %If there are less than 3 grains associated with a node then we are
        %over-discretizing one of the boundaries
        if numAdjacentGrains<3
            fprintf("\tchecking node %i - less than 3 junction\n",nodeOfInterest);
            attachedNodes = [];
            %Gather the node's 2 connections
            for j = 1:length(nodeConnect)
                if nodeConnect(nodeOfInterest,j)==1 %add the attached nodes
                    attachedNodes=[attachedNodes,j];
                end
            end

            if length(attachedNodes)>2 %warning
                fprintf("\t\tWarning, something weird happened with node removal...\n");
            end

            %Connect the nodes to one another
            nodeConnect(attachedNodes(1),attachedNodes(2))=1;
            nodeConnect(attachedNodes(2),attachedNodes(1))=1;

            %Eliminate the node
            nodeLoc(nodeOfInterest,:)=[]; %remove old node
            nodeBelong(nodeOfInterest,:)=[]; %eliminate the old node from the nodeBelong matrix
            nodeConnect(:,nodeOfInterest)=[]; %remove the row/column associated with the node in the connectivity matrix
            nodeConnect(nodeOfInterest,:)=[];
            segRadius(:,nodeOfInterest)=[]; %remove the row/column associated with the node in the segment radius matrix
            segRadius(nodeOfInterest,:)=[];
            nodeVel(nodeOfInterest,:)=[]; %remove the node velocity
            
            fprintf("\t\tRemove node %i because redundant - adding node %i -> %i connection\n",nodeOfInterest, attachedNodes(1),attachedNodes(2));
        end

    end

end %end if ~isempty(grainsToRemove)


end
