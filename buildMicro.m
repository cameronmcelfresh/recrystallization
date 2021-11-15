function [grid,grainMat] = buildMicro(gridSize,grainNum)
%buildMicro Function to build a microstructure with the alloted number of
%grains

%% Assign the grid spaces

%Empty grid to hold grain assignments
grid = zeros(gridSize,gridSize);

%Assign random grain centers
grainCent = rand(grainNum,2)*gridSize;

%Find the closest grain center and assign it 
for x = 1:gridSize
    for y = 1:gridSize
        
        d = sum((grainCent-[x,y]).^2,2).^0.5;
        
        %Find the closest grain center
        [~,minInd] = min(d);
        
        %Assign the grain ID
        grid(x,y)=minInd;
    end
end

%% Build the composition, display, and surface energy matrix

grainMat = ones(grainNum,3);

% column 1 corresponds with the phase/chemistry
% column 2 corresponds with whether or not the grain is displayed. Set to 0
    % when grain has been removed
   
%TBD surface energy coefficients

end

