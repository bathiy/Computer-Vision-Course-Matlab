%img = imread("1_SnowPoolsBefore_20180113_md-2048px.jpg");
%imshow(img)

%hsvimg = rgb2hsv(img);
%ycbcrimg = rgb2ycbcr(img);
%labimg = rgb2lab(img);
% imshow(labimg)

%img(1:10, 1:10, 3);
%hsvimg(1:10, 1:10, 3);
%ycbcrimg(1:10, 1:10, 3);
%labimg(1:10, 1:10, 3);

preflood = imread("stlouis_l5tm_14aug91_30m.jpg");
postflood = imread("stlouis_l5tm_19aug93_30m.jpg");
%montage({preflood, postflood});

[bwimg1, img1] = createMask(preflood);
[bwimg2, img2] = createMask(postflood);

percentage = (nnz(bwimg2) - nnz(bwimg1)) / nnz(bwimg1) * 100;