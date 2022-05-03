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
u=Bpoint-Cpoint;
v=Apoint-Cpoint;
CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
Cangle = real(acosd(CosTheta));

%Return the obtuse angle vertex if any of the angles are greater than 120
angles=[Aangle,Bangle,Cangle];
for i = 1:3
    if angles(i)>120
        center = points(i,:);
        return
    end
end

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

%% Find the centers of all the equilateral triangles and calculate the Fermat Point
equiCenters=zeros(2,2);
radiusVals = zeros(2,1);
for i = 1:2
    
    possibleCenters=zeros(2,2);
    
    %Assign near and far points. Examine triangle between p1 and p2 first
    p1 = points(i,:);
    if i==3
        p2=points(1,:);
    else
        p2=points(i+1,:);
    end
    
    if i>1
        if i==2
            p3=points(1,:);
        else
            p3=points(2,:);
        end
    else
        p3=points(3,:);
    end
        
p1=p1;
p2=p2;
p3=p3;
 
d = norm(p2-p1); %separation between points

R=d*sqrt(3)/3; %calculate the radius
radiusVals(i)=R;

%possibleCenters(1,:) = (p2'+p1')/2+sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(p2'-p1'); % Center of circle, possibility 1
%possibleCenters(2,:) = (p2'+p1')/2-sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(p2'-p1'); % Center of circle, possibility 2
possibleCenters=circ_cent(p1,p2,R);

distToCenters = sum((possibleCenters-p3).^2,2).^(0.5);
%possibleCenters

%find the center that is further from the third point
[~,IndexOfFurther]=max(distToCenters);

equiCenters(i,:)=possibleCenters(IndexOfFurther,:);

end
% equiCenters
% radiusVals
%Calculate the intersecting points of the three circles
%[newlat,newlon]=crossfix([A(1);B(1);C(1)],[A(2);B(2);C(2)],[6*sqrt(3)/3;6*sqrt(3)/3;6*sqrt(3)/3],[0;0;0])
%[newlat,newlon]=crossfix(equiCenters(:,1),equiCenters(:,2),radiusVals,[0;0]);
[newlat,newlon]=circcirc(equiCenters(1,1),equiCenters(1,2),radiusVals(1),equiCenters(2,1),equiCenters(2,2),radiusVals(2));

%The correct fermat point should always be closer to point #1 (A), since no
%intersecting circles were constructed for points C->A
distToA = sum(([newlat;newlon]'-Apoint).^2,2).^(0.5);

[~,IndexToFermat]=min(distToA);

%center = [reshape(newlat,2,1),reshape(newlon,2,1)];
center = [newlat(IndexToFermat),newlon(IndexToFermat);];


%% Optional Plotting and checking of the angles

%% Plot the overlapping circles
% figure
% scatter(points(:,1),points(:,2),50,'filled')
% hold on
% scatter(equiCenters(:,1),equiCenters(:,2),30,'filled');
% scatter(center(:,1),center(:,2),200,'filled')
% 
% viscircles(equiCenters,radiusVals,'LineStyle','--','Color','black','LineWidth',0.2);
% axis equal
%
% %% Measure the angles between the fermat point and the connecting points
% centerAngles=[];
% for i = 1:3
%     u=points(i,:)-center;
%     
%     if i==3
%         v=points(1,:)-center;
%     else
%         v=points(i+1,:)-center;
%     end
%     
%     CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
%     centerAngles(i) = real(acosd(CosTheta));
% end
% 
% fprintf("Angles with Fermat points are %.1f, %.1f, %.1f\n",centerAngles(1),centerAngles(2),centerAngles(3));

end
