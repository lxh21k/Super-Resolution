function imgs = ims_resize(imgs, scale, method)

for i = 1:numel(imgs)
    imgs{i} = imresize(imgs{i}, scale, method);
end
