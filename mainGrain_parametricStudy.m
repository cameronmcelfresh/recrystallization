%% Script to run a parametric study of CPFEM + RX

%% Parametric space to explore
temperatures = [400,800]; %Temperature in C
total_strain = [0.1,0.15]; %Total strain to run the CPFEM simulation
TJ_mobilityRatio = [1,10,100]; %Total strain to run the CPFEM simulation
constants.useCOMSOL = 0; %whether or not to co-evolve the CPFEM COMSOL code for realistic dislocation densities
const.useRecovery = 1; % whether or not to use static recovery

replicas = 1; % # of replicas to run at each temperature/strain combination
constants.plotMicrostructure=0; %1==plot the evolving grains, 0==don't generate plot. plotMicrostructure variable will override the writeMovie variable
%% Title of the folders and code for restarting if necessary

restartSim = 0; %restartSim==1 then we are restarting from a simulation that didnt finish
restartIter = 1; % iteration to restart from
studyTitle = "parametricStudy";
total_trials = length(temperatures)*length(total_strain)*length(TJ_mobilityRatio)*replicas; % total number of simulations to run

if restartSim==0
    mkdir(studyTitle);
    fileID = fopen(studyTitle+'/simParams.txt','a');
    fprintf(fileID,'temperature\tstrain\tTJmobilityRatio\tlabel\n');
    fclose(fileID);
end

fileID = fopen(studyTitle+'/simParams.txt','a');
postProcessParametric = 0; %1==run post processing analysis after parametric study, 0==don't run analysis of parametric study data

%% Run parametric study
iter = 0;
repeats = 0;

for i = 1:length(temperatures)
    for j = 1:length(total_strain)
        for m = 1:length(TJ_mobilityRatio)
            for k = 1:replicas % repeat for the necessary number of replicas
            
                
                if restartSim==1 && iter<restartIter
                    iter = iter+1;
                    fprintf("Skipping iter "+ string(iter) + " because of restarting simulation -- \n");
                    continue;
                end
                
                fprintf("***** Starting Study "+string(iter)+"/" + string(total_trials) + ", "+ string(iter/total_trials*100)+"%% complete *****\n");

                %% Write line to simulation simparams file
                fprintf(fileID,sprintf("%0.0f\t%0.3f\t%4.2f\t%i\n",temperatures(i),total_strain(j),TJ_mobilityRatio(m),iter));

                %% Make the directory for the folder
                fullpath = studyTitle + '/study' + string(iter)+"/";
                mkdir(fullpath);
                mkdir(fullpath+"COMSOL_output");

                constants.T = temperatures(i);
                constants.total_strain = total_strain(j);
                constants.TJ_mobilityRatio = TJ_mobilityRatio(m);

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

                %% Move the output CPFEM_RX.mat, COMSOL_output, and COMSOL output text file
                try
                    movefile('CPFEM_RX.mat',fullpath);
                end

                try
                    movefile('./COMSOL_output/*',fullpath+"COMSOL_output/");
                end

                try
                    movefile('./outputText.txt',fullpath+"outputText.txt");
                end

                try
                    movefile('./SOLVED_Model.mph',fullpath+"SOLVED_Model.mph");
                end

                % Clear the COMSOL_input folder
                delete('./COMSOL_input/*');

                iter = iter+1;
            end
        end
    end
end
fclose(fileID); % close the simulation params text file

%% Save the local environment to the study folder
save(sprintf('./%s/simulation_environment',studyTitle));

%% Post processing analysis

if postProcessParametric==1

    fig_dislocationDensities = figure;
    fig_grainCount = figure;
    fig_percentRX = figure;
    
    dislocationDensities = zeros(total_trials,1); % average dislocation density of final structure
    totalGrains = zeros(total_trials,1); % total number of grains in final structure
    lambda = zeros(total_trials,1); % lambda = mTJ*a / mGB, unitless conversion factor between GB and TJ mobility
    tempColumn = zeros(total_trials,1); % temperature [K]
    strainColumn = zeros(total_trials,1); %strain [mm/mm]

    counter=0;
    for i = 1:length(temperatures)
        for j = 1:length(total_strain)
            for m = 1:length(TJ_mobilityRatio)
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

                    %Plot the grain count
                    [GrainCount] = runningGrainCount(storedInfo,iter-1);
                    figure(fig_grainCount);
                    hold on
                    plot((1:iter-1)*const.dt*const.inflationParameter,GrainCount,...
                        'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));

                    %Plot the dislocation density evolution for the simulation
                    running_DD = dislocationDensityEvolution(storedInfo,const,iter-1);
                    figure(fig_dislocationDensities);
                    hold on
                    plot((1:iter-1)*const.dt*const.inflationParameter,running_DD,...
                        'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));

                    %Plot the percent RX of the microstructure
                    percent_RX = percentRecrystallization(storedInfo,iter-1,const);
                    figure(fig_percentRX);
                    hold on
                    plot((1:iter-2)*const.dt*const.inflationParameter,percent_RX./max(percent_RX),...
                        'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));   


                    %Clear the variables that were loaded from each study
                    allVar = who('-file',studyTitle+'/study'+string(counter)+'/CPFEM_RX.mat');
                    for varDel = 1:length(allVar)
                        clear(allVar{varDel});
                    end

                    counter=counter+1;
                end
            end
        end
    end

%% Make labels for figures
    
figure(fig_dislocationDensities)
xlabel("Time [s]");
ylabel("Dislocation Density [m^-2]");
set(gca,'Xscale','log')
legend

figure(fig_grainCount)
xlabel("Time [s]");
ylabel("Number of Grains [#]");
set(gca,'Xscale','log')
legend

figure(fig_percentRX)
xlabel("Time [s]");
ylabel("Percent Recrystallized");
set(gca,'Xscale','log')
legend

    
%% Create heatmaps

% % total number of grains
% figure
% heatmap(string(temperatures),string(total_strain),reshape(totalGrains,length(temperatures),length(total_strain)));
% title('Total number of grains');
% xlabel("Temperature [K]");
% ylabel("Total Strain");
% 
% % average dislocationDensities
% figure
% heatmap(string(temperatures),string(total_strain),reshape(dislocationDensities,length(temperatures),length(total_strain)));
% title('Final Dislocation Density');
% xlabel("Temperature [K]");
% ylabel("Total Strain");
% 
% % lambda parameter
% figure
% heatmap(string(temperatures),string(total_strain),reshape(lambda,length(temperatures),length(total_strain)))
% title('Lambda Parameter');
% xlabel("Temperature [K]");
% ylabel("Total Strain");

end