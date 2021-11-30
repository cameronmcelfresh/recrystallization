function [nodeLoc,nodeBelong,nodeConnect,segRadius,nodeVel] = grainConnectivity(grid)
%grainConnectivity Function to return the locations of the grain corner
%connectivity matrix

%Number of unique grains in the grid
numGrains = length(unique(grid));

nodeLoc = []; %List to hold x,y node locations
nodeBelong = []; %list to hold the grains that each node belong to
nodeConnect=[]; %connectivity matrix
segRadius = []; %segment radius - mirrors the connectivity matrix

gridLength = length(grid);

%% Assign each point in the grid to a grain

%Brute force node assignment
for x=1:gridLength
    for y = 1:gridLength
        
        %Possible points
        p = {[x,y],[x+1,y],[x-1,y],...
                            [x,y+1],[x,y-1]};
                        
        grainID = zeros(5,1);
        
        for ind = 1:5
            
            pos=p{ind};  
            try 
                grainID(ind)=grid(pos(1),pos(2));
            catch
                %Do nothing
            end
        end
            
        u = unique(grainID);
       
        %If triple junction or edge found, assign to proper grains
        if length(u)>2
            
            
            skipNode =0;
            %Check if that node already exists in in a neighboring position
            if numel(nodeLoc)>3
                for ind = 1:5
                    pos=p{ind};
                    if ismember([pos(1),pos(2)],nodeLoc,'rows')
                        skipNode=1; 
                    end
                end  
            end

            if skipNode==0
                
                zerofilled=zeros(1,6); %allow each point to coincide with up to 6 grains
                for j = 1:length(u)
                    zerofilled(j)=u(j);
                end
                
                nodeLoc=[nodeLoc;x,y];
                nodeBelong=[nodeBelong;zerofilled(1),zerofilled(2),zerofilled(3),zerofilled(4),zerofilled(5),zerofilled(6)];
                %nodeBelong=[nodeBelong;u(1),u(2),u(3)];
            end
        end
    end
end

%% Add grain corners
nodeLoc=[nodeLoc;1,1];
nodeLoc=[nodeLoc;1,gridLength];
nodeLoc=[nodeLoc;gridLength,1];
nodeLoc=[nodeLoc;gridLength,gridLength];

[~,columns]=size(nodeBelong);
cleanZero=zeros(1,columns);

corner1 = cleanZero;
corner2 = cleanZero;
corner3 = cleanZero;
corner4 = cleanZero;

corner1(1)=grid(1,1);
corner2(1)=grid(1,gridLength);
corner3(2)=grid(gridLength,1);
corner4(3)=grid(gridLength,gridLength);

nodeBelong=[nodeBelong;corner1;corner2;corner3;corner4];

%% Connectivity Matrix

nodeConnect=zeros(length(nodeBelong),length(nodeBelong));

%Build the connectivity matrix
for grain = 1:numGrains
    
    grainNodePos = [];
    
    %Loop through all the grains to construct the internal connectivity
    for r = 1:length(nodeBelong)
        if ismember(grain,nodeBelong(r,:))
            grainNodePos=[grainNodePos;nodeLoc(r,1),nodeLoc(r,2)];
        end
    end
    
    %Find the boundary connectivity
    %b = boundary(grainNodePos(:,1),grainNodePos(:,2),0.1);
    b = clockWiseOrder(grainNodePos(:,1),grainNodePos(:,2)); %construct the boundayr matrix by hand
    b=[b;b(1)]; %add the connection to the first node
    
    for indB = 1:length(b)-1
        
        n1Local = b(indB); %Node 1,local
        n2Local = b(indB+1); %Node 2, local

        %Find the location of the grain in the global setting
        [~,n1Global]=ismember(grainNodePos(n1Local,:),nodeLoc,'rows');
        [~,n2Global]=ismember(grainNodePos(n2Local,:),nodeLoc,'rows');
        
        if n1Global==n2Global %don't allow a node to attach to itself
            continue;
        end
        
        %Check to see if both are edge locations...
        if ismember(0,nodeBelong(n1Global,1:3)) && ismember(0,nodeBelong(n1Global,1:3))
            continue;
        end
        
        %Add the connectivity
        nodeConnect(n1Global,n2Global)=1;
        nodeConnect(n2Global,n1Global)=1;
    end
    
end

%% Initialize all node velocities to zero
nodeVel=zeros(length(nodeBelong),2);

%% Create the segment curature matrix

%lengthOfSegMat=length(nodeBelong)+100;
lengthOfSegMat=length(nodeBelong);

%make the matrix much bigger than needed so account for new connections
segRadius = (rand(lengthOfSegMat,lengthOfSegMat))*100+600; 

%randomize it to forwards and backwards
segRadius=segRadius.*sign(rand(lengthOfSegMat,lengthOfSegMat)-0.5);

%Make sure the matrix is symmetric
for i = 1:length(segRadius)
    for j = 1:length(segRadius)
        segRadius(j,i)=segRadius(i,j);
    end
end

end

