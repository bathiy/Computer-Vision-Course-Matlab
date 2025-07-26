img = imread("Puzzle_06.jpg");
img_hsv = rgb2hsv(img);

chipmask = img_hsv(:, :, 2)>0.23 & img_hsv(:, :, 3) > 0.76;

BW = chipmask;
BW = imopen(BW, strel('disk', 5)); 
BW = imclose(BW, strel('disk', 5)); 
imshow(BW)

img_chip_mask = img_hsv;
img_chip_mask(repmat(~chipmask, 1, 1, 3)) = 0;

k = 3;
labels = imsegkmeans(im2single(img_chip_mask), k);
img_new = label2rgb(labels);
imshow(img_new);