video = VideoReader("RadioTraffic_NNGray.mp4");
videoseg = VideoWriter("RoadTraffic_segmented", "MPEG-4");

background = im2double(im2gray(read(video, 1)));
videoseg.FrameRate = video.FrameRate;

numberOfRegions = [];
MeanRegionsize = [];
totalRegionSize = [];

open(videoseg)

for i = 1:video.NumFrames
    frame = im2double(im2gray(read(video, i)));
    diff = abs(frame - background);
    img = finalProjectMask(diff);

    totalRegionSize = [totalRegionSize, sum(img(:))];
    [labelimage, numreg] = bwlabel(img);
    numberOfRegions = [numberOfRegions, numreg];
    avg = sum(img(:))/numreg;
    MeanRegionsize = [MeanRegionsize, avg];

    img = im2uint8(img);
    writeVideo(videoseg, img);
end

close(videoseg)

prop = table(numberOfRegions', MeanRegionsize', totalRegionSize');