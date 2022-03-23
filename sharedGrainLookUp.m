function [sharedGrains] = sharedGrainLookUp(n1,n2,nodeBelong)
%sharedGrainLookUp Function to lookup the two grains that share the grain
%boundary created by segment n1 <-> n2

% Find the shared grains
sharedGrains = intersect(nodeBelong(n1,:),nodeBelong(n2,:)); %find the 2 grains that the nodes share

% Ignore all corner grains
sharedGrains = sharedGrains(sharedGrains~=0); %ignore the "0" grains

if numel(sharedGrains)<2
    sharedGrains = [0,0];
    return
end

end

