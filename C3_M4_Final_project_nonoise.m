video = VideoReader("RoadTraffic.mp4");
video_new = VideoWriter("RoadTraffic_NoNoise.mp4", "MPEG-4");
video_cow = VideoWriter("RadioTraffic_NNGray.mp4", "MPEG-4");

video_cow.FrameRate = video.FrameRate;
video_new.FrameRate = video.Framerate;

open(video_new)
open(video_cow)

for i = 1:video.NumFrames
    frame1 = read(video, i);
    
    frame1(:, :, 1) = imgaussfilt(frame1(:, :, 1), 1); 
    frame1(:, :, 2) = imgaussfilt(frame1(:, :, 2), 1); 
    frame1(:, :, 3) = imgaussfilt(frame1(:, :, 3), 1); 

    writeVideo(video_new, frame1);
    
    frame1 = im2gray(frame1);
    writeVideo(video_cow, frame1);

end

close(video_cow)
close(video_new)