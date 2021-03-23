
function [imgs, imgsCB, imgsCR] = load_image(directory, pattern)

files = dir(fullfile(directory, pattern));

paths = cell(numel(files), 1);
for i = 1:numel(paths)
    paths{i} = fullfile(directory, files(i).name);
end

imgs = cell(size(paths));
imgsCB = cell(size(paths));
imgsCR = cell(size(paths));

for i = 1:numel(paths)
    IMG = imread(paths{i});
    if size(IMG, 3) ==3
        IMG = rgb2ycbcr(IMG);
        imgsCB{i} = IMG(:, :, 2);
        imgsCR{i} = IMG(:, :, 3);
        IMG = IMG(:, :, 1);
    end
    imgs{i} = IMG;
end
