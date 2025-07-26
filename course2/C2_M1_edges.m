img = imread("coinImage.png");

filter = fspecial("disk",5);
img = imfilter(img, filter);
%montage({filter, img})

Bw = edge(img, "canny");
imshow(Bw);
