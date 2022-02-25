function [dd_average] = extractDislocationDensity(storedInfo,gridSize,iterOfInterest)
%extractDislocationDensity Function to return the average dislocation
%density of a microstructure by using a weighted average the dislocation
%densities from each grain 

iter = iterOfInterest; %find the iteration to extract dislocatio density

nodeLoc=storedInfo{iter,1};
nodeBelong=storedInfo{iter,2};
grainMat=storedInfo{iter,4};

%Weighted average of the dislocation density
dd_average = 0;

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

    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundary matrix by hand
    b=[b;b(1)]; %add the connection to the first node    

    %Find the shape
    pshape = polyshape(grainNodePos(b,1),grainNodePos(b,2));    

    %Calculate the area of the grain
    estArea = area(pshape);

    %Add sum to weighted average
    dd_average = dd_average + estArea * grainMat(g,6) /(gridSize*gridSize);

end

end








