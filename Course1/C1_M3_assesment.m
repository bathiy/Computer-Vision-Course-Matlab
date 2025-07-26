%imggray = imread("dimes3.jpg");
%Q2 = imbinarize(imggray);
%nnz_ = nnz(Q2);
%num = graythresh(imggray) * 255;
%[~,effectivenessMetric1] = graythresh(imggray);
%Q6 = imbinarize(imggray, 'adaptive');
% imshow(Q6)

%img_flood = imread("stlouis_l5tm_19aug93_30m.jpg");
%hsvimg = rgb2hsv(img_flood);
%ycbcrimg = rgb2ycbcr(img);
%labimg = rgb2lab(img);
%imshow(hsvimg)

img_melt_before = imread("1_SnowPoolsBefore_20180113_md-2048px.jpg");
img_melt_after = imread("2_SnowPoolsAfter_20200119_md-2048px.jpg");
[bw_, photo] = Assignment(img_melt_after);
imshow(photo)