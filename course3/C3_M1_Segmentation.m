function final_image = C3_M1_Segmentation(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

gi = im2gray(img);
gfi = imgaussfilt(gi, 1.5);

%thresh = multithresh(gfi, 2);
%levels = imquantize(gfi, thresh);

levels = imbinarize(gfi);

bw = levels;
bw = ~bw;

se = strel("disk", 5);
%bw = imclose(bw, se);
bw = imopen(bw, se);
%bw = imclose(bw, se);



final_image = bw;
end