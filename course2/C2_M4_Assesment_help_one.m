img = imread("testCoinImage1.png");
img = im2gray(img);


filter = fspecial("average", [3, 3]);
img_avg = imfilter(img, filter);

BW = imbinarize(img_avg, "global");

se = strel("disk", 3, 0);
se2 = strel("disk", 5, 0);

BW = imerode(BW, se);
BW = imdilate(BW, se);

BW_final = imfill(BW, "holes");
BW_final2 = imerode(BW_final, se2);
montage({BW_final, BW_final2})