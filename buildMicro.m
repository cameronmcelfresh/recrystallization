function [grid,grainMat] = buildMicro(gridSize,grainNum)
%buildMicro Function to build a microstructure with the alloted number of
%grains

%Scale factors for elongated grain structures
scalex = 0.3;
scaley = 0.3;

%Empty grid to hold grain assignments
grid = zeros(gridSize,gridSize);
b=zeros(gridSize,1); %empty grid to hold the minimum distances
%% Generate grain centers based on a lognormal distribution
%grainCent = rand(grainNum,2)*gridSize;
grainCent=zeros(grainNum,2);

ctr=1; %counter to see how many grains have been built
% Iterate until maxit
maxit=10000;
for i=1:maxit
    
    % Construct a random point from a uniform distibuion     
    randPoint = rand(1,2);
    
   % If it the first random point, then accept it as the first grain
    if (ctr == 1) 
        grainCent(1,:) = randPoint;
        
        if (ctr == grainNum)
                break;
        end
        ctr = ctr+1;
    else
        % If it is not the first grain center, then measure its distrance to
        % existing grain centers and store in the array dist
        dist=zeros(ctr-1,1);

        for k=1:ctr-1
            dist(k)=(randPoint(1)-grainCent(k,1))^2/scalex^2+...
                    (randPoint(2)-grainCent(k,2))^2/scaley^2;
        end
        dist = sqrt(dist);
        
        % rpoint is a random variable (rv) with a uniform distribution, used to
        % generate a rv logcdf^{-1}(x), with a log-normal distribution,
        % where logcdf is the cdf of a log-normal distribution
        % Note: Keep rpoint away from 0 and 1 as it gets difficult to find
        % the roots of logcdf^{-1}(x)-rpoint=0, when rpoints is close to 0
        % or 1
        
        rpoint=(0.995-0.0015)*rand+0.0015;

        fun=@(x) logcdf(x)-rpoint;
        
        % minDist is a random variable with log-normal distribution
        minDist=fzero(fun,0.2);
        %minDist=minDist/4;
        b=[b;minDist];
        
        % Accept randPoint as the grain center if all the distances to
        % existing grid centers are greater than minDist.
        if (all(dist > minDist))
            grainCent(ctr,:) = randPoint;
            
            % If we have reached the 'nGrains' grains, then exit. Else
            % iterate.
            if (ctr == grainNum)
                break;
            end
            
            ctr = ctr + 1;
        end
    end
    if (i == maxit)
        grainNum = ctr-1;
    end
end

%Scale the grain centers to the grid size
grainCent=grainCent.*gridSize;

%% Plot the grain sizes
grainSize = zeros(grainNum,1);

% Calculate the grain sizes
for i = 1:grainNum
    dist=[];
    for j = 1:grainNum
        if (j ~= i)
                dist = [dist; (grainCent(i,1)-grainCent(j,1))^2+...
                              (grainCent(i,2)-grainCent(j,2))^2];
        end
    end
    grainSize(i) = sqrt(min(dist));
end
            
% Compare the pdfs of the actual log normal distribution using 'b' and the
% distribution of grain sizes using 'grainSize' in a histogram plot

%Generate the lognormal distribution fit
[pHat,~] = lognfit(grainSize(1:grainNum),0.01); %estimate the mean and STD
pd = makedist('Lognormal','mu',pHat(1),'sigma',pHat(2)); %generate the lognormal distribution
x = (1:2:300)';
y = pdf(pd,x);

%Plot all
% figure;
% histogram(grainSize(1:grainNum),15,'Normalization','pdf')
% hold on;
% tix=get(gca,'xtick')';
% set(gca,'xticklabel',num2str(tix,'%.2f'))
% tix=get(gca,'ytick')';
% set(gca,'yticklabel',num2str(tix,'%.2f'))
% xlabel("Grain Size");
% ylabel("Probability");
% plot(x,y,'LineWidth',3);
% xlim([min(grainSize)*0.9 max(grainSize)*1.1]); %set the axes limits at +/- 10%


%% Find the closest grain center on the grid and assign it - include directional scaling
for x = 1:gridSize
    for y = 1:gridSize
        
        d = sum((grainCent-[x,y]).^2./(ones(grainNum,2).*[scalex^2 scaley^2]),2).^0.5;
        
        %Find the closest grain center
        [~,minInd] = min(d);
        
        %Assign the grain ID
        grid(x,y)=minInd;
    end
end

%% Build the composition, display, and surface energy matrix

grainMat = ones(grainNum,5);

% column 1 corresponds with the phase/chemistry
% column 2 corresponds with whether or not the grain is displayed. Set to 0
    % when grain has been removed
% column 3-6 correspond to the euler angles associated with the grain's crystallographic orientation

% Construct a random orientation vector xyz to create to rotation
% quaternion
%Reference for rotation quaternions: https://danceswithcode.net/engineeringnotes/quaternions/quaternions.html
%Reference for euler angle convention : https://danceswithcode.net/engineeringnotes/rotations_in_3d/rotations_in_3d_part1.html
% ru=rand(grainNum,1);
% theta=rand(grainNum,1)*pi;
% dir = [sqrt(1-ru.^2).*cos(theta),...
%        sqrt(1-ru.^2).*sin(theta),...
%        ru];
% 
% xyz=dir; %xyz point on a unit sphere
% normQ=sqrt(sum((xyz.^2),2));
% 
% xyz=xyz./normQ; %normalize the quaternion - this is redundant at the moment
% 
% rotQ=rand(grainNum,1)*2*pi; %rotation about the quaternion
% 
% q = [cos(rotQ/2),...
%     xyz(:,1).*sin(rotQ/2),...
%     xyz(:,2).*sin(rotQ/2),...
%     xyz(:,3).*sin(rotQ/2)
%     ];

%Call the randBunges function to generate Bunge burgers vectors
%Reference: https://stabix.readthedocs.io/en/latest/bicrystal_definition.html
grainMat(:,3:5)=randBunges(grainNum);


end

