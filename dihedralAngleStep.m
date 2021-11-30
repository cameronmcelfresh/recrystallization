function [bestVec] = dihedralAngleStep(nodeID,nodeLoc,nodeConnect,maxJumpDist,maxiter)
%dihedralAngleStep Function to calculate the best direction to move in
%given a maximum possible jump distance

dXdY = maxJumpDist; %Maximum jump that can be taken;

% currentNodeEnergy = nodeEnergy(nodeID,nodeLoc,nodeConnect);
% dEnergyBest=0;
% dXbest=0;
% dYbest=0;
% 
% for i = 1:maxiter
% 
%     nodeLocCopy = nodeLoc; %clean copy of node locations
%     thetaProject =360*rand(); %random angle to project vector
% 
%     dx = dXdY*cosd(thetaProject);%For now assume that all nodes move with the same velocity
%     dy = dXdY*sind(thetaProject);
% 
%     nodeLocCopy(nodeID,:)=nodeLocCopy(nodeID,:)+[dx,dy]; %update the temp positions with a dx,dy kick
% 
%     dEnergy=nodeEnergy(nodeID,nodeLocCopy,nodeConnect)-currentNodeEnergy; %calcualte the energy post kick
% 
%     %Select the step that gets us closer to the function maximum
%     if dEnergy>dEnergyBest
%         dEnergyBest=dEnergy;
%         dXbest=dx;
%         dYbest=dy;
%     end
% end
% 
% bestVec = [dXbest,dYbest];


%% Using the fermat point as the center point of a triangle
connectingNodes = nodeLoc(ismember(nodeConnect(:,nodeID),1),:);

fPoint = fermatPoint(connectingNodes(1:3,:)); %calculate the fermat point
fermatVec=fPoint-nodeLoc(nodeID,:); % construct a vector from the center lcoation to the fermat point

bestVec = fermatVec/norm(fermatVec)*maxJumpDist; % scale the vector to the jump distance

end

