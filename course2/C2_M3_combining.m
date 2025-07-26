img = imread("coloredChips.png");
%imshow(img)

Bw1 = C2_M3_segmentImage_bright(img);
Bw2 = C2_M3_segmentImage_dark(img);

imnew = Bw1 | Bw2;
montage({Bw1, Bw2, imnew})