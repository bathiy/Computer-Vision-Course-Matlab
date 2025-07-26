img = imread("coinImage.png");

imgaverage = fspecial("average", [3,3]);
imgfilter = imfilter(img, imgaverage);
montage({img, imgfilter});

%imgaverage = fspecial("disk", 3);
%imgfilter = imfilter(img, imgaverage);
%montage({img, imgfilter});

%sigma = 0.5;
%imgfilter = imgaussfilt(img, sigma, FilterSize=9);

%imgaverage = fspecial("motion", 9, 278);
%imgfilter = imfilter(img, imgaverage);
%montage({img, imgfilter});


%img = imadjust(img);
%imgfilter = imadjust(imgfilter);

bw1 = imbinarize(img, "adaptive");
bw2 = imbinarize(imgfilter, "adaptive");
montage({img, imgfilter})