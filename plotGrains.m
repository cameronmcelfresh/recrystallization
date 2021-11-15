function  plotGrains(grid,nodeBelong,nodeLoc,nodeConnect,grainMat,C)
%plotGrains Function to plot the grains given positions and a connectivity
%matrix. Plot utilizes polygon plotting as opposed to the grid system

%Number of unique grains
numGrains = length(unique(grid));
[gridLength,~]=size(grid);

% figure
% title("Grain Outline")
% 
% for i=1:length(nodeConnect)
%     for j = 1:length(nodeConnect)
%         if nodeConnect(i,j)==1
%             
%             plot([nodeLoc(i,1),nodeLoc(j,1)],[nodeLoc(i,2),nodeLoc(j,2)])
%             hold on
%             
%             if  i>j
%                 avgX = (nodeLoc(i,1)+nodeLoc(j,1))/2;
%                 avgY = (nodeLoc(i,2)+nodeLoc(j,2))/2;
% 
%                 text(avgX,avgY,string(j+"->"+i));
%             end
%         end
%     end
% end
% scatter(nodeLoc(:,1),nodeLoc(:,2),55,'filled');


%% Now plot it using polygons

grainAreaSum=0; %running sum of the total area of all grains (sense check) 

title("Polyplot Grains")
for g = 1:numGrains
    
    if grainMat(g,2)==0 %skip the grain if the display indicator is turned off
        continue;
    end
    
    grainNodePos = [];
    
    %Loop through all the grains to construct the internal connectivity
    for r = 1:length(nodeBelong)
        if ismember(g,nodeBelong(r,:))
            grainNodePos=[grainNodePos;nodeLoc(r,1),nodeLoc(r,2)];
        end
    end    
    
    %Skip the grain if there are no nodes associated with it
    if isempty(grainNodePos)
        continue;
    end
    
    b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2));
    
    %b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundayr matrix by hand
    %b=[b;b(1)]; %add the connection to the first node
    
    %Warning Catching
    %Can turn off warning if needed
    warning('off','MATLAB:polyshape:repairedBySimplify');
    
    %Plot the shape
    pshape = polyshape(grainNodePos(b,1),grainNodePos(b,2));    
    plot(pshape,'FaceColor',C(g,:))
    
    %Capture the area
    grainAreaSum = grainAreaSum+ polyarea(grainNodePos(b,1),grainNodePos(b,2));
    
%     [warnMsg, ~] = lastwarn;
%     if ~isempty(warnMsg)    
%         fprintf("Warning printing grain %i\n",g);
%     end
    
    hold on
    
    text(mean(grainNodePos(:,1)),mean(grainNodePos(:,2)),string(g));
    
end

fprintf("Total Grain Area =  %.3f %%\n",grainAreaSum*100/((gridLength-1)*(gridLength-1)));

end

