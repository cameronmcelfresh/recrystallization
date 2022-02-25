function [sedForce] = strainEnergyDensityForceGB(nodeID1,nodeID2,nodeLoc,nodeBelong,grainMat,constants)
%strainEnergyDensityForce Function to calculate the strain energy density
%force on a GB - calculate across each boundary and then add to each

sedForces = [];

G=constants.G; %Shear Modulus [Pa]
b=constants.b; %Burgers vector [m]

%% Collect the grains that are connect to both nodes
nearbyGrainsNode1 = nodeBelong(nodeID1,:);
nearbyGrainsNode1 = nearbyGrainsNode1(nearbyGrainsNode1~=0); %exclude zero

nearbyGrainsNode2 = nodeBelong(nodeID2,:);
nearbyGrainsNode2 = nearbyGrainsNode2(nearbyGrainsNode2~=0); %exclude zero

%% Check to see if this is a boundary segment, if so, ignore the calculation

if (any(nodeLoc(nodeID1,:)==1) && any(nodeLoc(nodeID2,:)==1)) || (any(nodeLoc(nodeID1,:)==constants.gridSize) && any(nodeLoc(nodeID2,:)==constants.gridSize))
    sedForce = [0,0];
    return
end

%% Find the two shared grains
boundaryPair = intersect(nearbyGrainsNode1,nearbyGrainsNode2);

% Error checking for wrong type of boundary - let the remeshing sort it out

%% NOTE - may want to remove this exception in the future to avoid missed errors 
if numel(boundaryPair)<2
    fprintf("\t**** Warning - found less than 2 boundary grain neighbors, skipping SED GB force for %i -> %i ****\n",nodeID1,nodeID2);
    sedForce = [0,0];
    return
end

%%

%Extract the grain number and dislocation density
g1 = boundaryPair(1);
g2 = boundaryPair(2);

%Find the boundary length
L = norm(nodeLoc(nodeID1,:)-nodeLoc(nodeID2,:))*constants.realGridSize/constants.gridSize; % segment length in TRUE units [m]

%Calculate the dislocation density difference in the two grain
dislocationDensityDiff = grainMat(g2,6)-grainMat(g1,6);
plasticForce = G*(b^2)*L*dislocationDensityDiff;

%Plastic driving force will be positive if dis density (g2) >dis
%density (g1), otherwise it will be negative

%Find the center of grain 1
Grain1Center  = mean(nodeLoc(find(any(nodeBelong'==g1)),:));
Grain2Center  = mean(nodeLoc(find(any(nodeBelong'==g2)),:));

%Find the unit vector for the boundary - normalize it. Ensure that it's
%original direction points towards grain grain TWO (g2)
uVec = nodeLoc(nodeID2,:)-nodeLoc(nodeID1,:);
uVec=uVec/norm(uVec);

%Find the vector perpendicular to that vector
uVecPerp = [-uVec(2),uVec(1)];

segCenter = (nodeLoc(nodeID1,:)+nodeLoc(nodeID2,:))/2; %center of the segment

%Switch the orientation of the perpendicular unit vector if needed
if norm((segCenter+uVecPerp) - Grain2Center) > norm((segCenter-uVecPerp)-Grain2Center)
    uVecPerp=-uVecPerp;
end

%Save the force
sedForce = plasticForce*uVecPerp;
    
end

