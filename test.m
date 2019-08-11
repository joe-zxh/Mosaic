%clc;clear;
%cut the mergePic
tic
mergePicPath = './mergePic/gakki.jpg';
inputImgPath = './inputPics';
longX = 4;
shortX = 3; %4:3��ͼƬ

ratio = longX/shortX; 
%minPicsNum = 1000;%�趨��С����������
minPicsNum = 51000;%�趨��С����������

[ mergePic, chunkSize, picNumBase] = cutMergePic( mergePicPath , longX, shortX, minPicsNum);

longEdgeMin = 40;
shortEdgeMin = 30; %ƴ��Сͼ����С�Ĵ�С

outSize = setOutSize(chunkSize, longEdgeMin, shortEdgeMin);

picNum = picNumBase^2; %����ͼƬ���Ƽ�����

%��ȡ�����ͼƬ������һ��cell
picsCell = readInputPics(inputImgPath, ratio);

%
picRepo=createPicRepo( picsCell );

% �и�ҵ����ƥ���ͼƬ �Լ�ƴ��ͼƬ

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
outimgpath = sprintf('outputImg%d����.jpg', nx*ny);   
imwrite(outputImg,outimgpath);
toc



