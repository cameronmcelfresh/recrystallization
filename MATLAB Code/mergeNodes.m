function [nodeLoc,nodeBelong,nodeConnect,segRadius,nodeVel] = mergeNodes(nodeElim,nodeAbsorb,nodeLoc,nodeBelong,nodeConnect,nodeVel,segRadius,gridLength)
%mergeNodes Function to merge two nodes
%   nodeElim is the node being eliminated
%   nodeAbsorb is the node absorbing the nodeElim

[~,cols] = size(nodeBelong); %extract the number of possible connections

oldPos = nodeLoc(nodeElim,:); %old node position

newPos=[];

%If the node is on the edge on the boundary then make sure it stays there
if ismember(1,[nodeLoc(nodeAbsorb,:),oldPos]) || ismember(gridLength,[nodeLoc(nodeAbsorb,:),oldPos])
    
    %X position
    if ismember(1,[nodeLoc(nodeAbsorb,1),oldPos(1)])
       newPos(1)=1;
    elseif ismember(gridLength,[nodeLoc(nodeAbsorb,1),oldPos(1)])
        newPos(1)=gridLength;
    else
        newPos(1) = (nodeLoc(nodeAbsorb,1)+oldPos(1))/2;
    end
    
    %Y position
    if ismember(1,[nodeLoc(nodeAbsorb,2),oldPos(2)])
       newPos(2)=1;
    elseif ismember(gridLength,[nodeLoc(nodeAbsorb,2),oldPos(2)])
        newPos(2)=gridLength;
    else
        newPos(2) = (nodeLoc(nodeAbsorb,2)+oldPos(2))/2;
    end    
else
    newPos = (nodeLoc(nodeAbsorb,:)+oldPos)/2; %averaged position
end

%note that this averaging moves away from the gridded axis that we use

%% Update physical position
nodeLoc(nodeAbsorb,:)=newPos; %update position
nodeLoc(nodeElim,:)=[]; %remove old node

%% Update the node velocity list
nodeVel(nodeElim,:)=[];

%% Update the nodeBelong matrix

%Pass along any grain connections from the node being eliminated
for j = 1:cols
    if ~ismember(nodeBelong(nodeElim,j),nodeBelong(nodeAbsorb,:))       
        for k = 1:cols %find a place to put the new connection
            if nodeBelong(nodeAbsorb,k)==0
                nodeBelong(nodeAbsorb,k)=nodeBelong(nodeElim,j);
                fprintf("\tPassing connection to %i to node %i\n", j,nodeAbsorb);
                break;
            end
        end

    end
end

nodeBelong(nodeElim,:)=[]; %eliminate the node

%% Update the connectivity and segRadius matrix and nodeBelong

%pass over the node-node connections
for i = 1:length(nodeConnect)
    if nodeConnect(nodeElim,i)==1
        
        if i==nodeAbsorb %do not pass along the self-connection (i.e. node 6 -> node 6)
            continue
        else 
            %Pass the connections
            nodeConnect(nodeAbsorb,i)=1;
            nodeConnect(i,nodeAbsorb)=1;
            
            %Pass the segment radii
            segRadius(nodeAbsorb,i)=segRadius(nodeElim,i);
            segRadius(i,nodeAbsorb)=segRadius(nodeElim,i);
        end
        
    end
end

%remove the rows/columns attached to the column being removed
%subtract one from the nodes with row values ABOVE the nodeElim to shift
%the labels

nodeConnect(:,nodeElim)=[];
nodeConnect(nodeElim,:)=[];

%% Eliminate the segment radius for the specified nodes

segRadius(:,nodeElim)=[];
segRadius(nodeElim,:)=[];


end

