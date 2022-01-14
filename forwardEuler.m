function [posUpdates,nodeVel,segRadius] = forwardEuler(nodeBelong,grainMat,nodeConnect,nodeLoc,nodeVel,misorientMat,segRadius,constants)
%forwardEuler Function to calculate the next positions of the nodes and grain boundaries 
%given the total collective forces from the plastic and misorientation
%contributions.

numNodes=length(nodeLoc);
gridLength=constants.gridSize;
mobility = constants.mobility; %use an arbitrary mobility value for now

posUpdates=nodeVel.*constants.dt; %positional updates to apply at the end of the timestep

%% Calculate position updates for the nodes
for n = 1:numNodes
    
    %Do not allow boundary nodes to move
    pos=nodeLoc(n,:);
    if ismember(1,pos) || ismember(gridLength,pos)
        continue;
    end
    
    %Skip nodes with less than 2 connections as they are likely to soon be
    %remeshed
    if sum(ismember(nodeConnect(:,n),1))<3
        continue;
    end
    
    %Calculate the resolved force on the node given the misorientation
    %values across each boundary
    RSForce = readShockleyForce(n,nodeBelong,grainMat,nodeConnect,nodeLoc,misorientMat,segRadius,constants);
    
    %Calculate the updated velocity for the next timestep
    nodeVel(n,:)=(RSForce)*mobility;
end

%% Calculate the force and velocity updates for all grain boundaries

if constants.useCurvature ==1 %only update the curvature if user specifies
    %cycle through all the connections
    for n1 = 1:numNodes
        for n2 = 1:n1 
            
            if n1==n2
                continue
            end

            %Check to see if the connection exists
            if nodeConnect(n1,n2)==1
                %Calculate the plastic strain energy density differential
                %force,result is a 2D force vector
                SEDForce = strainEnergyDensityForceGB(n1,n2,nodeLoc,nodeBelong,grainMat,constants); 

                %Calculate the force due to curvature, force,results is a 2D force vector
                curvatureForce = curvatureForceGB(n1,n2,nodeLoc,segRadius,misorientMat,nodeBelong,constants);

                %Sum the boundary forces
                GBForce = SEDForce+curvatureForce/1E5; %curvature force is currently too high relative to SED force. Need to analyze units
                %GBForce = SEDForce;

                %Calculate the velocity of the grain boundary
                GBVelocity = GBForce*constants.mobilityGB;

                %Calculate the position update of the grain boundary (midpoint)
                GBmidPointUpdate = GBVelocity*constants.dt;
                %GBmidPointUpdate=GBmidPointUpdate*constants.gridSize/constants.realGridSize; %convert vector to simulation units

                %Calculate the new radius value for the boundary given nodal
                %updates and GB arc midpoint update. This function only handles
                %the geometry of the moving nodes/arc. 
                GB_Radius = newGB_Radius(n1,n2,nodeLoc,segRadius,posUpdates,GBmidPointUpdate,nodeBelong,grainMat,constants);

                %Set the grain boundary radius to zero (straight) if boundary
                %curvature is too high
                if isinf(GB_Radius)
                    GB_Radius=0;
                end

                %Save the new radius value
                segRadius(n1,n2)=GB_Radius;
                segRadius(n2,n1)=GB_Radius;
            end
        end
    end

end

end
