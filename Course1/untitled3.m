img = im2gray(imread("00187.JPG"));
img = imresize(img, [114, 681]);
imshow(img)

%BW = imbinarize(img);
%BW = ~BW;
%montage({img, BW});

%nnz(BW);

%maskeimg = img;
%maskeimg(~BW) = 0;
%imshow(maskeimg)