video = VideoReader("Turkey Video.mp4");
imframe = im2double(read(video, 1));
for i = 2:video.NumFrames
    imframe = imframe + im2double(read(video, i));
end    
average_frame = imframe/video.NumFrames;


frame1 = im2double(read(video, 29));
framediff1 = abs(frame1 - average_frame);

frame2 = im2double(read(video, 290));
framediff2 = abs(frame2 - average_frame);

frame3 = im2double(read(video, 490));
framediff3 = abs(frame3 - average_frame);

frame4 = im2double(read(video, 690));
framediff4 = abs(frame4 - average_frame);

grayimg = im2gray(framediff1);
grayimg = im2double(grayimg);
lowcon = grayimg.^1.5;
imshow(lowcon)