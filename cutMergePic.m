% 裁剪要合成的图。

function [ mergePic, chunkSize, picNumBase ] = cutMergePic( mergePicPath , longX, shortX, minPicsNum)

A = imread(mergePicPath);

x = size(A,1);
y = size(A,2);

picNumBase = round(sqrt(minPicsNum));

if (x<y) % 如果要被合成的图是横向的，那么会好处理一点，直接把picNumBase设为round(sqrt(minPicsNum))
    a = 1;
    m = a*picNumBase;
    
    while (longX*m<y && shortX*m <x)
        a=a+1;
        m = a*picNumBase;
    end
    
    a = a-1;
    m = a*picNumBase;
    
    picSize=[shortX*m, longX*m];
        
    
else % 被合成的图是纵向的，会难处理一点
    
    picNumBase = longX*shortX;
    i = 1;
    while((i*picNumBase)^2<minPicsNum)
        i=i+1;
    end
    picNumBase = i*picNumBase;
            
    p = shortX*picNumBase/longX;
    q = longX*picNumBase/shortX;
    
    a = 1;
    m = a*picNumBase;
    
    while(shortX*m<y && longX*m<x)
        a=a+1;
        m = a*picNumBase;        
    end   
    
    a = a-1;
    m = a*picNumBase;
    
    picSize=[longX*m, shortX*m];    
    
end

mergePic = cutPic(mergePicPath, longX/shortX);
mergePic = imresize(mergePic, picSize);

%imshow(mergePic);

chunkSize = [shortX*a, longX*a];

end

