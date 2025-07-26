img  = imread("00146.jpg");
img = im2gray(img);
multhresh = 2;
img_mul = multithresh(img, multhresh);
img_thres = imquantize(img, img_mul);
BW = img_thres > 1;
ss = strel("disk", 4.0);
BW = imopen(BW, ss);
BW = imclose(BW, ss);
BW = imfill(BW,"holes");
BW = imcomplement(BW);

new_overlay = imoverlay(img, BW);
imshow(new_overlay)