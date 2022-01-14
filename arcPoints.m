function [points] = arcPoints(pos1,pos2,radius,numPoints)
%arcPoints Function to generate points that create an arc with an arbitrary
%radius between pos1 and pos2. The number of points generated is specified
%with numPoints

%To-add
%A radius-multiplier factor
%Error catching for radius <= d/2 -> return points that connect the
    %positions linearlly if radius is too small to achieve arc


%Reference
%https://www.mathworks.com/matlabcentral/answers/367126-plot-an-arc-on-a-2d-grid-by-given-radius-and-end-points
%https://www.mathworks.com/matlabcentral/answers/327895-how-do-i-plot-a-circular-arc-with-given-two-endpoints-and-radius

%Always construct the arc from pos1 to pos2. If the radius is negative then
%construct the arc using the other point of reference

A = pos1'; % Point A to be on circle circumference
B = pos2'; % Same with point B
d = norm(B-A); %separation between points

% Choose R radius >= d/2

R=abs(radius);

if R<d/2 %if the arc has a radius below the required radius then cap it
    
    if R==0 %if no curvature then return the midpoint
        points=(pos1+pos2)/2;
        return
    else   
        R=d/2*1.1;
    end
end
%R=d*2; %arbitrary radius for now...


% if radius>0
%     C = (B+A)/2+sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
% else
%     %C = (B+A)/2-sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
%      C = (B+A)/2-sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
% end

allCenters=circ_cent(A',B',R);

if radius>0
    C=allCenters(1,:);
    ignoredCenter=allCenters(2,:);
else
    C=allCenters(2,:);
    ignoredCenter=allCenters(1,:);
end

%C=allCenters(1,:);

a = atan2(A(2)-C(2),A(1)-C(1));
b = atan2(B(2)-C(2),B(1)-C(1));

x1 = [];
y1 = [];
t1 = [];

x2 = [];
y2 = [];
t1 = [];

% if radius>0
%     b = mod(b-a,2*pi)+a; % Ensure that arc moves counterclockwise
% else
%     a = mod(a-b,2*pi)+b; % Ensure that arc moves counterclockwise
% end

b1 = mod(b-a,2*pi)+a; % Ensure that arc moves counterclockwise
t1 = linspace(a,b1,numPoints+2);
x1 = C(1)+R*cos(t1);
y1 = C(2)+R*sin(t1);

a1 = mod(a-b,2*pi)+b; % Ensure that arc moves counterclockwise
t2 = linspace(a1,b,numPoints+2);
x2 = C(1)+R*cos(t2);
y2 = C(2)+R*sin(t2);

%Select the points that are closer to the segment
avgPoint = [(pos1(1)+pos2(1))/2 ,(pos1(2) + pos2(2))/2];
avgMat = [mean(x1), mean(y1);mean(x2),mean(y2)];

[~,closeIndex] = min(sum((avgMat-avgPoint).^2,2).^0.5);

if closeIndex==1
    x=x1;
    y=y1;
else
    x=x2;
    y=y2;
end

points = [x(2:end-1)',y(2:end-1)'];

%% Plot the original points + the arc points if needed
% figure
% scatter(points(:,1),points(:,2),40,'filled')
% hold on
% scatter([pos1(1) pos2(1)],[pos1(2) pos2(2)],60,'filled');
% viscircles(C,R,'LineStyle','--','Color','black','LineWidth',0.2);
% 
% viscircles(ignoredCenter,R,'LineStyle','--','Color','red','LineWidth',0.2);

end

