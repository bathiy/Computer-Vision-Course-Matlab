img = im2gray(imread("00051.JPG"));
BW = imbinarize(img, 0.65364);

montage({img, BW});

graythresh(img);