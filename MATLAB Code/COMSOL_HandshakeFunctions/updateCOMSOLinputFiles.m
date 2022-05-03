function updateCOMSOLinputFiles(nodeLoc,nodeBelong,OLDnodeLoc,OLDnodeBelong, grainMat,trueGridLength)
%updateCOMSOLinputFiles Function to update the COMSOL files for all points
%that changed grains. Produces a spreadsheet format for comsol to read.
%Function should be called after the RX step and before the next COMSOL
%step. 

%trueGridLength = the size of the grid in meters
%OLDnodeLoc = the node locations from before boundary updates were made
%OLDnodeBelong = the grain-node assignment from before updates were made

%Output are COMSOL-readable spreadsheets with each cell
%assigned the correct deformation, and dislocation density. 

%Build the vectors to hold locations on the grid. Ensure that they are the
%proper length of the true grid (max min distances matter in the continuous
%representation of the network)

%Read in the matrices of interest from the COMSOL output files
u1 = readmatrix("./COMSOL_output/u1.txt");
u2 = readmatrix("./COMSOL_output/u2.txt");
dislocationDensity=readmatrix("./COMSOL_output/dislocationDensity.txt");

%Extract the x-y coordinates
xlocTrue = u1(:,1);
ylocTrue = u1(:,2);

% Transform the x-y coordinates to the grid format, make sure counting starting with 1
xloc = xlocTrue/trueGridLength + 1;
yloc = ylocTrue/trueGridLength +1;

% Vectors to hold the assignments of each point
origGrainAssign = zeros(length(xloc),1);
currentGrainAssign = zeros(length(xloc),1);

numGrains = length(grainMat);

for g = 1:numGrains
    %% Assign each point in the spreadsheet to the current grain it belongs to
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
    if ~isempty(grainNodePos)   
        % Order the points that outline the grain boundaries
        %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
        b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    

        %Find which points lie in the polygon
        in = inpolygon(xloc,yloc,grainNodePos(b,1),grainNodePos(b,2));
        currentGrainAssign(in) = g;
    end
    
    %% Use the previous state of the grid to find which grain each points belong to
    grainNodePos = [];
    grainNodeID = [];
    %Loop through all the grains to construct the internal connectivity
    for r = 1:length(OLDnodeBelong)
        if ismember(g,OLDnodeBelong(r,:))
            grainNodePos=[grainNodePos;OLDnodeLoc(r,1),OLDnodeLoc(r,2)];
            grainNodeID=[grainNodeID,r];
        end
    end    
    
    %Skip the grain if there are no nodes associated with it
    if ~isempty(grainNodePos)   
        % Order the points that outline the grain boundaries
        %b = boundary(grainNodePos(:,1),grainNodePos(:,2),.01); %re-calculate the boundary order with the new curature points
        b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2));    

        %Find which points lie in the polygon
        in = inpolygon(xloc,yloc,grainNodePos(b,1),grainNodePos(b,2));
        origGrainAssign(in) = g;
    end
end

%% Find all points that had grain reassignments and change the deformation and dislocation density

%Generate all points that a boundary has moved across
crossedPoints = find(currentGrainAssign~=origGrainAssign);

for i = 1:length(crossedPoints)
    %Extract the grain number that the point should be assigned too
    currentGrain = currentGrainAssign(i);
    
    %Use the relevant data from that pixel to assign the new dislocation
    %density and deformation
    dislocationDensity(i,3) = graintMat(currentGrain,6);
    u1(i,3) = graintMat(currentGrain,7);
    u2(i,3) = graintMat(currentGrain,8);
end

%Create the files to be written to
fid1 = fopen('./COMSOL_input/dislocationDensity.txt','w');
fid2 = fopen('./COMSOL_input/u1.txt','w');
fid3 = fopen('./COMSOL_input/u2.txt','w');

%Print the spreadsheets for COMSOL
fprintf(fid1, '%.10e\t%.10e\t%.10e\n', dislocationDensity.');
fprintf(fid2, '%.10e\t%.10e\t%.10e\n', u1.');
fprintf(fid3, '%.10e\t%.10e\t%.10e\n', u2.');

fclose(fid1);
fclose(fid2);
fclose(fid3);

end

