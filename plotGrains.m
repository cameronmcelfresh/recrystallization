function  plotGrains(grid,nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,C,plotNodeNumbers)
%plotGrains Function to plot the grains given positions and a connectivity
%matrix. Plot utilizes polygon plotting as opposed to the grid system

%Number of unique grains
numGrains = length(unique(grid));
[gridLength,~]=size(grid);

if plotNodeNumbers == 1 
    figure
    title("Grain Outline")
    for i=1:length(nodeConnect)
        for j = 1:length(nodeConnect)
            if nodeConnect(i,j)==1

                 %Extract the curvature points
                 curvePoints = arcPoints(nodeLoc(i,:),nodeLoc(j,:),segRadius(i,j),5); %calculate the curvature point
                 plot([nodeLoc(i,1);curvePoints(:,1);nodeLoc(j,1)],[nodeLoc(i,2);curvePoints(:,2);nodeLoc(j,2)]);
                 hold on

                if  i>j
                    avgX = (nodeLoc(i,1)+nodeLoc(j,1))/2;
                    avgY = (nodeLoc(i,2)+nodeLoc(j,2))/2;
                    text(avgX,avgY,string(j+"->"+i));
                end
            end
        end
    end
    scatter(nodeLoc(:,1),nodeLoc(:,2),55,'filled');
end

%% Now plot it using polygons

grainAreaSum=0; %running sum of the total area of all grains (sense check) 

title("Polyplot Grains")
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
    
    %% Order and then plot the grain boundaries
    
    b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2));
    
    %b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundayr matrix by hand
    %b=[b;b(1)]; %add the connection to the first node
    
    %% Draw boundaries with a radius
    numberOfArcPoints=5; %number of points to draw along the arc
    for p = 1:length(b)-1
        ind1=grainNodeID(b(p));  %gather the true indexes of the points
        ind2=grainNodeID(b(p+1));
        
        %set the default value of the curvatures to be zero. If there is no
        %driving force to produce curvature then skip the creation of the
        %arc points. Also skip if boundary segment
        if segRadius(ind1,ind2)==0
            continue;
        end
        
        %Skip the curvature if it is a boundary segment 
        if ismember(1,nodeLoc(ind1,:)) || ismember(gridLength,nodeLoc(ind1,:))
            if ismember(1,nodeLoc(ind2,:)) || ismember(gridLength,nodeLoc(ind2,:))
                continue;
            end
        end
        
        %% Generate the curvature point given the segment radii
        curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points        %curvePoints = arcPoints(grainNodePos(b(p),:),grainNodePos(b(p+1),:),segRadius(ind1,ind2),numberOfArcPoints); %calculate the curvature points

        grainNodePos=[grainNodePos;curvePoints]; %append the new points to the list of existing points
        %hold on
        %scatter(curvePoints(:,1), curvePoints(:,2));
    end
    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    
    %% Plot Radius
    
    %Warning Catching
    %Can turn off warning if needed
    warning('off','MATLAB:polyshape:repairedBySimplify');
    
    %Plot the shape
    pshape = polyshape(grainNodePos(b,1),grainNodePos(b,2));    
    plot(pshape,'FaceColor',C(g,:))
    
    %Capture the area
    grainAreaSum = grainAreaSum+ polyarea(grainNodePos(b,1),grainNodePos(b,2));
    
    hold on
    %scatter(grainNodePos(:,1),grainNodePos(:,2));
    text(mean(grainNodePos(:,1)),mean(grainNodePos(:,2)),string(g));
end
fprintf("Total Grain Area =  %.3f %%\n",grainAreaSum*100/((gridLength-1)*(gridLength-1)));
end

