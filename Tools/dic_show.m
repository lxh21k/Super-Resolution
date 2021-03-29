function [Dicimg] = dic_show(Dic)

d = sqrt(size(Dic,1));
D = ceil(sqrt(size(Dic,2)));

Dicimg = zeros(D*(d+2), D*(d+2));

gridx = 2:d+2:D*(d+2);
gridy = 2:d+2:D*(d+2);

for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        x = gridx(ii);
        y = gridy(jj);
        patch = reshape(Dic(:,ii+jj-1), [d,d]);
        Dicimg(x:x+d-1,y:y+d-1) = Dicimg(x:x+d-1,y:y+d-1) + patch;
        Dicimg(x-1,:) = 0;
        Dicimg(x+d,:) = 0;
        Dicimg(:,y-1) = 0;
        Dicimg(:,y+d) = 0;
    end
end

imshow(Dicimg);

end

