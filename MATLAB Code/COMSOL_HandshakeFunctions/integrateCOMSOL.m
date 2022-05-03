function [grainMat] = integrateCOMSOL(nodeLoc, nodeBelong, grainMat,trueGridLength,castGridLength)
%integrateCOMSOL Function to integrate the dislocation densities and
%deformation to find the average of each grain. Function should be called
%after COMSOL operations and before the next RX step

%trueGridLength = the size of the grid in meters
%castgridLength = the size of the grid in pixels

%Read in the matrices of interest from the COMSOL output files
%u1 = readmatrix("./COMSOL_output/u1.txt");
%u2 = readmatrix("./COMSOL_output/u2.txt");
dislocationDensity=readmatrix("./COMSOL_output/dislocationDensity.txt");

%Extract the x-y coordinates
xlocTrue = dislocationDensity(:,1);
ylocTrue = dislocationDensity(:,2);

% Transform the x-y coordinates to the grid format, make sure counting starting with 1
xloc = xlocTrue/trueGridLength*castGridLength*0.985 + 1.1;
yloc = ylocTrue/trueGridLength*castGridLength*0.985 +1.1;

numGrains = length(grainMat);

for g = 1:numGrains
    % Assign each point in the spreadsheet to the current grain it belongs to
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
        
        %Find the average dislocation density, u1,u2 deformation and save
        %in the grainMat
        grainMat(g,6) = mean(dislocationDensity(in,3))*1e12; % make sure to use the conversion factor that Nihkil uses in COMSOL
        %grainMat(g,7) = mean(u1(in,3));
        %grainMat(g,8) = mean(u2(in,3));
    end
end

end

