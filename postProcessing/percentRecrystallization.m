function [percentRX] = percentRecrystallization(storedInfo,maxIter,constants)
%percentRecrystallization Function to calculate the percent
%recrystalliation of a microstructure as a function of time

percentRX = zeros(maxIter-1,1);

%Make variables that we can overwrite
nodeLoc=storedInfo{1,1};
nodeBelong=storedInfo{1,2};
grainMat=storedInfo{1,4};
segRadius=storedInfo{1,5};

nodeLocNEXT = [];
nodeBelongNEXT=[];
grainMatNEXT = [];
segRadiusNEXT = [];

grainArea=zeros(length(grainMat),1);
grainAreaNEXT = grainArea;

%% Calculate the starting area of each grain
grainArea = returnGrainArea(nodeBelong,nodeLoc,grainMat,segRadius,constants);

%% Iterate through all the grains to find the change in area
for iter = 1:maxIter-1 %loop through each timestep
    
    nodeLocNEXT=storedInfo{iter+1,1};
    nodeBelongNEXT=storedInfo{iter+1,2};
    grainMatNEXT=storedInfo{iter+1,4};
    segRadiusNEXT=storedInfo{iter+1,5};
    
    grainAreaNEXT = returnGrainArea(nodeBelongNEXT,nodeLocNEXT,grainMatNEXT,segRadiusNEXT,constants);

    %Calculate the area RX
    changedArea = grainAreaNEXT-grainArea; %calculate the change in area
    if iter>1
        percentRX(iter) = percentRX(iter-1)+sum(abs(changedArea(changedArea<0)))/(constants.gridSize)^2; %convert to percentage
    else
        percentRX(iter) = sum(abs(changedArea(changedArea<0)))/(constants.gridSize)^2; %convert to percentage
    end
    
    
    %Shift all variables before repeating
    grainArea = grainAreaNEXT; 
    nodeLoc=nodeLocNEXT;
    nodeBelong=nodeBelongNEXT;
    grainMat=grainMatNEXT;
end


end

