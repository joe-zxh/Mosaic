clc;clear;


%cut the mergePic

mergePicPath = './mergePic/mergePic.jpg';
longX = 4;
shortX = 3; %4:3��ͼƬ

picNum = 1500; %���������ͼƬ�ĸ��� 1500��
longNum = round(1500*longX/(longX+shortX));
shortNum = 1500-longNum;

ratio = longX/shortX; 
mergePic = cutMergePic(mergePicPath, ratio);

imwrite(mergePic,'mergePicTemp.jpg');

imshow(mergePic)







