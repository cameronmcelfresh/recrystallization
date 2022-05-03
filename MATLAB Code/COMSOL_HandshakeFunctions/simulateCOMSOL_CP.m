function success = simulateCOMSOL_CP()
%simulateCOMSOL_CP Summary of this function goes here
%   The function will ensure that COMSOL is loaded into the environment and
%   then compile then run the .class file. 

% Ensure COMSOL is loaded into the environment
[status1,~]=system("module load comsol");

% Compile the COMSOL file
[status2,~]=system("comsol compile poly_cp_2D_raw.java");

% Run the COMSOL simulation via the command line
[status3,~]=system("comsol batch -inputfile poly_cp_2D_raw.class -outputfile SOLVED.mph >& outputText.txt");

% Only return success if all 3 system calls return a zero
if status1==0 && status2==0 && status3==0
    success=1;
else
    success=0;
end

end

