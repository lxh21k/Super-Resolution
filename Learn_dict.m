function [dict_conf] = Learn_dict(HRimg, dict_conf, dict_size)

HRimg = modcrop(HRimg, dict_conf.scale);
LRimg = resize(HRimg, 1/dict_conf.scale, dict_conf.interpolate_kernel);
LRimg = resize(LRimg, dict_conf.scale, dict_conf.interpolate_kernel);

% extract features from low-resolution images
features = extr_fea(LRimg, conf.filter);
