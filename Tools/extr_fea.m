function [features] = extr_fea(imgs, conf)

    
num_of_imgs = numel(imgs);
feature_cell = cell(num_of_imgs, 1);
num_of_features = 0;

for i = 1:num_of_imgs
    sz = size(imgs{i});
    feature_cell{i} = conv_fea(imgs{i}, conf);
    num_of_features = size(feature_cell{i}, 2) + num_of_features;
    
end

feature_size = size(feature_cell{1}, 1);
features = zeros([feature_size num_of_features], 'double');

offset = 0;
for i = 1:num_of_imgs
    fea = feature_cell{i};
    num = size(fea, 2);
    features(:, (1:num)+offset) = fea;
    offset = offset + num;
end

