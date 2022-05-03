function [grid] = continuousToGrid(nodeLoc,nodeBelong,grainMat,OriginalGridLength,DesiredGridLength)
%continuousToGrid Function to convert a continuous form grain structure to
%a grid-form grain structure given node locations, connectivity, grain/node
%ownership, and the ideal grid size.

%OriginalGridLength = the size of original grid in pixels
%DesiredGridLength = size of the grid to be output

%Output is a matrix with size (castgridLength, castgridLength) which each
%cell assigned an integer value to associate it with a grain. Integer
%values can be skipped if the "grain display" binary indicator is turned
%off (which shows the grain has been removed from the system)

grid = zeros(DesiredGridLength,DesiredGridLength);

%Build the vectors to hold locations on the grid. Ensure that they are the
%proper lenght of the true grid (max min distances matter in the continuous
%representation of the network)
[xloc,yloc] = meshgrid(linspace(1,OriginalGridLength,DesiredGridLength),...
    linspace(1,OriginalGridLength,DesiredGridLength)); 
xloc = xloc(:);
yloc = yloc(:);

numGrains = length(grainMat);

grainCounter = 1;

for g = 1:numGrains
    
    if grainMat(g,2)==0 %skip the grain if the display indicator is turned off
        continue;
    end
    
    grainNodePos = [];
    grainNodeID = [];
    %Loop through all the grains to construct the internal connectivity
    for r = 1:length(nodeBelong)
        if ismember(g,nodeBelong(r,:))
            grainNodePos=[grainNodePos;nodeLoc(r,1),nodeLoc(r,2)];
            grainNodeID=[grainNodeID,r];
        end
    end    
    
    %Skip the grain if there are no nodes associated with it
    if isempty(grainNodePos)
        continue;
    end
    
    %% Order the points that outline the grain boundaries
        
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    
    
    %Find which points lie in the polygon
    in = inpolygon(xloc,yloc,grainNodePos(b,1),grainNodePos(b,2));
    
    %Assign those points to the proper grain
    grid(in)=grainCounter;
    
    grainCounter=grainCounter+1;
    
end

end

