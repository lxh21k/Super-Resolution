function conf = Learn_dict(HRimg, conf, dict_size)

HRimg = modcrop(HRimg, conf.scale);
LRimg = ims_resize(HRimg, 1/conf.scale, conf.interpolate_kernel);
LRimg = ims_resize(LRimg, conf.scale, conf.interpolate_kernel);

% extract features from low-resolution images
features = extr_fea(LRimg, conf);

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
[conf.dict_lRimg, alpha] = ksvd(ksvd_conf); 
toc;