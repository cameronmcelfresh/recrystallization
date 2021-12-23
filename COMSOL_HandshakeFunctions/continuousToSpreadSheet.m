function continuousToSpreadSheet(nodeLoc,nodeBelong,grainMat,trueGridLength,OriginalGridLength,DesiredGridLength)
%continuousToSpreadSheet Function to convert a continuous form grain structure to
%a spreadsheet structure given node locations, connectivity, grain/node
%ownership, and the ideal grid size. Function should be called after RX
%step and before the next COMSOL step. 

%trueGridLength = the size of the grid in meters
%castgridLength = the size of the grid in pixels

%Output are COMSOL-readable spreadsheets with each cell
%assigned the correct quaternion orientation. Integer
%values can be skipped if the "grain display" binary indicator is turned
%off (which shows the grain has been removed from the system).

%Create the grids to hold the orientations
gridQ1 = zeros(DesiredGridLength,DesiredGridLength);
gridQ2 = zeros(DesiredGridLength,DesiredGridLength);
gridQ3 = zeros(DesiredGridLength,DesiredGridLength);

%Build the vectors to hold locations on the grid. Ensure that they are the
%proper length of the true grid (max min distances matter in the continuous
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
    
    %Print the necessary orientations. Need to check with Nihkil on this
    %representation of quaternions for his code....
    qOrient = eul2quat(grainMat(g,3:5)); % convert to quaternion
    
    %Assign those points to the proper grain
    gridQ1(in)=qOrient(2);
    gridQ2(in)=qOrient(3);
    gridQ3(in)=qOrient(4);

    grainCounter=grainCounter+1;
    
end

%Create the files to be written to
fid1 = fopen('./COMSOL_input/orientation1.txt','w');
fid2 = fopen('./COMSOL_input/orientation2.txt','w');
fid3 = fopen('./COMSOL_input/orientation3.txt','w');

%Shift axis back to (0,0) by subtracting 1. Then multiply by the
%trueGridLength conversion factor
fprintf(fid1, '%.10e\t%.10e\t%.10e\n', [(xloc-1)*trueGridLength (yloc-1)*trueGridLength gridQ1(:)].');
fprintf(fid2, '%.10e\t%.10e\t%.10e\n', [(xloc-1)*trueGridLength (yloc-1)*trueGridLength gridQ2(:)].');
fprintf(fid3, '%.10e\t%.10e\t%.10e\n', [(xloc-1)*trueGridLength (yloc-1)*trueGridLength gridQ3(:)].');

fclose(fid1);
fclose(fid2);
fclose(fid3);

end