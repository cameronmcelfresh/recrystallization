function isTrue = SED_Direction_Convention(n1,n2,nodeLoc,nodeBelong,grainMat,segRadius,constants)
%SED_Direction_Convention Returns true if the curvature between nodes 1 and
%nodes 2 is in the proper direction of the strain energy density

%isTrue=1 if the curvature does abide by the SED force 
%isTrue=0 if the curvature does not abide by the SED force 

%% Do not go through the computation if there is no curvature to the segment
% OR if it's a boundary segment
if segRadius(n1,n2)==0 || (any(nodeLoc(n1,:)==1) && any(nodeLoc(n2,:)==1)) || (any(nodeLoc(n1,:)==constants.gridSize) && any(nodeLoc(n2,:)==constants.gridSize))
    isTrue=1;
    return
end

% %Ignore boundary connections...may remove in for future use
% if (any([nodeLoc(n1,:),nodeLoc(n2,:)]==1)) || (any([nodeLoc(n1,:),nodeLoc(n2,:)]==constants.gridSize))
%     isTrue=1;
%     return
% end


%% Calculate the strain energy differential
SEDForce = strainEnergyDensityForceGB(n1,n2,nodeLoc,nodeBelong,grainMat,constants);
SEDForce=SEDForce/norm(SEDForce); %normalize the vector

%Ensure that the curved midpoint is closer to the
%high-strain-energy density grain
midPoint = arcPoints(nodeLoc(n1,:),nodeLoc(n2,:),segRadius(n1,n2),1);

%Check for intersection between SED force direction,
%midpoint, and the linear middle of the segment
[xi,~] = polyxpoly([nodeLoc(n1,1), nodeLoc(n2,1)],...
    [nodeLoc(n1,2), nodeLoc(n2,2)],...
    [midPoint(1),midPoint(1)+SEDForce(1)*100],...
    [midPoint(2),midPoint(2)+SEDForce(2)*100]);

if ~isempty(xi) 
    isTrue=0; 
else
    isTrue=1;
end

end

