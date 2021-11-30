function [runningGrainSize,runningGrainCount] = grainAnalysis(storedInfo,maxIter,gridSize)
%grainAnalysis Function to analyze the change in grain size and count over
%time. Returns the circle estimation diameter distriubtion of grain sizes

runningGrainSize=zeros(maxIter,1); %running list to hold the average grain size with circular diameter
runningGrainArea=zeros(maxIter,1); %running list to hold the average grain size
runningGrainCount=zeros(maxIter,1); %running list to hold the number of grains

for iter = 1:maxIter %loop through each timestep

    nodeLoc=storedInfo{iter,1};
    nodeBelong=storedInfo{iter,2};
    %nodeConnect=storedInfo{iter,3};
    grainMat=storedInfo{iter,4};

    grainSize=[]; %running sum of the total area of all grains (sense check) 
    grainArea = [];

    numGrains = max(max(nodeBelong));
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

        %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01);    

        b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundary matrix by hand
        b=[b;b(1)]; %add the connection to the first node    
        
        %Plot the shape
        pshape = polyshape(grainNodePos(b,1),grainNodePos(b,2));    

        %Calculate the diameter from the area
        %estArea = polyarea(grainNodePos(b,1),grainNodePos(b,2));
        estArea = area(pshape);
        estDiameter = 2*(estArea/3.1415)^(0.5);
        grainSize = [grainSize;estDiameter];
        
        grainArea = [grainArea;estArea];

    end

    runningGrainCount(iter)=length(grainSize);
    runningGrainArea(iter)=mean(grainArea);
    %runningGrainSize(iter)=2*(gridSize*gridSize/length(grainSize)/3.1415)^(0.5);
    runningGrainSize(iter)=mean(grainSize);
    
    if iter==1
        %bins = 0:10:200;
        figure
        histogram(grainSize,25);
        hold on
    elseif iter == maxIter
        %bins = 0:10:200;
        histogram(grainSize,25);
        title("Grain Size Distribution (before and after RX)");
        ylabel("Frequency of Grain Size");
        xlabel("Grain Size");
    end

end

%Plot the evolution of the grain size and count
figure
yyaxis left
plot(runningGrainCount);
xlabel("Iteration");
ylabel("Number of Grains");
hold on

yyaxis right
plot(2*(runningGrainArea./3.1415).^0.5);
ylabel("Average Grain Diameter");


end

