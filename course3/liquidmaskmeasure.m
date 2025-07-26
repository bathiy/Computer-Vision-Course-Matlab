function img = liquidmaskmeasure(RGB)
I = rgb2hsv(RGB);

channel1Min = 0.789;
channel1Max = 0.943;

channel2Min = 0.000;
channel2Max = 0.667;

channel3Min = 0.193;
channel3Max = 1.000;


sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

img = imfill(BW, 'holes');
se = strel("disk", 3);
img = imopen(img, se);
img = imclose(img, se);

end
