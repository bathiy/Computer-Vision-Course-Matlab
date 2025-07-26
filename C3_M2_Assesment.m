vi_file = VideoReader("shuttle.avi");
%implay("shuttle.avi");

VOut = VideoWriter("newshuttle.avi", "Uncompressed AVI");
VOut.FrameRate = vi_file.FrameRate;

open(VOut)

for i = 1:118
    img = readFrame(vi_file);
    writeVideo(VOut, img);
end

close(VOut)

img1 = im2gray(frame1);
img2 = im2gray(frame3);

imb1 = img1 > 245;
imb2 = img2 > 245;

w = sum(imb2(:)) - sum(imb1(:));

subplot(1, 2, 1);
imshow(img);

subplot(1, 2, 2);
imshow(imb);