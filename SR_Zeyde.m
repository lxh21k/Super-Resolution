function [imgs, interpolated] = SR_Zeyde(conf, imgs)

LRimg = ims_resize(imgs, conf.scale, conf.interpolate_kernel);
interpolated = resize(imgs, conf.scale, conf.interpolate_kernel);
    
for i = 1:numel(LRimg)
    features = extr_fea({LRimg(i)}, conf);
    features = double(features);
    % Encode features using OMP algorithm      

    coeffs = omp(double(conf.dict_LRimg), conf.V_pca' * features, [], 3);                        

    % Reconstruct using patches' dictionary
    patches = conf.dict_hires * full(coeffs); 
    
    % Add low frequencies to each reconstructed patch
    patches = patches + collect(conf, {interpolated(i)}, conf.scale, {});

    % Combine all patches into one image
    img_size = size(imgs{i}) * conf.scale;
    grid = sampling_grid(img_size, ...
        conf.window, conf.overlap, conf.border, conf.scale);
    result = overlap_add(patches, img_size, grid);
    imgs{i} = result; % for the next iteration
end
