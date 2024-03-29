function [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = requireTripleJunctions(nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance)
%requireTripleJunctions Function to go through the node connectivity and
%remove any quadruple junctions that exist

numNodes = length(nodeConnect);
splitDist=1.25*minRemeshDistance; %arbitrary distance to split the nodes 

%% Find all the junctions with >3 connections

n=1;
while n<numNodes+1
    numGrainsPartOf = length(unique(nodeBelong(n,:)))-1; % number of grains that this node is a part of
    numConnects = sum(nodeConnect(n,:)); % number of connections out of this node
    
    if numGrainsPartOf==5        
       fprintf("\tNode %i belongs to >4 grains (%i grains,quadruple+ junction)\n",n,numGrainsPartOf);
       [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = randomSplit5WayNode(n,nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel,minRemeshDistance); 
       n=1;
       continue;
    end
    
    %If the node belongs to more than 3 grains and more than 3 connections
    if numGrainsPartOf >3 && numConnects>3

        fprintf("\tNode %i belongs to >3 grains (%i grains,quadruple+ junction)\n",n,numGrainsPartOf);
        
        if any(nodeLoc(n,:)==0)&& any(nodeLoc(n,:)==max(max(nodeLoc)))
            fprintf("\t\tNode %i is a boundary node, skipping (%.1f,%.1f)\n",n,nodeLoc(n,1),nodeLoc(n,2));
            n=n+1;
            continue
        end

        %% Split each of the quadruple junctions into 2 triple junctions

       nodeRemoveID=n; %node to be removed

       %Find the connecting nodes and the clockwise order they're situated
       connectNodes = find(ismember(nodeConnect(:,nodeRemoveID),1,'rows'));
       connectNodePos= nodeLoc(connectNodes,:); %position of the nodes connecting to the quadruple junction
       elimNodePos = nodeLoc(n,:);

       b = clockWiseOrder(connectNodePos(:,1),connectNodePos(:,2)); %construct the boundayr matrix by hand

       %Therefore the possible triple junction pairing as shown below, where
       %column 1/2 are the first triple junction and column 2/3 are the second.
       %each row corresponds to a different ordering of the triple junction
       
       %Check if this is a boundary node
       try
           %try to treat it like a regular node...
           pairs = [connectNodes(b(1)),connectNodes(b(2)),connectNodes(b(3)),connectNodes(b(4));...
                    connectNodes(b(2)),connectNodes(b(3)),connectNodes(b(4)),connectNodes(b(1))]; 
       catch
           % if that fails, check if it is a boundary node, if so, skip it
           if any(nodeLoc(n,:)==0)  || any(nodeLoc(n,:) == max(max(nodeLoc)))
               n=n+1;
               continue;
           end
       end

       %Find the location of the possible splits
       bisectors=[(connectNodePos(b(1),:)+connectNodePos(b(2),:))/2-(connectNodePos(b(3),:)+connectNodePos(b(4),:))/2;...
           (connectNodePos(b(2),:)+connectNodePos(b(3),:))/2-(connectNodePos(b(4),:)+connectNodePos(b(1),:))/2];

       bisectors(1,:)=bisectors(1,:)/norm(bisectors(1,:)); %normalize the vectors
       bisectors(2,:)=bisectors(2,:)/norm(bisectors(2,:)); %normalize the vectors

       %Find where the new nodes would exist. Each row corresponds to one of
       %the two options
       newNodePos=[elimNodePos+bisectors(1,:)*splitDist/2,elimNodePos-bisectors(1,:)*splitDist/2;
           elimNodePos+bisectors(2,:)*splitDist/2,elimNodePos-bisectors(2,:)*splitDist/2]; 

       %Check which split would lead to the lower energy triple junction pair
       energyValues=[];

       for splitChoice = 1:2

           [~,nodeLocTEMP,nodeConnectTEMP,~,~] = splitNodes(newNodePos(splitChoice,[1,2]),...
               newNodePos(splitChoice,[3,4]),...
               pairs(splitChoice,[1,2]),...
               pairs(splitChoice,[3,4]),...
               nodeRemoveID,...
               nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel);
                       
           %Calculate the energ of the split as the sum over both nodes
           energyValues(splitChoice) = nodeEnergy(numNodes,nodeLocTEMP,nodeConnectTEMP);
           energyValues(splitChoice) = energyValues(splitChoice)+nodeEnergy(numNodes+1,nodeLocTEMP,nodeConnectTEMP);
       end
       %Place the new node in the list and update the necessary connecitivty,
       %locations, etc.

       [~,bestChoice] = max(energyValues); %here we're really taking the minimum energy configuration by maximizing sin(theta)*sin(theta)*sin(theta)

       fprintf("Old Node Position: %.1f,%.1f\n",nodeLoc(nodeRemoveID,1),nodeLoc(nodeRemoveID,2));
       fprintf("New Node Position1: %.1f,%.1f\n",newNodePos(bestChoice,1),newNodePos(bestChoice,2));
       fprintf("New Node Position2: %.1f,%.1f\n",newNodePos(bestChoice,3),newNodePos(bestChoice,4));

       [nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel] = splitNodes(newNodePos(bestChoice,[1,2]),...
        newNodePos(bestChoice,[3,4]),...
        pairs(bestChoice,[1,2]),...
        pairs(bestChoice,[3,4]),...
        nodeRemoveID,...
        nodeBelong,nodeLoc,nodeConnect,segRadius,nodeVel);

        fprintf("\tRemoved node %i and added nodes %i and %i\n",nodeRemoveID,length(nodeConnect)-1, length(nodeConnect));
        
        %size(nodeBelong)
        %size(nodeLoc)
        %size(nodeConnect)
        %length(nodeConnect)
        %break; %only do one new junction at a time for now for debugging
    end
    n=n+1;
end


end

