function [BW,maskedImage] = C2_M4_segmentImage(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 07-Jan-2025
%----------------------------------------------------



% Threshold image with adaptive threshold
BW = imbinarize(im2gray(RGB), 'adaptive', 'Sensitivity', 0.50047, 'ForegroundPolarity', 'bright');

% Fill holes
BW = imfill(BW, 'holes');

% Open mask with default
radius = 3;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);
BW = imclose(BW, se);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

