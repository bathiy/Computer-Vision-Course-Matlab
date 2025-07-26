%img = imread("ankleXray.png");
%imshow(img)
%imhist(img)
%ylim([0 inf]);

%imgadj = imadjust(img);
%imghis = histeq(img);
%imgadp = adapthisteq(img);
%imgnew = adapthisteq(imgadj);

%montage({imgadj, imghis, imgadp, imgnew})

%imhist(imghis)

img1 = imread("chestXray.tif");
imgnew = adapthisteq(imadjust(img1));
montage({imgnew, img1})