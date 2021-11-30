% Copyright 2013 Max-Planck-Institut f?r Eisenforschung GmbH
%Reference: https://stabix.readthedocs.io/en/latest/bicrystal_definition.html
function g_mat = eulers2g(euler, varargin)
% from the book "Introduction to Texture Analysis: Macrotexture, 
% Microtexture and Orientation Mapping", by Randle and Engler (2000), p.27.

% euler: Euler Angles ([<phi1>, <Phi>, <phi2>] - Bunge notation) in degrees.

% author: c.zambaldi@mpie.de

if nargin == 0 
    euler = randBunges;
end

euler = euler/180*pi; % deg2rad
phi1 = euler(1);
phi  = euler(2);
phi2 = euler(3);

c1 = cos(phi1);
c  = cos(phi);
c2 = cos(phi2);
s1 = sin(phi1);
s  = sin(phi);
s2 = sin(phi2);
g_mat(1,1) = c1*c2-s1*s2*c;
g_mat(1,2) = s1*c2+c1*s2*c;
g_mat(1,3) = s2*s;
g_mat(2,1) = -c1*s2-s1*c2*c;
g_mat(2,2) = -s1*s2+c1*c2*c;
g_mat(2,3) = c2*s;
g_mat(3,1) = s1*s;
g_mat(3,2) = -c1*s;
g_mat(3,3) = c;

if isrot(g_mat) == true
    return
else
    warning_commwin('Not a rotation matrix');
end

%% Calculate single rotation matrices
% g_phi1 = [ cos(phi1)  sin(phi1) 0;
%         -sin(phi1)  cos(phi1) 0;
%             0           0     1];
% 
% g_PHI = [ 1      0         0    ;
%         0   cos(PHI)  sin(PHI);
%         0  -sin(PHI)  cos(PHI)];
%     
% g_phi2 = [ cos(phi2)  sin(phi2) 0;
%         -sin(phi2)  cos(phi2) 0;
%             0           0     1];
%         
% % Calculate the rotation matrix g
% g = g_phi2 * g_PHI * g_phi1;

end

%% TODO ==> further checking
% sum(g_mat.^2,1) % ! = 1
% sum(g_mat.^2,2) % ! = 1
% g_mat'
% inv(g_mat)
% EULERANGLES = g2euler(g_mat,'deg')
% % g2 = euler2g(EULERANGLES);
% % sum(g2.^2,1)
% % sum(g2.^2,2)
% % g2'
% % inv(g2)
% % TESTEULERANGLES = g2euler(g2,'deg')