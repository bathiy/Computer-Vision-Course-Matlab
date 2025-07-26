img = imread("testCoinImage3.png");
img = im2gray(img);

filter = fspecial("average", [3, 3]);
img_avg = imfilter(img, filter);

BW = imbinarize(img_avg, "global");

se = strel("disk", 3, 0);
se2 = strel("disk", 14, 0);
se3 = strel("disk", 30, 0);

BW = imerode(BW, se);
BW = imdilate(BW, se);

BW_final = imfill(BW, "holes");
BW_final2 = imerode(BW_final, se2);
%imshow(BW_final)

img_avg = imgaussfilt(img, 0.7);

img_edge = edge(img_avg, "sobel", 0.05);
img_edge(~BW_final2) = 0;

img_sep = imdilate(img_edge, se3);

validCoinMask = img_sep & BW_final;

imshow(validCoinMask);
[L, num] = bwlabel(validCoinMask);
stat = regionprops(L, 'Area');

nDimes = 0;
nNickels = 0;
nQuarters = 0; 
nFiftyCents = 0; 

for i = 1:length(stat)
    area = stat(i).Area;
    if (3500<area) && (area< 5000)
        nDimes = nDimes + 1;
    elseif (5000<area) && (area< 7000)
        nNickels = nNickels + 1;
    elseif (7000<area) && (area< 8000)
        nQuarters = nQuarters + 1;
    elseif (area > 8000)
        nFiftyCents = nFiftyCents + 1;
    end
end

USD = nDimes*0.10 + nNickels*0.05 + nQuarters*0.25 + nFiftyCents*0.50;