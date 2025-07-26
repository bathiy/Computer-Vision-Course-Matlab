img = imread("boston night.JPG");
 
img = im2gray(img);
img1 = img;

img = im2double(img);
img = img.^(1/2);
img = imrotate(img, -1, 'crop');

imgadjusted = im2uint8(img);
imshow(imgAdjusted);


