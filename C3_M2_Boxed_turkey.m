video = VideoReader("Turkey Video.mp4");
videon = VideoWriter("Turkey box.mp4", "MPEG-4");


imframe = im2double(read(video, 1));
for i = 2:video.NumFrames
    imframe = imframe + im2double(read(video, i));
end    
average_frame = imframe/video.NumFrames;

open(videon)
for i = 1:video.NumFrames
    impro = read(video, i);
    impro = im2double(impro);
    impro_diff = abs(impro - average_frame);
    bw = TurkeyTrack(impro_diff);
    props = regionprops("table", bw, "BoundingBox");
    boxed = insertShape(impro, "Rectangle", props.BoundingBox, "LineWidth", 3, "Color", "red");
    writeVideo(videon, boxed);
end
close(videon)