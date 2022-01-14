function  plotGrains(nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,constants)
%plotGrains Function to plot the grains given positions and a connectivity
%matrix. Plot utilizes polygon plotting as opposed to the grid system

%% Extract needed constants
C = constants.C; %extract the colormap
plotNodeNumbers = constants.plotNodeNumbers; 

%Number of unique grains
numGrains = length(grainMat);
gridLength=constants.gridSize;

%Min and max dislocation densities for plotting purposes
minDislocationDensity=constants.minDislocationDensity; 
maxDislocationDensity=constants.maxDislocationDensity; 


%% Begin plotting
if constants.plotBoundaries == 1 
    title("Grain Outline")
    for i=1:length(nodeConnect)
        for j = 1:length(nodeConnect)
            if nodeConnect(i,j)==1

                 %Extract the curvature points
                 curvePoints = arcPoints(nodeLoc(i,:),nodeLoc(j,:),segRadius(i,j),5); %calculate the curvature point
                 plot([nodeLoc(i,1);curvePoints(:,1);nodeLoc(j,1)],[nodeLoc(i,2);curvePoints(:,2);nodeLoc(j,2)]);
                 hold on

                if plotNodeNumbers==1
                    if  i>j
                        avgX = (nodeLoc(i,1)+nodeLoc(j,1))/2;
                        avgY = (nodeLoc(i,2)+nodeLoc(j,2))/2;
                        text(avgX,avgY,string(j+"->"+i));
                    end
                end
            end
        end
    end
    scatter(nodeLoc(:,1),nodeLoc(:,2),55,'filled');
    
    return %exit the function before plotting the other variables
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
    
    grainNodePosCopy =grainNodePos; % copy of original grain corners to find center for grain number plotting
    
    %Skip the grain if there are no nodes associated with it
    if isempty(grainNodePos)
        continue;
    end
    
    %% Order and then plot the grain boundaries
    
    b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2));
    
    %b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundayr matrix by hand
    %b=[b;b(1)]; %add the connection to the first node
    
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
    
    %plot the dislocation density if specified
    if constants.plotDislocationDensity
        %cmap = jet(256);
        cmap = gray(256);
        
        cmap=flipud(cmap); %flip the colormap upside down
        
        dislocationFraction = (grainMat(g,6)-minDislocationDensity)/(maxDislocationDensity-minDislocationDensity);
        
        colorInd = round(dislocationFraction*256);
        
        if colorInd>256
            colorInd=256;
        elseif colorInd<1
            colorInd=1;
        end
        
        colorShade = cmap(colorInd,:);
        
        %Scale the dislocation density between the minimum and maximum
        plot(pshape,'FaceColor',colorShade);
    else
         plot(pshape,'FaceColor',C(g,:))
    end
    
    %Capture the area
    %grainAreaSum = grainAreaSum+ polyarea(grainNodePos(b,1),grainNodePos(b,2));
    grainAreaSum = grainAreaSum+ polyarea(orderedGrainPoints(:,1),orderedGrainPoints(:,2));
    
    hold on
    
    %plot the grain numbers if needed
    if constants.plotNodeNumbers
        text(mean(grainNodePosCopy(:,1)),mean(grainNodePosCopy(:,2)),string(g));
    end
end

if constants.plotDislocationDensity %plot the colorbar for the dislocation density coloring if needed
    colormap(flipud(gray(256)));
   
    %Amount to add each step
    stepSize = (maxDislocationDensity-minDislocationDensity)/4;
    
    colorbarObject =colorbar('Ticks',[0,...
        0.25,...
        0.5,...
        0.75,....
        1],...
         'TickLabels',{sprintf('%.2e',minDislocationDensity),...
         sprintf('%.2e',minDislocationDensity+stepSize*1),...
         sprintf('%.2e',minDislocationDensity+stepSize*2),...
         sprintf('%.2e',minDislocationDensity+stepSize*3),...
         sprintf('%.2e',maxDislocationDensity)} );
     
     colorbarObject.Label.String = 'Dislocation Density [m^-2]';
end

fprintf("Total Grain Area =  %.3f %%\n",grainAreaSum*100/((gridLength-1)*(gridLength-1)));
end

