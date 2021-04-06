function conf = Learn_dict(HRimg, conf, dict_size)

HRimg = modcrop(HRimg, conf.scale);
LRimg = ims_resize(HRimg, 1/conf.scale, conf.interpolate_kernel);
LRimg = ims_resize(LRimg, conf.scale, conf.interpolate_kernel);

% extract features from low-resolution images
features = extr_fea(LRimg, conf);

patches = cell(size(HRimg));
for i = 1:numel(patches) % Remove low frequencies
    patches{i} = HRimg{i} - LRimg{i};
end

patches_fea = extr_fea(patches, conf);

% Configure K-SVD
ksvd_conf.iternum = 20; % TBD
ksvd_conf.memusage = 'normal'; % higher usage doesn't fit...
ksvd_conf.dictsize = dict_size; % TBD
ksvd_conf.Tdata = 3; % maximal sparsity: TBD
ksvd_conf.samples = size(features,2);
ksvd_conf.data = features;

% Training process (will take a while)
tic;
fprintf('Training [%d x %d] dictionary on %d vectors using K-SVD\n', ...
    size(ksvd_conf.data, 1), ksvd_conf.dictsize, size(ksvd_conf.data, 2))
[conf.dict_LRimg, alpha] = ksvd(ksvd_conf); 
toc;

fprintf('Computing high-res. dictionary from low-res. dictionary\n');
% dict_hires = patches / full(gamma); % Takes too much memory...
patches_fea = double(patches_fea); % Since it is saved in single-precision.
dict_HRimg = (patches_fea * alpha') / (full(alpha * alpha'));

conf.dict_HRimg = dict_HRimg;