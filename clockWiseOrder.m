function [order] = clockWiseOrder(x,y)
%clockWiseOrder Function to return the clockwise order of a set of x,y
%locations.

%Reference
%https://stackoverflow.com/questions/13935324/sorting-clockwise-polygon-points-in-matlab

%Find the cetner
cx = mean(x);
cy = mean(y);

%Find the angles
a = atan2(y - cy, x - cx);

%Find the correct sorted order
[~, order] = sort(a);

end

