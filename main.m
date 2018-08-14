clc;clear;
%cut the mergePic

mergePicPath = './mergePic/mergePic.jpg';
inputImgPath = './inputPics';
longX = 4;
shortX = 3; %4:3的图片

ratio = longX/shortX; 
picNumBase = 35;

[ mergePic, chunkSize, picNumBase] = cutMergePic( mergePicPath , longX, shortX, picNumBase);

picNum = picNumBase^2; %输入图片的推荐张数


%读取输入的图片，返回一个cell
picsCellTemp = readInputPics(inputImgPath); %这个是为了每张图片都使用到
picsCell = readInputPics(inputImgPath); %这个是用完所有图片后，直接遍历找到最接近的那一张图

% 切割并找到最佳匹配的图片

nx = size(mergePic,1)/chunkSize(1);
ny = size(mergePic,2)/chunkSize(2);

%outputImgCell = cell(nx,ny); 

outputImg = [];

for i=1:nx    
    outRow = [];
    for j = 1:ny
        
        leftUp = [(i-1)*chunkSize(1)+1, (j-1)*chunkSize(2)+1];                
        rightBottom = [leftUp(1)+chunkSize(1)-1, leftUp(2)+chunkSize(2)-1];
        
        mergePicSplit = mergePic(leftUp(1):rightBottom(1), leftUp(2):rightBottom(2), :);
        
        [matchSplit, picsCellTemp] = findMatchSplit(mergePicSplit, picsCellTemp, picsCell);
        
        %imshow(matchSplit);                
        %outputImgCell{i, j} = imresize(matchSplit, chunkSize);   
        
        outRow = [outRow imresize(matchSplit, chunkSize)];
    end 
    outputImg = [outputImg;outRow];
end

% 拼接图片

imshow(outputImg);
imwrite(outputImg,'outputImg.jpg');
