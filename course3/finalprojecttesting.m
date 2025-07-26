video = VideoReader("RadioTraffic_NNGray.mp4");
background = im2double(im2gray(read(video, 1)));
frame = im2double(im2gray(read(video, 151)));

diff = abs(frame - background);

img = finalProjectMask(diff);
imshow(img)