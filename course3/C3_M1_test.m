%img_read = imread("00099.jpg");
%img_out = C3_M1_Segmentation(img_read);
%imshow(img_out)

%img = imread("Puzzle_01.jpg");
%[imseg, propimg] = processPuzzle(img);
%areaimg = sum(propimg);
%imshow(imseg)

imagesFolder = fullfile("E:\Image processing\Codes\Image Processing for Engineering and Science\Data\Data\MathWorks Images\MathWorks Puzzle");
imds = imageDatastore(imagesFolder);

image = [];
true_re = [];
true_pi = [];

while hasdata(imds)
    [img, oinfo] = read(imds);
    [imgp, iminfo] = processPuzzle(img);
    [labelimg, numofRe] = bwlabel(imgp);
    truep = sum(imgp(:));

    image = [image; string(oinfo.Filename)];
    true_re = [true_re; numofRe];
    true_pi = [true_pi; truep];
end

digitdata = table(image, true_re, true_pi);

true_pixel = sum(digitdata.true_pi);
true_regio = sum(digitdata.true_re);