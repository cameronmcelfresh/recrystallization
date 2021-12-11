function [RSForce] = readShockleyForce(nodeID,nodeBelong,grainMat,nodeConnect,nodeLoc,misorientMat,segRadius,constants)
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
    
    %% Generate the points along the arc of the curved boundary. 
    %If boundary isn't curved then use the other triple junction node
    if segRadius(nodeID,partnerNodes(theNode))==0
        nearestNodePos = nodeLoc(partnerNodes(theNode),:);
    else
        numPoints=16;
        
        %Exact all the points on the arc
        curvePoints = arcPoints(nodeLoc(nodeID,:),nodeLoc(partnerNodes(theNode),:),segRadius(nodeID,partnerNodes(theNode)),numPoints);
        
        %find the index of the closest point on the curve
        [~,closestIndex]=min(sum((curvePoints-nodeLoc(nodeID,:)).^2,2).^0.5); 
        nearestNodePos = curvePoints(closestIndex,:); %closest artificial node on the arc to the TJ
    end
    
    %Find the unit vector for the boundary - normalize it
    uVec = nearestNodePos-nodeLoc(nodeID,:);
    uVec=uVec/norm(uVec);
    
    %Add the unit vector to the list
    segmentUnitVec=[segmentUnitVec;uVec];
    
end
%Calculate the Read-Shockley Energy and project it along the unit vectors
RSEnergy = gamma0.*misorientationVals.*(A-log(misorientationVals));
RSForce=segmentUnitVec.*repmat(RSEnergy',[1,2]);

RSForce=-sum(RSForce);

origNorm = norm(RSForce); %save the norm to use later 

%% Read Shockley criteria assuming all equal misorientation values - dummy force
RSForce = -sum(segmentUnitVec)*-100; %

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

