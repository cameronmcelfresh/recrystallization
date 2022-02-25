%% Script to run a parametric study of CPFEM + RX

%% Parametric space to explore
temperatures = [600,700]; %Temperature in K
total_strain = [0.002,0.004]; %Total strain to run the CPFEM simulation
replicas = 1; % # of replicas to run at each temperature/strain combination

%% Title of the folders
studyTitle = "parametricStudy";
mkdir(studyTitle);
postProcessParametric = 1; %1==run post processing analysis after parametric study, 0==don't run analysis of parametric study data

%% Define the constants that will remain the same across all studies
constants.plotMicrostructure=0; %1==plot the evolving grains, 0==don't generate plot. plotMicrostructure variable will override the writeMovie variable
constants.useCOMSOL = 0; %whether or not to co-evolve the CPFEM COMSOL code for realistic dislocation densities

iter = 0;
repeats = 0;
total_trials = length(temperatures)*length(total_strain)*replicas; % total number of simulations to run
fileID = fopen(studyTitle+'/simParams.txt','w');
fprintf(fileID,'temperature\tstrain\tlabel\n');
for i = 1:length(temperatures)
    for j = 1:length(total_strain)
        for k = 1:replicas % repeat for the necessary number of replicas
            
            fprintf("***** Starting Study "+string(iter)+"/" + string(total_trials) + ", "+ string(iter/total_trials*100)+"%% complete *****\n");
            
            %% Write line to simulation simparams file
            fprintf(fileID,sprintf("%0.0f\t%0.4f\t%i\n",temperatures(i),total_strain(j),iter));
            
            %% Make the directory for the folder
            fullpath = studyTitle + '/study' + string(iter)+"/";
            mkdir(fullpath);
            mkdir(fullpath+"COMSOL_output");

            constants.T = temperatures(i);
            constants.total_strain = total_strain(j);

            %% Run the simulation - repeat for failed simulations
            while true
                try
                    mainGrain_Function(constants); %run simulation and capture text
                    break
                catch
                   fprintf("***** SIMULATION FAILURE - TRIAL ABORTED, restarting *****\n");
                   repeats = repeats+1;
                end
            end
            
            %% Move the output CPFEM_RX.mat file and COMSOL_output files
            try
                movefile('CPFEM_RX.mat',fullpath);
            end
            
            try
                movefile('./COMSOL_output/*',fullpath+"COMSOL_output/");
            end
            
            % Clear the COMSOL_input folder
            delete('./COMSOL_input/*');

            iter = iter+1;
        end
    end
end
fclose(fileID); % close the simulation params text file

%% Post processing analysis

if postProcessParametric==1

    dislocationDensities = zeros(total_trials,1); % average dislocation density of final structure
    totalGrains = zeros(total_trials,1); % total number of grains in final structure
    lambda = zeros(total_trials,1); % lambda = mTJ*a / mGB, unitless conversion factor between GB and TJ mobility
    tempColumn = zeros(total_trials,1); % temperature [K]
    strainColumn = zeros(total_trials,1); %strain [mm/mm]

    counter=0;
    for i = 1:length(temperatures)
        for j = 1:length(total_strain)
            for k = 1:replicas % repeat for the necessary number of replicas
                
                %Check for the existance of the output file
                if exist(studyTitle+'/study'+string(counter)+'/CPFEM_RX.mat')==0
                    counter = counter+1;
                    continue
                end
                
                %Load in the necessary variables
                load(studyTitle+'/study'+string(counter)+'/CPFEM_RX.mat');

                
                %Find the total number of grains and dislocation density
                totalGrains(counter+1) = sum(grainMat(:,2)>0);
                dislocationDensities(counter+1) = extractDislocationDensity(storedInfo,gridSize,iter-1);
                lambda(counter+1) = const.Lambda;

                %Append the temperature and strain values
                tempColumn(counter+1) =temperatures(i);
                strainColumn(counter+1) = total_strain(j);
                
                %Clear the variables that were loaded from each study
                allVar = who('-file',studyTitle+'/study'+string(counter)+'/CPFEM_RX.mat');
                for m = 1:length(allVar)
                    clear(allVar{m});
                end
                
                counter=counter+1;
            end
        end
    end

%% Create heatmaps

% total number of grains
figure
heatmap(string(temperatures),string(total_strain),reshape(totalGrains,length(temperatures),length(total_strain)));
title('Total number of grains');
xlabel("Temperature [K]");
ylabel("Total Strain");

% average dislocationDensities
figure
heatmap(string(temperatures),string(total_strain),reshape(dislocationDensities,length(temperatures),length(total_strain)));
title('Dislocation Density');
xlabel("Temperature [K]");
ylabel("Total Strain");

% lambda parameter
figure
heatmap(string(temperatures),string(total_strain),reshape(lambda,length(temperatures),length(total_strain)))
title('Lambda Parameter');
xlabel("Temperature [K]");
ylabel("Total Strain");

end