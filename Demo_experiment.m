clc;clear;

addpath(fullfile(pwd, '/Methods'));
addpath(fullfile(pwd, '/Tools'));
addpath(fullfile(pwd, '/ksvdbox'));
addpath(fullfile(pwd, '/ompbox'));

% Train Dictionary using K-SVD
dict_size = 512;

disp(['Training dictionary of size ' num2str(dict_size) ' using K-SVD...']);
conf.scale = 2;
conf.window = [3 3];
conf.border = [1 1];
conf.overlap = [1 1];
conf.interpolate_kernel = 'bicubic';

conf = Learn_dict(load_image('Data/Train/Yang', '*.bmp'), conf, dict_size);


