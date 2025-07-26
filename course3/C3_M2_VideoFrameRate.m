Video = VideoReader("liquidVideo.mp4");
frames = Video.NumFrames;

VOut = VideoWriter("liquidbinary.mp4", "MPEG-4");
VOut.FrameRate = Video.FrameRate;

percent = [];
timeg = [];

open(VOut)

for i = 1:frames

    img = readFrame(Video);
    bw = VideoFrameProcess(img);
    liquid = sum(bw(:));
    total_size = numel(bw);
    percentage = (liquid / total_size) * 100;
    time = Video.CurrentTime;

    percent = [percent; percentage];
    timeg = [timeg; time];

    frame = imfuse(img, bw, "montage");
    writeVideo(VOut, frame);

end

close(VOut)

Video.CurrentTime = 0;

plot(timeg, percent);

xlabel('time');
ylabel('percentage');
title('percentage of filled');

grid on;