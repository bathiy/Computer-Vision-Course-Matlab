img1 = imread("OrionNebula1.png");
img2 = imread("OrionNebula2.png");
img3 = imread("OrionNebula3.png");
img4 = imread("OrionNebula4.png");
img5 = imread("OrionNebula5.png");
avg = (img1 + img2 + img3 + img4 + img5)/5;

avg1 = (im2double(img1) + im2double(img2) + im2double(img3) + im2double(img4) + im2double(img5))/5;
montage({avg, avg1});

new = im2uint8(avg1);
imshow(new);

new1 = im2gray(new);
imshow(new1);

new2 = imresize(new1, 0.10);
imshow(new2);

imwrite(new1, "new1.png");
imwrite(new1, "new11.jpg", "Quality",80)