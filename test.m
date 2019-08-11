%clc;clear;
%cut the mergePic
tic
mergePicPath = './mergePic/gakki.jpg';
inputImgPath = './inputPics';
longX = 4;
shortX = 3; %4:3的图片

ratio = longX/shortX; 
%minPicsNum = 1000;%设定最小的像素数量
minPicsNum = 51000;%设定最小的像素数量

[ mergePic, chunkSize, picNumBase] = cutMergePic( mergePicPath , longX, shortX, minPicsNum);

longEdgeMin = 40;
shortEdgeMin = 30; %拼的小图的最小的大小

outSize = setOutSize(chunkSize, longEdgeMin, shortEdgeMin);

picNum = picNumBase^2; %输入图片的推荐张数

%读取输入的图片，返回一个cell
picsCell = readInputPics(inputImgPath, ratio);

%
picRepo=createPicRepo( picsCell );

% 切割并找到最佳匹配的图片 以及拼接图片

nx = size(mergePic,1)/chunkSize(1);
ny = size(mergePic,2)/chunkSize(2);

outputImg = [];

for i=1:nx    
    outRow = [];
    for j = 1:ny
        
        leftUp = [(i-1)*chunkSize(1)+1, (j-1)*chunkSize(2)+1];                
        rightBottom = [leftUp(1)+chunkSize(1)-1, leftUp(2)+chunkSize(2)-1];
        
        mergePicSplit = mergePic(leftUp(1):rightBottom(1), leftUp(2):rightBottom(2), :);
        
        [matchSplit] = findMatchSplitImproved(mergePicSplit, picsCell, picRepo);
        
        %imshow(matchSplit);                 
        
        outRow = [outRow imresize(matchSplit, outSize)];
    end 
    outputImg = [outputImg;outRow];
end

imshow(outputImg);
outimgpath = sprintf('outputImg%d像素.jpg', nx*ny);   
imwrite(outputImg,outimgpath);
toc



