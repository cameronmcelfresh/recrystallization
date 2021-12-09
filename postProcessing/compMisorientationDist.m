function [] = compMisorientationDist(stepID1,stepID2, storedInfo,misorientMat)
%compMisorientationDist Function to compare the misorientation
%distributions between two iterations given the stored info container

%Empty lists to how the misorientations
misAngles1=[];
misAngles2=[];

iterList = [stepID1,stepID2];

for i = 1:2
   iter = iterList(i);
   
   %Extract the nodeBelong matrix for each iteration
   nodeBelong = storedInfo{iter,2};
   
   allGrainPairs = [];
   
   %Construct all unique grain pairs
   for j = 1:length(nodeBelong)
       %Construct all unique pairing of grains that share a boundary
       grainPairs = nchoosek(nodeBelong(j,nodeBelong(j,:)~=0),2);
      
       [~,col]=size(grainPairs);
       if col<2
           continue
       end
       
       if isempty(allGrainPairs)
           %If it's the first row then accept all the grain combinations
           allGrainPairs = grainPairs;
       else
           %Find which pairs are not already included in the list
           notIncluded = ismember(grainPairs,allGrainPairs,'rows');
           %Append the new items to the list
           allGrainPairs=[allGrainPairs;grainPairs(~notIncluded,:)];    
       end
   end
      
   if i==1
       misAngles1=zeros(length(allGrainPairs),1);
       for j = 1:length(allGrainPairs)
           misAngles1(j)=misorientMat(allGrainPairs(j,1),allGrainPairs(j,2));
       end
   else
       misAngles2=zeros(length(allGrainPairs),1);
       for j = 1:length(allGrainPairs)
           misAngles2(j)=misorientMat(allGrainPairs(j,1),allGrainPairs(j,2));
       end 
   end
end

%% Plot the two histograms
figure
bins = 0:5:70;

histogram(misAngles1,bins)
hold on
histogram(misAngles2,bins)
legend(sprintf('Iteration %i',stepID1),sprintf('Iteration %i',stepID2))

xlabel("Disorientation Angle");
ylabel("Frequency");

end

