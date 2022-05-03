%% Script to run post processing of multiple file folders and compile all data together

%add the post-processing functions
addpath("./postProcessing");

%% Define paths 

% Define folder paths
dataPath1 = "../Studies/2022_04_29/recrystallization_data/parametricStudy0/";
dataPath2 = "../Studies/2022_04_29/recrystallization_data/parametricStudy1/";
dataPath3 = "../Studies/2022_04_29/recrystallization_data/parametricStudy2/";

folders = {dataPath1, dataPath2, dataPath3};

data = table; % table to hold ALL data collected

%% Run processing for each folder
 
for folderIter = 1:length(folders)

subTable = table; % table to hold the data from this iteration
    
thePath = folders{folderIter}; %path for this iteration
    
% Load the environment 
load(thePath + "simulation_environment.mat");
 
% fig_dislocationDensities = figure;
% fig_grainCount = figure;
% fig_percentRX = figure;

dislocationDensities = zeros(total_trials,1); % average dislocation density of final structure
totalGrains = zeros(total_trials,1); % total number of grains in final structure
lambda = zeros(total_trials,1); % lambda = mTJ*a / mGB, unitless conversion factor between GB and TJ mobility
tempColumn = zeros(total_trials,1); % temperature [K]
strainColumn = zeros(total_trials,1); %strain [mm/mm]
recrystallizationTime = zeros(total_trials,1); % recrystallization time

counter=0;
for i = 1:length(temperatures)
    for j = 1:length(total_strain)
        for m = 1:length(TJ_mobilityRatio)
            for k = 1:replicas % repeat for the necessary number of replicas

                %Check for the existance of the output file
                if exist(thePath+'/study'+string(counter)+'/CPFEM_RX.mat')==0
                    counter = counter+1;
                    continue
                end

                %Load in the necessary variables
                load(thePath+'/study'+string(counter)+'/CPFEM_RX.mat');

                %Find the total number of grains and dislocation density
                totalGrains(counter+1) = sum(grainMat(:,2)>0);
                dislocationDensities(counter+1) = extractDislocationDensity(storedInfo,gridSize,iter-1);
                lambda(counter+1) = const.TJ_mobilityRatio;

                %Append the temperature and strain values
                tempColumn(counter+1) =temperatures(i);
                strainColumn(counter+1) = total_strain(j);

                %Extract the running grain count
                [GrainCount] = runningGrainCount(storedInfo,iter-1);
                
                %Calculate the time to cut the number of grains in half -
                %in seconds
                %percent_RX = percentRecrystallization(storedInfo,iter-1,const); % find the percent RX
                %percent_RX = percent_RX./max(percent_RX); % normalize to 1
                
                %recrystallizationTime(counter+1)=find(percent_RX>=0.5,1)*const.dt*const.inflationParameter;
                %grain number calculation of percent RX
                try
                    recrystallizationTime(counter+1)= find(GrainCount<=max(GrainCount)/2,1)*const.dt*const.inflationParameter;
                catch %catch the error if the grain count hasnt been cut in half yet
                    fprintf("Didn't finish\n")
                    recrystallizationTime(counter+1)= length(GrainCount)*const.dt*const.inflationParameter;
                end
                    
%                 figure(fig_grainCount);
%                 hold on
%                 plot((1:iter-1)*const.dt*const.inflationParameter,GrainCount,...
%                     'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));
% 
                %Plot the dislocation density evolution for the simulation
%                 running_DD = dislocationDensityEvolution(storedInfo,const,iter-1);
%                 figure(fig_dislocationDensities);
%                 hold on
%                 plot((1:iter-1)*const.dt*const.inflationParameter,running_DD,...
%                     'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));

%                 %Plot the percent RX of the microstructure
%                 percent_RX = percentRecrystallization(storedInfo,iter-1,const);
%                 figure(fig_percentRX);
%                 hold on
%                 plot((1:iter-2)*const.dt*const.inflationParameter,percent_RX./max(percent_RX),...
%                     'DisplayName',sprintf("T = %i, Total Strain = %0.3f, TJ mobility Ratio=%0.3f",temperatures(i),total_strain(j),TJ_mobilityRatio(m)));   


                %Clear the variables that were loaded from each study
                allVar = who('-file',thePath+'/study'+string(counter)+'/CPFEM_RX.mat');
                for varDel = 1:length(allVar)
                    clear(allVar{varDel});
                end

                counter=counter+1;
            end
        end
    end
end

subTable.temp = tempColumn;
subTable.strain = strainColumn;
subTable.lambda = lambda;
subTable.RX_time = recrystallizationTime;
subTable.dislocationDensity = dislocationDensities;


data = [data;subTable]; % combine the old and new tables

end


%% Develop RX time as a function of temperature, strain, TJ mobility

%Drop any rows with zero valuesdata
if sum(~data.temp)>0
    data(~data.temp,:)=[];
end

% Extract the unique values
uTemp = unique(data.temp); %unique temperature values
uStrain = unique(data.strain); %unique strain values
uLambda = unique(data.lambda); %unique lambda (TJ mobility ratio) values

% Data table for unique variables
uData = table;
uData.temp = 0;
uData.strain = 0;
uData.lambda = 0;
uData.RX_avg = 0;
uData.RX_std = 0;
uData.dd_avg = 0;
uData.dd_std = 0;

for iTemp = 1:length(uTemp)
    for iStrain = 1:length(uStrain)
        for iLambda = 1:length(uLambda)
            
            %find the bools that satisfy the time,strain,temp combination
            colsOfIntere = data.temp==uTemp(iTemp) & data.strain==uStrain(iStrain) & data.lambda==uLambda(iLambda);
            
            %Extract the grain size data values that correspond to the combination of
            %time, strain, temp
            dataVals = data.RX_time(colsOfIntere);
            
            avg = mean(dataVals); %average value
            std_error = std(dataVals); % std error
            
            %Extract the dislocation_density data values that correspond to the combination of
            %time, strain, temp
            dataValsDD = data.dislocationDensity(colsOfIntere);
            
            avgDD = mean(dataValsDD); %average value
            std_errorDD = std(dataValsDD); % std error            
            %Create a new table row
            newTab = table(uTemp(iTemp),uStrain(iStrain),uLambda(iLambda),avg,std_error,avgDD,std_errorDD,'VariableNames',{'temp','strain','lambda','RX_avg','RX_std','dd_avg','dd_std'});
            
            % Add the data to the next row of the table
            uData = [uData;newTab];
        end
    end
end

%Remove first filler row
uData(1,:)=[];

%% Make labels for figures
    
% figure(fig_dislocationDensities)
% xlabel("Time [s]");
% ylabel("Dislocation Density [m^-2]");
% set(gca,'Xscale','log')
% legend
% 
% figure(fig_grainCount)
% xlabel("Time [s]");
% ylabel("Number of Grains [#]");
% set(gca,'Xscale','log')
% legend
% 
% figure(fig_percentRX)
% xlabel("Time [s]");
% ylabel("Percent Recrystallized");
% set(gca,'Xscale','log')
% legend

    
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

