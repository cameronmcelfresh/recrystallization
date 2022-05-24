function [grainMat] = staticRecovery(grainMat,constants)
%staticRecovery is a function to perform temperature-induced recovery of
%the dislocation network

%% Assig the necessary physical constants
Em = 1.95; % Vacancy migration energy
Do = 2 * 10^-6; % Diffusivity pre-exponential

G = constants.G; %Shear Modulus [Pa]
b = constants.b; %Burgers vector [m]

kb_eV = 8.617*10^-5; % Boltzmann constant in eV/K
kb_J = 1.3806*10^-23; % Boltzmann constant in J/K

rho = grainMat(:,6); % Dislocation density of each grain

%% 
% Calculate the recovery rate given the dislocation density in each grain
r = (Do * exp(-Em/(kb_eV*constants.Temp)))/b * (rho.^(3/2)).* (exp(G*b^4 * sqrt(rho)./(kb_J*constants.Temp))-1);

% Calculate the timestep during this iteration
dt = constants.dt*constants.inflationParameter;

% Reduce the dislocation density by the perscribed softening amount
grainMat(:,6) = grainMat(:,6) - dt*r;

end

