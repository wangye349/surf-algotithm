boxImage = imread('lena1.png');
sceneImage = imread('lena2.png');
sceneImage = rgb2gray(sceneImage);
boxImage = rgb2gray(boxImage);
boxPoints = detectSURFFeatures(boxImage)
scenePoints = detectSURFFeatures(sceneImage);
size(boxPoints)
size(scenePoints)
[boxFeatures,boxPoints] = extractFeatures(boxImage,boxPoints);
[sceneFeatures,scenePoints] = extractFeatures(sceneImage,scenePoints);
boxPairs = matchFeatures(boxFeatures,sceneFeatures);
% display putatively matched features
matchedBoxPoints = boxPoints(boxPairs(:,1),:);
matchedScenePoints = scenePoints(boxPairs(:,2),:);
figure;
showMatchedFeatures(boxImage,sceneImage,matchedBoxPoints,matchedScenePoints,'montage'):title('Matched Points(Including Outliers)');
[tform,inlierBoxPoints,inlierScenePoints] = estimateGeometricTransform(matchedBoxPoints,matchedScenePoints,'affine');
% display the matching points pairs with the outliers removed
figure;
showMatchedFeatures(boxImage,sceneImage,inlierBoxPoints,inlierScenePoints,'montage'):title('Matched Points(inliers Only)');
% Get the bounding polygon of the reference image
boxPolygon = [1,1;
              size(boxImage,2),1;
              size(boxImage,2),size(boxImage,1);
              1,size(boxImage,1);
              1,1];
newBoxPolygon = transformPointsForward(tform,boxPolygon);
% display
figure;
imshow(sceneImage);
hold on;
line(newBoxPolygon(:,1),newBoxPolygon(:,2),'Color','y');
title('Detected Box');
figure; imshow(boxImage);
title('100 Strongest Feature Points from Box Image');
hold on;
plot(boxPoints.selectStrongest(100));
figure; imshow(sceneImage);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(scenePoints.selectStrongest(300));