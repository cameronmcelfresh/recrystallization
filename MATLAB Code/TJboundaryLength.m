function [avgBoudnaryLength] = TJboundaryLength(n,nodeConnect,nodeLoc,const)
%TJboundaryLength Function to calculate the average boundary length
%connected to a given junction. i.e. if n = 4 then the average length of
%the segments connecting to node 4 will be returned in REAL [m] units.

TJpos = nodeLoc(n,:);

%Find the node numbers with connections going into the TJ
connections = find(nodeConnect(n,:)==1); 

%Check to see if this is a fixed corner segment and, if so, return the
%dummy value of 1 because the TJ mobility will be ignored
if isempty(connections)
    avgBoudnaryLength=1;
    return
end

%Find the locations of the nodes
connectionLocations = nodeLoc(connections,:);

%Calculate dist in simulation units
avgDist = mean(sqrt(sum((connectionLocations-TJpos).^2,2)));

%Convert to real units
avgBoudnaryLength = avgDist* const.realGridSize/const.gridSize;

end

