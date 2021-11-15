function nodeE = nodeEnergy(nodeID,nodeLoc,nodeConnect)
%nodeEnergy Function to calculate the energy of a node
%   nodeID must be specified and the attached nodes are retrieved from the
%   nodeConnect matrix

%% Gather all of the locations of the connecting nodes
branchNodes=[];
numBranches=0;

for i=1:length(nodeConnect)
    if nodeConnect(nodeID,i)==1 %add the node if it's connected
        branchNodes=[branchNodes;nodeLoc(i,1),nodeLoc(i,2)];
        numBranches=numBranches+1;
    end
end

% branchNodes=find(ismember(nodeConnect(:,nodeID),1,"rows"));
% numBranches=length(branchNodes);

%% Find the proper order of the branching nodes so that we correctly cover
%the 360 degrees. 

nodePos=nodeLoc(nodeID,:); %starting node
%branchNodes

thetaTolerance=5; %tolerance of the order reaching 360 degrees
thetas=zeros(numBranches,1); %list of thetas

%order = boundary(branchNodes(:,1),branchNodes(:,2),0.01); %assumed order

b = clockWiseOrder(branchNodes(:,1),branchNodes(:,2)); %construct the boundary matrix by hand
order=[b;b(1)]; %add the connection to the first node

%order=[order,order(1)]; %add the first branch to the list to complete the loop

%Calculate the theta value
for o = 1:length(order)-1

%     u = branchNodes(order(o),:)-nodePos;
%     v = branchNodes(order(o+1),:)-nodePos;

    %CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
    %thetas(o) = real(acosd(CosTheta));
    
    %Reference
    %https://www.mathworks.com/matlabcentral/answers/180131-how-can-i-find-the-angle-between-two-vectors-including-directional-information
    u = branchNodes(order(o),:)-nodePos;
    v = branchNodes(order(o+1),:)-nodePos;
    
    a = atan2d(u(1)*v(2)-u(2)*v(1),u(1)*v(1)+u(2)*v(2));
    
    if a<0
        a=360+a;
    end
    thetas(o) = a;
end
    
%To examine any error in correct branch generation <--- needs debugging
% if abs(sum(thetas)-360)<thetaTolerance
%     sum(thetas);
%     fprintf("*** Error - sum(thetas)=%.1f != 360\n",sum(thetas));
%     fprintf("Connectivity order and branch nodes\n");
%     nodeID
%     order
%     branchNodes
%     thetas
%     break;
% end

%Calculate the surface energy of the junction
nodeE=1;

for i=1:numBranches
    nodeE = nodeE*sind(thetas(i));
end


end

