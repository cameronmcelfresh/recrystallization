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

if radius>0
    C = (B+A)/2+sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
else
    %C = (B+A)/2-sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
     C = (B+A)/2-sqrt(R^2-d^2/4)/d*[0,-1;1,0]*(B-A); % Center of circle
end

a = atan2(A(2)-C(2),A(1)-C(1));
b = atan2(B(2)-C(2),B(1)-C(1));

if radius>0
    b = mod(b-a,2*pi)+a; % Ensure that arc moves counterclockwise
else
    a = mod(a-b,2*pi)+b; % Ensure that arc moves counterclockwise
end

t = linspace(a,b,numPoints+2);
x = C(1)+R*cos(t);
y = C(2)+R*sin(t);

points = [x(2:end-1)',y(2:end-1)'];

end

