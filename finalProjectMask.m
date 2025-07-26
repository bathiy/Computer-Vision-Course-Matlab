function BW= finalProjectMask(X)

BW = im2double(im2gray(X)) > 0.147;

if sum(BW(:)) ~= 0
    width = 36;
    se = strel('square', width);
    BW = imclose(BW, se);
    BW = imopen(BW, se);
end

end

