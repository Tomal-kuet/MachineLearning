function [A, b, c] = load_data(data_path)
% read data for func2 from txt files

fid = fopen(fullfile(data_path, 'fun2_A.txt'),'r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);

fid = fopen(fullfile(data_path, 'fun2_b.txt'),'r');
b = fscanf(fid,'%e ',[500,1]);
fclose(fid);

fid = fopen(fullfile(data_path, 'fun2_c.txt'),'r');
c = fscanf(fid,'%e ',[100,1]);
fclose(fid);

end

