img = imread("picks.jpg");
imghsv = rgb2hsv(img);
imghsv_value = imghsv(:, :, 3);

imghsv_value_1 = imghsv_value.^(0.5);
imghsv(:, :, 3) = imghsv_value_1 ;
imgnew1 = hsv2rgb(imghsv);
imgnew1 = im2uint8(imgnew1);

%imghsv_value_2 = imadjust(imghsv_value);
%imghsv(:, :, 3) = imghsv_value_2 ;
%imgnew2 = hsv2rgb(imghsv);
%imgnew2 = im2uint8(imgnew2);

%imghsv_value_3 = histeq(imghsv_value);
%imghsv(:, :, 3) = imghsv_value_3 ;
%imgnew3 = hsv2rgb(imghsv);
%imgnew3 = im2uint8(imgnew3);

%imghsv_value_4 = adapthisteq(imghsv_value);
%imghsv(:, :, 3) = imghsv_value_4 ;
%imgnew4 = hsv2rgb(imghsv);
%imgnew4 = im2uint8(imgnew4);

imshow(imgnew1)