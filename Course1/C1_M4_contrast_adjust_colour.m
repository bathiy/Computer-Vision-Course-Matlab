%img = imread("20250102_215749.jpg");
%imhsv = rgb2hsv(img);
%imhsv(:, :, 3) = imadjust(imhsv(:, :, 3));
%imhsv(:, :, 3) = adapthisteq(imhsv(:, :, 3));
%imgnew = hsv2rgb(imhsv);
%imgnew = im2uint8(imgnew);
%montage({img, imgnew})

%img1 = imread("");
%img1 = imreducehaze(img1);
%imshow(img1)


darkCity = imread("20250102_215749.jpg");
amount = 1;
brightCity = imlocalbrighten(darkCity, amount);
montage({darkCity, brightCity})