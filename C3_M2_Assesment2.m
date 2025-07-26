video_a = VideoReader("liquidVideo.mp4");
videon_a = VideoWriter("liquidmeasure.mp4", "MPEG-4");
  
average_frame = im2double(read(video_a, 1));

open(videon_a)
for i = 1:video_a.NumFrames
    impro = read(video_a, i);
    impro = im2double(impro);
    impro_diff = abs(impro - average_frame);
    bw = liquidmaskmeasure(impro_diff);
    props = regionprops("table", bw, "BoundingBox");
    
    if isempty(props)
        textPosition = [10, 200];
        textString = sprintf('%.2f cm', 0.0);
        boxedImage = insertText(impro, textPosition, textString, 'FontSize', 10, 'BoxColor', 'yellow', 'TextColor', 'black'); 
    else
        bbox = props.BoundingBox;
        upperY = bbox(2);
        lowerY = 216.5;    
        xCoord = 100;      
    

        pixellength = lowerY - upperY;
        lineHeight = 3.4 * pixellength / 216.00;
 
        linePoints = [xCoord, upperY, xCoord, lowerY];
    
        textPosition = [10, 200];  
        textString = sprintf('%.2f cm', lineHeight);
    
        lined = insertShape(impro, 'Line', linePoints, 'LineWidth', 3, 'Color', 'yellow');
        boxedImage = insertText(lined, textPosition, textString, 'FontSize', 10, 'BoxColor', 'yellow', 'TextColor', 'black');  
    end
    
    writeVideo(videon_a, boxedImage);
end
close(videon_a)