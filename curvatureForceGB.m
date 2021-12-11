function [curvatureForce] = curvatureForceGB(nodeID1,nodeID2,nodeLoc,segRadius,misorientMat,nodeBelong,constants)
%curvatureForceGB Function to return the curvature force felt by a grain
%boundary

%Constants to use
G=constants.G; %Shear Modulus [Pa]
b=constants.b; %Burgers vector [m]
v=constants.v; %Poisson's ratio
coreWidth=constants.coreWidth; %Dislocation Core Width [m]

%Calculate the constants
gamma0=G*b/(4*pi*(1-v)); 
A=1+log(b/(2*pi*coreWidth));

%Extract the node positions
nodePos1 = nodeLoc(nodeID1,:);
nodePos2 = nodeLoc(nodeID2,:);

%% Extract the radius and misorientation value for the boundary
radius = segRadius(nodeID1,nodeID2);

if radius==0 %if there is no radius then exit the function early
    curvatureForce=[0,0];
    return
end

% Find the misorientation value from the two nodes
sharedGrains = intersect(nodeBelong(nodeID1,:),nodeBelong(nodeID2,:)); %find the 2 grains that the nodes share
sharedGrains = sharedGrains(sharedGrains~=0); %ignore the "0" grains
misorientVal = misorientMat(sharedGrains(1),sharedGrains(2));

%% Find the midpoint and circle center of the arc to extract the unit normal
midPoint = arcPoints(nodePos1,nodePos2,radius,1);

%find the center of the circle that intersects all 3 points
[~,circ_center] = fit_circle_through_3_points([nodePos1;midPoint;nodePos2]); 
circ_center=circ_center';

curveNorm = midPoint-circ_center; %vector that points AWAY from the center of the circle - in the directon of curvature
curveNorm = curveNorm/norm(curveNorm); %convert to unit vector

%Convert the radius to real units
%radiusRealUnits = radius*constants.realGridSize/constants.gridSize;

boundaryEnergy = abs(gamma0*misorientVal.*(A-log(misorientVal))); %calculate the misorientation boundary energy
curvatureForce=-(1/abs(radius))*boundaryEnergy*curveNorm; %calculate the curvature force, negative sign needed to reverse the direction of the vector

end

