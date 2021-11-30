function [RSForce] = readShockleyForce(nodeID,nodeBelong,grainMat,nodeConnect,nodeLoc,misorientMat,constants)
%readShockleyForce Function to calculate the energy of a node using the
%Read-Shockley equation for a grain boundary (misorientation informed)

G=constants.G; %Shear Modulus [Pa]
b=constants.b; %Burgers vector [m]
v=constants.v; %Poisson's ratio
coreWidth=constants.coreWidth; %Dislocation Core Width [m]

%Calculate the constants
gamma0=G*b/(4*pi*(1-v)); 
A=1+log(b/(2*pi*coreWidth));

%Collect the grains that are connect to the node
nearbyGrains = nodeBelong(nodeID,:);
nearbyGrains = nearbyGrains(nearbyGrains~=0); %exclude zero

boundaryPairs = nchoosek(nearbyGrains,2); %generate all boundary pairs
misorientationVals = [];
segmentUnitVec = [];
forceAdjust = [];

%Find all the associated nodes and their grains
partnerNodes = find(ismember(nodeConnect(:,nodeID),1));
partnerNodesGrains=nodeBelong(partnerNodes,:);


for i = 1:length(boundaryPairs) %cycle through the grain boundaries
    %Extract the grain and euler angles
    g1 = boundaryPairs(i,1);
    g2 = boundaryPairs(i,2);
    
    eul1 = grainMat(g1,3:5);
    eul2 = grainMat(g2,3:5);
    
    %lookup the misorientation value
    %misorientationVals(i)=misorientation(eul1, eul2, 'bcc', 'bcc');    
    misorientationVals(i)=misorientMat(g1,g2);

    %Find the node associated with the segment
    [~,theNode] = max(sum(partnerNodesGrains==g1,2)+sum(partnerNodesGrains==g2,2));
    
    %Find the unit vector for the boundary - normalize it
    uVec = nodeLoc(partnerNodes(theNode),:)-nodeLoc(nodeID,:);
    uVec=uVec/norm(uVec);
    
    %Add the unit vector to the list
    segmentUnitVec=[segmentUnitVec;uVec];
    
%     %Other two connecting nodes
%     otherNodes = partnerNodes(partnerNodes~=theNode);
%     
%     %Calculate the theta and scale the force with sin(theta)
%     u=nodeLoc(otherNodes(1),:)-nodeLoc(nodeID,:);
%     v=nodeLoc(otherNodes(2),:)-nodeLoc(nodeID,:);
%     CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
%     thetaVal = real(acosd(CosTheta));
    
end
%Calculate the Read-Shockley Energy and project it along the unit vectors
RSEnergy = gamma0.*misorientationVals.*(A-log(misorientationVals));
RSForce=segmentUnitVec.*repmat(RSEnergy',[1,2]);

RSForce=-sum(RSForce);

origNorm = norm(RSForce); %save the norm to use later 

% %% Project the force onto the optimal dihedral angle direction
% % Reference : https://www.mathworks.com/matlabcentral/answers/2216-projecting-a-vector-to-another-vector
% RSForceVec=RSForce;
% Bvec=dihedralAngleStep(nodeID,nodeLoc,nodeConnect,0.2,100);
% 
% %calculation of the projection of RSForceVec into Bvec
% %RSForce_adjusted=(sum(RSForceVec.*Bvec)/(norm(Bvec)^2))*Bvec;
% projectedDist = (sum(RSForceVec.*Bvec)/(norm(Bvec)^2)); %ensure that it's a positive projection
% if projectedDist>0
%     RSForce_adjusted=projectedDist*Bvec;
%     RSForce=RSForce_adjusted/norm(RSForce_adjusted)*origNorm;
% else
%     RSForce=[0,0];
% end
% 
% if any(isnan(RSForce)) %pause if there is a Nan detected
%     nodeID
%     misorientationVals
%     Bvec
%     RSEnergy
%     RSForce
%     gamma0
%     A
%     segmentUnitVec
%     fprintf("Nan detected during RSForce calculation...\n");
%     pause(4);
% end

end

