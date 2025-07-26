img = imread("rice.png");

%imgaverage = fspecial("sobel");
%imgfilter = imfilter(img, imgaverage);
%montage({img, imgfilter});

%imgaverage = fspecial("prewitt");
%imgfilter = imfilter(img, imgaverage);
%montage({img, imgfilter});

%imgaverage = fspecial("laplacian", 0.2);
%imgfilter = imfilter(img, imgaverage);
%montage({img, imgfilter});

imgaverage = fspecial("log", [3, 3], 0.3);
imgfilter = imfilter(img, imgaverage);
montage({img, imgfilter});

bw1 = imbinarize(img, "adaptive");
bw2 = imbinarize(imgfilter, "adaptive");
montage({bw1, bw2, img, imgfilter})