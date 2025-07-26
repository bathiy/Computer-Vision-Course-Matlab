img = im2gray(imread("rice.png"));
BW = imbinarize(img, "adaptive");
montage({img, BW});

