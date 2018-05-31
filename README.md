# VisDrone2018

**说明：后续可能不更新了。**

**Tips: this repo will not be updated.** 

Baseline：
 
 Name|maxDets|Result
---------------|------------------|----------------
Average Precision  (AP) @( IoU=0.50:0.95) | maxDets=500  | 15.8738%.
Average Precision  (AP) @( IoU=0.50     ) | maxDets=500  | 21.7822%.
Average Precision  (AP) @( IoU=0.75     ) | maxDets=500  | 17.1753%.
Average Recall     (AR) @( IoU=0.50:0.95) | maxDets=  1  | 0.83255%.
Average Recall     (AR) @( IoU=0.50:0.95) | maxDets= 10  | 7.1636%.
Average Recall     (AR) @( IoU=0.50:0.95) | maxDets=100  | 20.7602%.
Average Recall     (AR) @( IoU=0.50:0.95) | maxDets=500  | 20.7602%.


Cases From Test DataSet:

<figure class="half">
    <img src="case/1.png">
    <img src="case/2.png">
</figure>

<figure class="half">
    <img src="case/3.png">
    <img src="case/4.png">
</figure>

ECCV2018的一个workshop举办的比赛，详见[Vision Meets Drones: A Challenge](http://www.aiskyeye.com/).

VisDrone2018_Dev_Kit: 官方提供的针对数据集的工具，用于评测。可以改为其他工具，比如在图片上显示BBox；

Txt2XML: 官方给定数据集的Ground Truth是自己的标注方式（Txt），该工具将该标注方式转化为PASCAL VOC2007的标注方式（XML）；Python实现；

ShowBBOXFromXML: 针对PASCAL VOC2007，在图片上显示BBox；Python实现；该工具已经和官方给定基于Matlab的代码做过准确度对比，检验通过；

数据集的Badcase: 将BBox画成一条线的，导致NaN错误，需要过滤，详情可以参考issues;

Code中分享了基于PyTorch的Faster R-CNN代码用于这个比赛，原始代码来自[@jwyang](https://github.com/jwyang/faster-rcnn.pytorch)，原始代码写的也有很多不完善的地方，但是是基于PyTorch实现的star最多的，用起来是没有问题的。Code中的仅仅作为该比赛代码的备份，不做正式分享。比如，没有数据。如果想要在现有代码基础上做些工作，可以联系我本人，帮助跑代码。



