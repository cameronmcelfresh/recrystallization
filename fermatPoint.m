function [center] = fermatPoint(points)
%fermatPoint Function to return the fermat point of a triangle
%Data expected in row format where each row corresponds to a different x,y
%point

%% Extract the vertex locations
Apoint=points(1,:);
Bpoint=points(2,:);
Cpoint=points(3,:);

%% Calculate the angles of each vertex
%A-angle
u=Bpoint-Apoint;
v=Cpoint-Apoint;
CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
Aangle = real(acosd(CosTheta));

%B-angle
u=Apoint-Bpoint;
v=Cpoint-Bpoint;
CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
Bangle = real(acosd(CosTheta));

%C-angle
u=Bpoint-Apoint;
v=Cpoint-Apoint;
CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
Cangle = real(acosd(CosTheta));

%% Calculate the lengths of each connecting segment
a = norm(Cpoint-Bpoint);
b = norm(Cpoint-Apoint);
c = norm(Apoint-Bpoint);

%Calculate the intersecting points of the two circles
%Reference: https://www.mathworks.com/matlabcentral/answers/196755-fsolve-to-find-circle-intersections
%    d2 = sum((P2-P1).^2);
%    P0 = (P1+P2)/2+(r1^2-r2^2)/d2/2*(P2-P1);
%    t = ((r1+r2)^2-d2)*(d2-(r2-r1)^2);
%    if t <= 0
%      fprintf('The circles don''t intersect.\n')
%    else
%      T = sqrt(t)/d2/2*[0 -1;1 0]*(P2-P1);
%      Pa = P0 + T; % Pa and Pb are circles' intersection points
%      Pb = P0 - T;
%    end


center
end

