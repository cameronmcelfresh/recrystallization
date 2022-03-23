function [grainArea] = returnGrainArea(nodeBelong,nodeLoc,grainMat,segRadius,constants)
%returnGrainArea Function to return the area of each grain in a
%microstructure

%Number of unique grains
numGrains = length(grainMat);
gridLength=constants.gridSize;

grainArea = zeros(numGrains,1); 

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
    
    %% Order and then plot the grain boundaries
    
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
    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    
    %% Plot Radius
    
    %Warning Catching
    %Can turn off warning if needed
    warning('off','MATLAB:polyshape:repairedBySimplify');
    
    %Plot the shape
    %pshape = polyshape(grainNodePos(b,1),grainNodePos(b,2));    
    pshape = polyshape(orderedGrainPoints(:,1),orderedGrainPoints(:,2));   
    
    %Capture the area
    %grainAreaSum = grainAreaSum+ polyarea(grainNodePos(b,1),grainNodePos(b,2));
    grainArea(g) = polyarea(orderedGrainPoints(:,1),orderedGrainPoints(:,2));
    
end


end

