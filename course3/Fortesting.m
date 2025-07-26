%img = imread("frame240.png");
%bwm = VideoFrameProcess(img);
%imshow(bwm)

%implay("newshuttle.avi");

%img = imread("IMG_20250106_100830.jpg");
%img_hsv = rgb2hsv(img);
%f = fspecial("average", [5, 5]);
%img_hsv(:, :, 3) = imfilter(img_hsv(:, :, 3), f);
%img_hsv(:, :, 2) = imfilter(img_hsv(:, :, 2), f);

%img_hsv(:, :, 3) = img_hsv(:, :, 3).^(0.515);

%img_new = hsv2rgb(img_hsv);
%imshow(img_new)

video = VideoReader("liquidVideo.mp4");
average_frame = im2double(read(video, 1));
frame1 = im2double(read(video, 29));
frame2 = im2double(read(video, 175));
frame3 = im2double(read(video, 220));
frame4 = im2double(read(video, 100));

video.CurrentTime = 16.7; 
frameAt16_7 = im2double(readFrame(video));

diff1 = abs(frame1 - average_frame);
diff2 = abs(frame2 - average_frame);
diff3 = abs(frame3 - average_frame);
diff4 = abs(frame4 - average_frame);
diff = abs(frameAt16_7 - average_frame);

%bw1 = imbinarize(diff1, "adaptive");
%bw2 = imbinarize(diff2, "adaptive");
%bw3 = imbinarize(diff3, "adaptive");

%imshow(bw3)
bw1 = liquidmaskmeasure(diff1);
bw2 = liquidmaskmeasure(diff2);
bw3 = liquidmaskmeasure(diff3);
bw4 = liquidmaskmeasure(diff4);
bwass = liquidmaskmeasure(diff);

bw = bwass;
frame = frameAt16_7;

% Process the binary image
img = imfill(bw, 'holes');
se = strel("disk", 3);
img = imopen(img, se);
img = imclose(img, se);

white = sum(img(:));
total = 216 * 120;
percen = (white / total) * 100;

% Get the bounding box from regionprops
props = regionprops("table", img, "BoundingBox");

if isempty(props)
    % If no bounding box, just show the original frame
    lined = frame;
    textPosition = [10, 200]; % Adjust position as needed
    textString = sprintf('%.2f cm', 0.0);
    boxedImage = insertText(frame, textPosition, textString, 'FontSize', 10, 'BoxColor', 'yellow', 'TextColor', 'black'); % Use 'black' for better contrast
else
    % Extract bounding box and calculate height
    bbox = props.BoundingBox;
    upperY = bbox(2);  % Top-left y-coordinate of the bounding box
    lowerY = 216.5;    % Set the bottom y-coordinate (change as needed)
    xCoord = 100;      % x-coordinate for the line

    % Calculate line height
    pixellength = lowerY - upperY;
    lineHeight = 3.4 * pixellength / 216.00;

    % Define the line points
    linePoints = [xCoord, upperY, xCoord, lowerY];

    % Define text position
    textPosition = [10, (upperY + lowerY) / 2];  % Midpoint for text placement
    textString = sprintf('%.2f cm', lineHeight);

    % Insert the line and text into the image
    lined = insertShape(frame, 'Line', linePoints, 'LineWidth', 3, 'Color', 'yellow');
    boxedImage = insertText(lined, textPosition, textString, 'FontSize', 10, 'BoxColor', 'yellow', 'TextColor', 'black');  % 'black' for text color
end

% Display the image
figure;

subplot(2, 2, 1);
imshow(img); % Display the processed binary image

subplot(2, 2, 2);
imshow(boxedImage); % Display the image with the line and text
