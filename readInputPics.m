function [ ret ] = readInputPics( imgsInputpath)

fileFolder=fullfile(imgsInputpath);
dirOutput=dir(fullfile(fileFolder,'*'));%������ڲ�ͬ���͵��ļ����á�*����ȡ���У������ȡ�ض������ļ���'.'�����ļ����ͣ������á�.jpg��
fileNames={dirOutput.name}';

ret = {};
for i = 3:size(fileNames, 1)
    imgpath = sprintf('%s/%s', imgsInputpath,fileNames{i});    
    img = cutPic(imgpath, 4/3);
    
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    
    imgCell = {img, [mean(R(:)), mean(G(:)), mean(B(:))]};
        
    ret{i-2} = imgCell;
    
end

end

