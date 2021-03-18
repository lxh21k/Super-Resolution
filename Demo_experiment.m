clc;clear;

addpath(fullfile(pwd, '/Methods'));
addpath(fullfile(pwd, '/Tools'));
addpath(fullfile(pwd, '/ksvdbox'));
addpath(fullfile(pwd, '/ompbox'));

% Train Dictionary using K-SVD
dict_size = 512;

disp(['Training dictionary of size ' num2str(dict_size) 'using K-SVD...');
dict_conf.scale = 3;
dict_conf.window = [3 3];
dict_conf.border = [1 1];
dict_conf.interpolate_kernel = 'bicubic';
