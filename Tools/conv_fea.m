function [features] = conv_fea(img, conf)


hf1 = [-1, 0, 1];
hf2 = [1, 0, -2, 0, 1];
filters = {hf1, hf1', hf2, hf2'};

grid = sampling_grid(size(img),conf.window,conf.overlap,conf.border,conf.scale);

feature_size = prod(conf.window) * 4;

features = zeros([feature_size, size(grid, 3)], 'single');

for i = 1:numel(filters)
    f = conv2(img, filters{i}, 'same');
    f = f(grid);
    f = reshape(f, [size(f,1)*size(f,2) size(f,3)]);
    features((1:size(f,1))+(i-1)*size(f,1), :) = f;
end

