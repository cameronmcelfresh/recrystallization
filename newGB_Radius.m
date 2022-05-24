function [R] = newGB_Radius(nodeID1,nodeID2,nodeLoc,segRadius,posUpdates,GBmidPointUpdate,nodeBelong,grainMat,constants)
%newGB_Radius Function to calculate the updated grain boundary radius given
%the updated positions of its anchor nodes and forces

%Extract old and new anchor node positions
pos1=nodeLoc(nodeID1,:);
pos2=nodeLoc(nodeID2,:);

currentRadius=segRadius(nodeID1,nodeID2); %current radius

pos1new = pos1+posUpdates(nodeID1,:);
pos2new = pos2+posUpdates(nodeID2,:);

%Find the midpoint of the curved grain boundary
if currentRadius==0
    midPoint = (pos1+pos2) /2;
else
    midPoint = arcPoints(pos1,pos2,currentRadius,1);
end

%Calculate the new midpoint of the boundary
newMidPoint = midPoint + GBmidPointUpdate;

%% Plot the GB force vector on the graph...
% hold on
% normGBUpdate = GBmidPointUpdate/norm(GBmidPointUpdate);
% quiver(newMidPoint(1),...
%         newMidPoint(2),...
%         normGBUpdate(1)*25,...
%         normGBUpdate(2)*25,'r','LineWidth',5);

%% Test code Code to check if we have crossed the flat boundary. Not needed if we
% perform the check below -- CHECK IF THIS CODE PERFORMS CORRECTLY
% flipRdirection=0;
% 
% %check for intersections
% [xi,~] = polyxpoly([pos1(1), pos2(1)],[pos1(2), pos2(2)],[midPoint(1),newMidPoint(1)],[midPoint(2),newMidPoint(2)]);
% 
% if ~isempty(xi) && currentRadius~=0 %xi and xi will be empty if there is no intersections   
%     flipRdirection=1;
%     
%     R = 0; %if we have crossed the boundary, set the curvature to zero
%     return
% end

%% Calculate the new radius given the anchor points and the new arc midpoint
[R,~] = fit_circle_through_3_points([pos1new;newMidPoint;pos2new]);

% %Flip the direction if we have crossed the boundary
% if flipRdirection==1
%     R=-R;
% end

%% Ensure that we are selecting the correct radius sign.

%Try to calculate the radii. If no radius is possible then set to zero
try
    %Calculate the radius given positive and negative sign
    positiveRmidPoint = arcPoints(pos1new,pos2new,R,1); %arc midpoint if we assume positive radius
    negativeRmidPoint = arcPoints(pos1new,pos2new,-R,1); %arc midpoint if we assume negative radius

    if norm(positiveRmidPoint-newMidPoint)>norm(negativeRmidPoint-newMidPoint) %select the radius sign that provides the closer midpoint
        R=R*-1;
    end
catch
    %If the radius is infinite set the curvature to zero
    R=0;
end

%% Check if the segment radius changes sign, set it back to zero if so

if sign(R) == -sign(currentRadius) && R~=0
    R=0;
    %fprintf("\tSegment %i -> %i reset to straight\n",nodeID1,nodeID2);
    return
end

%% Brute force SED direction check

segRadius1=segRadius;
nodeLoc1 = nodeLoc;

segRadius1(nodeID1,nodeID2)=R;
segRadius1(nodeID2,nodeID1)=R;

nodeLoc1(nodeID1,:)=pos1new;
nodeLoc1(nodeID1,:)=pos1new;

%Ensure that the direction is aligned with the SED force
if ~SED_Direction_Convention(nodeID1,nodeID2,nodeLoc1,nodeBelong,grainMat,segRadius1,constants)
    R=0;
    %fprintf("\tSegment %i -> %i failed SED check through node movement - resetting to straight\n",nodeID1,nodeID2);
    return
end

end

