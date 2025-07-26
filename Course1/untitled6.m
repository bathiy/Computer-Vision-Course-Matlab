img = im2gray(imread("armxray.png"));
threshvalues = multithresh(img, 3);
label = imquantize(img, threshvalues);
imshow(label, []);
