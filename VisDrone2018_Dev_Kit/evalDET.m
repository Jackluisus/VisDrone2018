close all;
warning off; %#ok<WNOFF>
addpath('utils');

isImgDisplay = true; % flag to display the groundtruth and detections

%datasetPath = './VisDrone2018-DET-test-challenge/'; % dataset path
%resPath = './Faster-RCNN_results-test-challenge/'; % result path
datasetPath = '../../Data/Merge_VisDrone2018/'
resPath = '../../Data/Merge_VisDrone2018/Res_annotations'

gtPath = fullfile(datasetPath, 'TXT_annotations'); % annotation path
imgPath = fullfile(datasetPath, 'JPEGImages'); % image name path

%nameImgs = findImageList(gtPath); % image list(for all imgs)
nameImgs = cell(1,1) % image list(for single imgs)

img_idx = '0000001_04527_d_0000008'

nameImgs(1,1) = {[strcat(img_idx,'.txt')]}
numImgs = length(nameImgs);
% process the annotations and groundtruth
[allgt, alldet] = saveAnnoRes(gtPath, resPath, numImgs, nameImgs);

% show the groundtruth and detection results
displayImage(imgPath, numImgs, nameImgs, allgt, alldet, isImgDisplay);

% claculate average precision and recall over all 10 IoU thresholds (i.e., [0.5:0.05:0.95]) of all object categories
[AP_all, AP_50, AP_75, AR_1, AR_10, AR_100, AR_500] = calcAccuracy(numImgs, allgt, alldet);

% print the average precision and recall
% disp(['Average Precision  (AP) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(roundn(AP_all,-2)) '%.']);
% disp(['Average Precision  (AP) @[ IoU=0.50      | maxDets=500 ] = ' num2str(roundn(AP_50,-2)) '%.']);
% disp(['Average Precision  (AP) @[ IoU=0.75      | maxDets=500 ] = ' num2str(roundn(AP_75,-2)) '%.']);
% 
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=  1 ] = ' num2str(roundn(AR_1,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets= 10 ] = ' num2str(roundn(AR_10,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=100 ] = ' num2str(roundn(AR_100,-2)) '%.']);
% disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(roundn(AR_500,-2)) '%.']);

disp(['Average Precision  (AP) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(AP_all) '%.']);
disp(['Average Precision  (AP) @[ IoU=0.50      | maxDets=500 ] = ' num2str(AP_50) '%.']);
disp(['Average Precision  (AP) @[ IoU=0.75      | maxDets=500 ] = ' num2str(AP_75) '%.']);

disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=  1 ] = ' num2str(AR_1) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets= 10 ] = ' num2str(AR_10) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=100 ] = ' num2str(AR_100) '%.']);
disp(['Average Recall     (AR) @[ IoU=0.50:0.95 | maxDets=500 ] = ' num2str(AR_500) '%.']);

