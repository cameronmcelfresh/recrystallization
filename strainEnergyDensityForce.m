function [sedForce] = strainEnergyDensityForce(nodeID,nodeLoc,nodeConnect,nodeBelong,grainMat,constants)
%strainEnergyDensityForce Function to calculate the strain energy density
%force on a node - calculate across each boundary and then add to each

G=constants.G; %Shear Modulus [Pa]
b=constants.b; %Burgers vector [m]

%Collect the grains that are connect to the node
nearbyGrains = nodeBelong(nodeID,:);
nearbyGrains = nearbyGrains(nearbyGrains~=0); %exclude zero

boundaryPairs = nchoosek(nearbyGrains,2); %generate all boundary pairs
sedForces = [];

%Find all the associated nodes and their grains
partnerNodes = find(ismember(nodeConnect(:,nodeID),1));
partnerNodesGrains=nodeBelong(partnerNodes,:);

for i = 1:length(boundaryPairs) %cycle through the grain boundaries
    
    %Extract the grain number and dislocation density
    g1 = boundaryPairs(i,1);
    g2 = boundaryPairs(i,2);
    
    %Find the boundary length - first by finding the other node associated
    %with the segment
    [~,theNode] = max(sum(partnerNodesGrains==g1,2)+sum(partnerNodesGrains==g2,2));
    L = norm(nodeLoc(nodeID,:)-nodeLoc(theNode,:))*constants.realGridSize/constants.gridSize; % segment length in TRUE units [m]
    
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
    uVec = nodeLoc(partnerNodes(theNode),:)-nodeLoc(nodeID,:);
    uVec=uVec/norm(uVec);
    
    %Find the vector perpendicular to that vector
    uVecPerp = [-uVec(2),uVec(1)];
    
    segCenter = (nodeLoc(nodeID,:)+nodeLoc(theNode,:))/2; %center of the segment
        
    %Switch the orientation of the perpendicular unit vector if needed
    if norm((segCenter+uVecPerp) - Grain2Center) > norm((segCenter-uVecPerp)-Grain2Center)
        uVecPerp=-uVecPerp;
    end

    %Save the force
    sedForces = [sedForces;
        plasticForce*uVecPerp];
    
end


sedForce = sum(sedForces);



end

