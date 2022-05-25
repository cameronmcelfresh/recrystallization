function [grainMat,constants] = staticRecovery(grainMat,constants,iter)
%staticRecovery is a function to perform temperature-induced recovery of
%the dislocation network

%% Assig the necessary physical constants
Em = 1.95; % Vacancy migration energy

Do = 2 * 10^-6; % Diffusivity pre-exponential

G = constants.G; %Shear Modulus [Pa]
b = constants.b; %Burgers vector [m]

kb_eV = 8.617*10^-5; % Boltzmann constant in eV/K
kb_J = 1.3806*10^-23; % Boltzmann constant in J/K

temp = constants.Temp; % Temperature in [C]
temp = temp + 273; % Temperature in [K]

%rho = grainMat(:,6); % Dislocation density of each grain

%% 

if iter == 1
    %Brute force method of pre-calculating the values and then
    %interpolating
    
    %Create a variable to hold the log time and assumed dislocation density
    %for each grain (to be used to interpolation)    
    TotalIter = 10^5; %number of total iterations to consider
    time = logspace(-120,log10(constants.totalTime*constants.inflationParameter),TotalIter);
    time=[0,time];
    
    recoveryData = zeros(TotalIter+1,length(grainMat(:,6))); %dislocation density at each timestep
    recoveryData(1,:) = grainMat(:,6)'; %save the initial dislocation density at time zero
    recoveryData(2,:) = grainMat(:,6)'*0.99; %assign the first row as a 1% reduced dislocation density to avoid complex number
    
    constants.logTime = time; %corresponding lognormal timestep for numerical efficieny
    
    initialDisDensity = grainMat(:,6)'; % the initial dislocation density
    
    % Loop through each timestep to calculate the expected dislocation
    % density
    for i = 2:length(time)-1

        % Time increment
        dt = time(i+1)-time(i);
        
        rho = recoveryData(i,:);
        
        % Calculate the rate of change in dislocation density
        %r = (Do * exp(-Em/(kb_eV*temp)))/b * (rho.^(3/2)).* (exp(G*b^4 * sqrt(rho)./(kb_J*temp))-1);
        r = (Do * exp(-Em/(kb_eV*temp)))/b * (rho.^(3/2)).* sqrt(1-rho./initialDisDensity) .* (exp(G*b^4 * sqrt(rho)./(kb_J*temp).*((1-rho./initialDisDensity).^(-0.5)-1))-1);

        % Calculate he new dislocatin density
        recoveryData(i+1,:) = recoveryData(i,:) - r*dt;
    end
    
    constants.recoveryDensity=recoveryData; %assign the calculated dislocation densities to the set of constant variables
else  
    %Find the current time 
    currentTime = constants.dt*constants.inflationParameter*iter;
    
    closestInd = find(constants.logTime>currentTime,1); %Find the index of the closest time
    
    %Check to see if we are at the first or last iteration
    if isempty(closestInd)
        grainMat(:,6) = constants.recoveryDensity(end,:)';
    else
        if closestInd==1
            grainMat(:,6) = constants.recoveryDensity(1,:)';
        else
        
            %Interpolate the dislocaiton density
            timeGap = constants.logTime(closestInd)-constants.logTime(closestInd-1); % Total time between the two closest log times
            fraction2 = abs(currentTime-constants.logTime(closestInd)) / timeGap; % Weight for closest time
            fraction1 = 1-fraction2; %Weight for the previous closest time

            % Weighted dislocation density
            grainMat(:,6) = constants.recoveryDensity(closestInd,:)'*fraction2 + constants.recoveryDensity(closestInd-1,:)'*fraction1;
        end
    end
end

end

