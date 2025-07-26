img = imread("Puzzle_34.jpg");
img_seg = C2_M4_segmentImage(img);
%img_sel = C2_M4_filterRegions(img_seg);

%img = im2gray(img);
%img = imbinarize(img);

imshow(img_seg)