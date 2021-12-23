function [R] = newGB_Radius(nodeID1,nodeID2,nodeLoc,currentRadius,posUpdates,GBmidPointUpdate)
%newGB_Radius Function to calculate the updated grain boundary radius given
%the updated positions of its anchor nodes and forces

%Extract old and new anchor node positions
pos1=nodeLoc(nodeID1,:);
pos2=nodeLoc(nodeID2,:);

% %Flat grain boundary length
% l=norm(pos1-pos2);
% 
% %Original GB radius
% origRadius = segRadius(nodeID1,nodeID2); 

pos1new = pos1+posUpdates(nodeID1,:);
pos2new = pos2+posUpdates(nodeID2,:);

%Find the midpoint of the curved grain boundary
if currentRadius ==0
    midPoint = (pos1+pos2) /2;
else
    midPoint = arcPoints(pos1,pos2,currentRadius,1);
end

%Calculate the new midpoint of the boundary
newMidPoint = midPoint + GBmidPointUpdate;

%% Test code Code to check if we have crossed the flat boundary. Not needed if we
% perform the check below
flipRdirection=0;

%check for intersections
[xi,~] = polyxpoly([pos1(1), pos2(1)],[pos1(2), pos2(2)],[midPoint(1),newMidPoint(1)],[midPoint(2),newMidPoint(2)]);

if ~isempty(xi) && currentRadius~=0 %xi and xi will be empty if there is no intersections   
    flipRdirection=1;
    
    R = 0; %if we have crossed the boundary, set the curvature to zero
    return
end

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
        R=-R;
    end
catch
    %If the radius is infinite set the curvature to zero
    R=0;
end


end

