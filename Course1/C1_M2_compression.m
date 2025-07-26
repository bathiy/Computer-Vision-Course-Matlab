orian = imread("OrionNebula1.png");
moon = imread("half moon.jpg");

whos orian moon

%imwrite(orian, "Oriannebulajpg.jpg", Quality=100);
%imwrite(moon, "moonpng.png");

orian2 = imread("Oriannebulajpg.jpg");
moon2 = imread("moonpng.png");

%orianInfo = imfinfo("Oriannebulajpg.jpg");
%sizeO = orianInfo.FileSize;
%mooninfo = imfinfo("moonpng.png");
%sizeM = orianInfo.FileSize;

ans1 = isequal(moon, moon2);

imwrite(moon, "moonjpg.jpg", Quality=100);
moon3 = imread("moonjpg.jpg");
ans2 = isequal(moon3, moon);

moondiff = im2double(moon) - im2double(moon3);
moon4 = moondiff(:, :, 2);
imshow(moon4, []);
colorbar
