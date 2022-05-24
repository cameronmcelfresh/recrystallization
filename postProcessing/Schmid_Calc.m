%% Script to calculate schmid factor of individual grains in polycrystal

%% add path to MTEX code for post processing

addpath("./postProcessing/");
addpath("../MTEX/mtex-5.8.1/");
startup

%% Load the dataset of interest

load("../Studies/2022_04_29/recrystallization_data/parametricStudy1/study11/CPFEM_RX.mat");

% Add a column to the grainMat variable
grainMat(:,9) = zeros(length(grainMat),1);

%% BCC Crystal for every grain

%Create the crystal
CS = crystalSymmetry('cubic',[2.87,2.87,2.87],'mineral','Iron');

% BCC Slip system definition
d = Miller(1,-1,1,CS,'uvw'); %slip direction
n = Miller(1,1,0,CS,'hkl'); % slip plane
sS = slipSystem(d,n); %slip system
sS = sS.symmetrise('antipodal'); % slip systems including reflections


%% Develop the strain tensor - uniaxial tension in the x-direction

for g = 1:length(grainMat)
    
    %Find the rotation matrix for the euler angles
    rotMat = eulers2g(grainMat(g,3:5));
            
    %sigma = stressTensor.uniaxial(vector3d.X);
    sigma = stressTensor([1,0,0;0,0,0;0,0,0]*rotMat);
        
    %Generate the quaternion
    r=[1,0,0]*rotz(grainMat(g,3))*rotx(grainMat(g,4))*rotz(grainMat(g,5));
    %tau = dot(sS.b,r,'noSymmetry') * dot(sS.n,r,'noSymmetry');
    
    %tau = sS.SchmidFactor(sigma); %calculate all the schmid factors
    tau = sS.SchmidFactor(vector3d(r)); %calculate all the schmid factors
    
    %Find the maximum schmid factor
    [tauMax,id] = max(abs(tau));

    %Assign schmid factor to the grainMat
    grainMat(g,9) = tau(id);
end

%Plot a histogram of the schmid factors
figure
histogram(abs(grainMat(:,end)),[0.25:0.01:0.50]);
hold on
colsOfIterest = grainMat(:,2)==1;
histogram(abs(grainMat(colsOfIterest,end)),[0.25:0.01:0.50]);
l = legend;
l.String = {"Before RX","After RX"};

xlabel("Schmid Factor");
ylabel("Frequency");

sc0 = abs(grainMat(:,end));
scFin = abs(grainMat(colsOfIterest,end));

