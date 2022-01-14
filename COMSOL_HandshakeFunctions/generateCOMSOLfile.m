function generateCOMSOLfile(constants)
%generateCOMSOLfile Function to generate the necessary .java file given a
%side length, total time (or strain), strain rate, starting dislocation
%density, and COMSOL working path

strainRate = constants.strainRate; % strain rate
realGridSize = constants.realGridSize; % size of square grid
totalTime = constants.totalTime_COMSOL; % total time to run simulation
timeStep = constants.dt_COMSOL; % timestep to save variables in comsol

%COMSOL file to read (comsol_file_name) and then write to
%(comsol_written_name)
comsol_file_name = constants.comsol_file_name;
comsol_written_name = constants.comsol_written_name;

% Path to COMSOL file
COMSOL_path = constants.COMSOL_path;

%Starting dislocation density to write to dislocationDensity.txt file
dislocationDensity = constants.minDislocationDensity;

%% Read in the comsol java file
fid = fopen(comsol_file_name,'r');
i = 1;
tline = fgetl(fid);
comsolText{i} = tline;
while ischar(tline)
    i = i+1;
    tline = fgetl(fid);
    comsolText{i} = tline;
end
fclose(fid);

%% Print out the comsol file
fid = fopen(comsol_written_name, 'W');
for i = 1:numel(comsolText)
    
    %Rewrite the path for the model
    if string(comsolText{i}).contains("model.modelPath(")
        comsolText{i} = sprintf('\tmodel.modelPath("%s");',...
            COMSOL_path);
    end
    
    %Test square side length
    if string(comsolText{i}).contains('model.component("comp1").geom("geom1").feature("sq1").set("size", "')
        comsolText{i} = char(sprintf("\t" + strcat('model.component("comp1").geom("geom1").feature("sq1").set("size", "',...
            num2str(realGridSize,'%.2e'),'");')));
    end
    
    %Strain rate
    if string(comsolText{i}).contains('model.component("comp1").physics("w").feature("dir2").set("r", new String[][]{{"')
        comsolText{i} = char(sprintf("\t" + strcat('model.component("comp1").physics("w").feature("dir2").set("r", new String[][]{{"',...
            num2str(strainRate*realGridSize,'%.2e'),'[m/s]*t"}, {"0"}});')));
    end    
    
    %Total time #1
    if string(comsolText{i}).contains('model.study("std1").feature("time").set("tlist", "range(')
        comsolText{i} = char(sprintf("\t" + strcat('model.study("std1").feature("time").set("tlist", "range(0,',...
            num2str(timeStep,'%.2e'),',',num2str(totalTime,'%.2e'),')");')));
    end       

    %Total time #2
    if string(comsolText{i}).contains('model.sol("sol1").feature("v1").set("clist", new String[]{"range(')
        comsolText{i} = char(sprintf("\t" + strcat('model.sol("sol1").feature("v1").set("clist", new String[]{"range(0,',...
            num2str(timeStep,'%.2e'),',',num2str(totalTime,'%.2e'),')", "1.000E-8[s]"});')));
    end     
    
    %Total time #3
    if string(comsolText{i}).contains('model.sol("sol1").feature("t1").set("tlist", "range(')
        comsolText{i} = char(sprintf("\t" + strcat('model.sol("sol1").feature("t1").set("tlist", "range(0,',...
            num2str(timeStep,'%.2e'),',',num2str(totalTime,'%.2e'),')");')));
    end      
    
    if comsolText{i+1} == -1
        fprintf(fid,'%s', comsolText{i});
        break
    else
        fprintf(fid,'%s\n', comsolText{i});
    end
end
fclose(fid);

%% Generate the initial dislocation density file

fid = fopen("./COMSOL_input/dislocationDensity.txt",'w');
fprintf(fid,'0\t0\t%.2e', dislocationDensity/1e12);
fclose(fid);

%Generate initial deformation files - both initialize to no deformation
fid = fopen("./COMSOL_input/u1.txt",'w');
fprintf(fid,'0\t0\t0');
fclose(fid);

fid = fopen("./COMSOL_input/u2.txt",'w');
fprintf(fid,'0\t0\t0');
fclose(fid);

end

