function [] = generateVideo(storedInfo,lastIter,const)
%generateVideo Is a function to post process the data and generate a video


%% Prepare video writer if needed
%videoFrames =[];
if const.writeMovie==1 %Record a movie if specified to do so   
     moviename=sprintf(const.movieTitle+'.avi'); %update the name of the file
    
    aviobj=VideoWriter(moviename);
    aviobj.Quality=100;
    open(aviobj);
    
    %Initialize the video structure to hold the frames
%     videoFrames.cdata=zeros(840,1120,3,'uint8');
%     videoFrames.colormap = [];
%     videoFrames(length(dt:dt:totalTime)).cdata =zeros(840,1120,3,'uint8');
%     videoFrames(length(dt:dt:totalTime)).colormap =[];
end

%% Generate the figure space
if const.plotMicrostructure
    figure
    f = figure(1);
end


%% Loop through each iteration
for iter = 1:lastIter
    
    nodeLoc = storedInfo{iter,1};
    nodeBelong = storedInfo{iter,2};
    nodeConnect = storedInfo{iter,3};
    grainMat = storedInfo{iter,4};
    segRadius = storedInfo{iter,5};    
    %nodeVel = storedInfo{iter,6};    
    
    if const.plotMicrostructure
        clf(f)
        plotGrains(nodeBelong,nodeLoc,nodeConnect,grainMat,segRadius,const); %plot the grains to axis
        pause(0.001); %pause to generate the plot
    end
    if const.writeMovie && const.plotMicrostructure && mod(iter,const.saveMovieFreq)==0
        set(gcf,'Position',[15 15 const.movieWidth,const.movieHeight]); %set the position and size of the figure of the figure
        theframe = getframe(gcf);
        videoFrames(round(iter/const.saveMovieFreq)) = theframe;
        %frame_counter=frame_counter+1;
    end        
end

%% Generate the movie associated with the simulation
if const.writeMovie==1 %Record a movie if specified to do so   
    aviobj=VideoWriter(moviename);
    aviobj.Quality=100;

    open(aviobj);    
    for frameIter = 1:length(videoFrames)
        writeVideo(aviobj,videoFrames(frameIter));
    end
    close(aviobj);
end

end

