clc;clear;
%cut the mergePic

mergePicPath = './mergePic/mergePic.jpg';
inputImgPath = './inputPics';
longX = 4;
shortX = 3; %4:3��ͼƬ

ratio = longX/shortX; 
picNumBase = 35;

[ mergePic, chunkSize, picNumBase] = cutMergePic( mergePicPath , longX, shortX, picNumBase);

picNum = picNumBase^2; %����ͼƬ���Ƽ�����


%��ȡ�����ͼƬ������һ��cell
picsCellTemp = readInputPics(inputImgPath); %�����Ϊ��ÿ��ͼƬ��ʹ�õ�
picsCell = readInputPics(inputImgPath); %�������������ͼƬ��ֱ�ӱ����ҵ���ӽ�����һ��ͼ

% �и�ҵ����ƥ���ͼƬ

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

% ƴ��ͼƬ

imshow(outputImg);
imwrite(outputImg,'outputImg.jpg');
