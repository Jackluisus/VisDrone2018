close all;
warning off; %#ok<WNOFF>
addpath('utils');



%datasetPath = './VisDrone2018-DET-test-challenge/'; % dataset path
%resPath = './Faster-RCNN_results-test-challenge/'; % result path
datasetPath = '../../Data/VisDrone2018-DET-val/'
resPath = '../../Results/Det/19/annotations'

gtPath = fullfile(datasetPath, 'annotations'); % annotation path
imgPath = fullfile(datasetPath, 'images'); % image name path

%Eval all images
nameImgs = findImageList(gtPath); % image list(for all imgs)

%Eval single images
%img_idx = '0000026_01000_d_0000026'
%img_idx = '0000364_01765_d_0000782'
%img_idx = '0000295_00200_d_0000022'
%img_idx = '0000249_03900_d_0000011'

% flag to display the groundtruth and detections
isImgDisplay = false; 
%nameImgs = cell(1,1)
%nameImgs(1,1) = {[strcat(img_idx,'.txt')]}

numImgs = length(nameImgs);
% process the annotations and groundtruth
[allgt, alldet] = saveAnnoRes(gtPath, resPath, numImgs, nameImgs);

% show the groundtruth and detection results
displayImage(imgPath, numImgs, nameImgs, allgt, alldet, isImgDisplay);

% claculate average precision and recall over all 10 IoU thresholds (i.e., [0.5:0.05:0.95]) of all object categories
[AP, AR, AP_all, AP_50, AP_75, AR_1, AR_10, AR_100, AR_500] = calcAccuracy(numImgs, allgt, alldet);

% print the average precision and recall
% disp(['Average Precision  (AP) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(roundn(AP_all,-2)) '%.']);
% disp(['Average Precision  (AP) @[ IoU=0.50      | maxDets=500 ] = ' num2str(roundn(AP_50,-2)) '%.']);
% disp(['Average Precision  (AP) @[ IoU=0.75      | maxDets=500 ] = ' num2str(roundn(AP_75,-2)) '%.']);
% 
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=  1 ] = ' num2str(roundn(AR_1,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets= 10 ] = ' num2str(roundn(AR_10,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=100 ] = ' num2str(roundn(AR_100,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(roundn(AR_500,-2)) '%.']);

disp('****************AP***************')
disp(AP)
disp('****************AR***************')
disp(AR)
disp('****************Details***************')
disp(['Average Precision  (AP) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(AP_all) '%.']);
disp(['Average Precision  (AP) @[ IoU=0.50      | maxDets=500 ] = ' num2str(AP_50) '%.']);
disp(['Average Precision  (AP) @[ IoU=0.75      | maxDets=500 ] = ' num2str(AP_75) '%.']);

disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=  1 ] = ' num2str(AR_1) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets= 10 ] = ' num2str(AR_10) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=100 ] = ' num2str(AR_100) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(AR_500) '%.']);

