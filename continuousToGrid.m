function [grid] = continuousToGrid(nodeLoc,nodeBelong,grainMat,trueGridLength,castgridLength)
%continuousToGrid Function to convert a continuous form grain structure to
%a grid-form grain structure given node locations, connectivity, grain/node
%ownership, and the ideal grid size.

%Output is a matrix with size (castgridLength, castgridLength) which each
%cell assigned an integer value to associate it with a grain. Integer
%values can be skipped if the "grain display" binary indicator is turned
%off (which shows the grain has been removed from the system)

grid = zeros(castgridLength,castgridLength);

%Build the vectors to hold locations on the grid. Ensure that they are the
%proper lenght of the true grid (max min distances matter in the continuous
%representation of the network)
[xloc,yloc] = meshgrid(linspace(1,trueGridLength,castgridLength),...
    linspace(1,trueGridLength,castgridLength)); 
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
    
    b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    
    
%     %% Draw boundaries with a radius
%     numberOfArcPoints=5; %number of points to draw along the arc
%     for p = 1:length(b)-1
%         ind1=grainNodeID(b(p));  %gather the true indexes of the points
%         ind2=grainNodeID(b(p+1));
%         
%         %set the default value of the curvatures to be zero. If there is no
%         %driving force to produce curvature then skip the creation of the
%         %arc points. Also skip if boundary segment
%         if segRadius(ind1,ind2)==0
%             continue;
%         end
%         
%         %Skip the curvature if it is a boundary segment 
%         if ismember(1,nodeLoc(ind1,:)) || ismember(gridLength,nodeLoc(ind1,:))
%             if ismember(1,nodeLoc(ind2,:)) || ismember(gridLength,nodeLoc(ind2,:))
%                 continue;
%             end
%         end
%         
%         %% Generate the curvature point given the segment radii
%         %curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points        %curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points
% 
%         %grainNodePos=[grainNodePos;curvePoints]; %append the new points to the list of existing points
%         %hold on
%         %scatter(curvePoints(:,1), curvePoints(:,2));
%     end
    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    
    
    %Find which points lie in the polygon
    in = inpolygon(xloc,yloc,grainNodePos(b,1),grainNodePos(b,2));
    
    %Assign those points to the proper grain
    grid(in)=grainCounter;
    
    grainCounter=grainCounter+1;
    
end

end

