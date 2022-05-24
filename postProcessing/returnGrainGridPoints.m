function [gridPoints] = returnGrainGridPoints(gridPoints,nodeBelong,nodeLoc,grainMat,segRadius,constants)
%returnGrainGridPoints Function to return the points associated with a
%given grain

%Number of unique grains
numGrains = length(grainMat);
gridLength=constants.gridSize;


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
        grainArea(g)=0;
        continue;
    end
    
    %% Order the grain boundaries
    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2));
    
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundayr matrix by hand
    b=[b;b(1)]; %add the connection to the first node
    
    %Ordered list of points - add the starting point manually
    orderedGrainPoints = grainNodePos(b(1),:);
    
    %% Draw boundaries with a radius
    numberOfArcPoints=8; %number of points to draw along the arc
    for p = 1:length(b)-1
        ind1=grainNodeID(b(p));  %gather the true indexes of the points
        ind2=grainNodeID(b(p+1));
        
        %set the default value of the curvatures to be zero. If there is no
        %driving force to produce curvature then skip the creation of the
        %arc points. Also skip if boundary segment
        if segRadius(ind1,ind2)==0
            orderedGrainPoints=[orderedGrainPoints;grainNodePos(b(p+1),:)];%add the next vertex and skip curvature points
            continue;
        end
        
        %Skip the curvature if it is a boundary segment 
        if ismember(1,nodeLoc(ind1,:)) || ismember(gridLength,nodeLoc(ind1,:))
            if ismember(1,nodeLoc(ind2,:)) || ismember(gridLength,nodeLoc(ind2,:))
                orderedGrainPoints=[orderedGrainPoints;grainNodePos(b(p+1),:)]; %add the next vertex and skip curvature points
                continue;
            end
        end
        
        %% Generate the curvature point given the segment radii
        curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points        %curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points

        grainNodePos=[grainNodePos;curvePoints]; %append the new points to the list of existing points
        
        %Add the GB points to a list manually, which will by default be in
        %the right order
        orderedGrainPoints=[orderedGrainPoints;curvePoints;grainNodePos(b(p+1),:)];

    end
    
    %Query which points are inside the polygon
    in = inpolygon(gridPoints(:,1),gridPoints(:,2),orderedGrainPoints(:,1),orderedGrainPoints(:,2));
    
    %Set any values that are -1 to the appropriate value
    gridPoints(in & gridPoints(:,3)==-1 ,3)=g;
    
    %Set any values that were previously outside of this grain, and are now
    %inside, to 0
    gridPoints(in & gridPoints(:,3)~=g ,3)=0;
end


end

