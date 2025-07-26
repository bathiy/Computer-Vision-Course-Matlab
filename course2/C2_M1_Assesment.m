img = imread("roadlanes.jpg");
img = im2gray(img);
img = imgaussfilt(img, 2, FilterSize=3);
%imgEdges = edge(img, "canny", [0.05 0.4]);
imgEdges = edge(img, "sobel", "nothinning");
imshow(imgEdges)