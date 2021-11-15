function [posUpdates] = calcNodeUpdates(dt,maxV,nodeLoc,nodeConnect,grid)
%calcNodeUpdates Function to calculate the positional updates of the nodes
%   dt is the timestep
%   maxV is the maximum node velocity
%   posUpdates is the x,y step that each node will take over the next dt

dXdY = maxV*dt; %Maximum jump that can be taken;

numNodes=length(nodeLoc);
gridLength=length(grid);
posUpdates=zeros(numNodes,2); % empty array

for n = 1:numNodes
    
    %Do not allow boundary nodes to move
    pos=nodeLoc(n,:);
    if ismember(1,pos) || ismember(gridLength,pos)
        continue;
    end
    
    %Current energy of node-branch configuration
    currentNodeEnergy = nodeEnergy(n,nodeLoc,nodeConnect);
    
    dXbest=0;
    dYbest=0;
    dEnergyBest=0;
    
    %Try 20 random directions
    iter = 100;
    for i = 1:iter
        
        nodeLocCopy = nodeLoc; %clean copy of node locations
       
        thetaProject =360*rand(); %random angle to project vector
        
        dx = dXdY*cosd(thetaProject);%For now assume that all nodes move with the same velocity
        dy = dXdY*sind(thetaProject);
        
        nodeLocCopy(n,:)=nodeLocCopy(n,:)+[dx,dy]; %update the temp positions with a dx,dy kick
        
        dEnergy=nodeEnergy(n,nodeLocCopy,nodeConnect)-currentNodeEnergy; %calcualte the energy post kick
        
        %Select the step that gets us closer to the function maximum
        if dEnergy>dEnergyBest
            dEnergyBest=dEnergy;
            dXbest=dx;
            dYbest=dy;
        end
    end
    
    posUpdates(n,1)=dXbest;
    posUpdates(n,2)=dYbest;
end

end

