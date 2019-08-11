%�Դ�ͼ��ĳ��chunk��Ѱ��һ��RGB���ʺϵ�Сͼ������һЩ�޸ģ������ǵ�RGBƽ��ֵ��ȡ�

function [ matchSplit, picsCellTemp ] = findMatchSplit(mergePicSplit, picsCellTemp, picsCell)

R = mergePicSplit(:,:,1);
G = mergePicSplit(:,:,2);
B = mergePicSplit(:,:,3);

mergePicSplitAvg = [mean(R(:)), mean(G(:)), mean(B(:))];

if (size(picsCellTemp,2)>0) % ����ͼƬ û����    
    
    distMin = 1000;
    matchSplit = {};
    
    i = 1;    
    for i = 1:size(picsCellTemp, 2)
        distTemp = Distance(mergePicSplitAvg, picsCellTemp{1, i});
        if (distTemp<10)            
            matchSplit = picsCellTemp{1, i};
            break
        elseif(distTemp<distMin)
            distMin = distTemp;
            matchSplit = picsCellTemp{1, i};                       
        end      
    end
    
    picsCellTemp(i) = []; %ɾ���Ѿ�ʹ�õ�Ԫ��
    
    matchSplit = Transform(mergePicSplitAvg, matchSplit);
    return  


else % ͼƬ�Ѿ�������
    
    distMin = 1000;
    matchSplit = {};
    
    for i = 1:size(picsCell, 2)
        distTemp = Distance(mergePicSplitAvg, picsCell{1, i});
        if (distTemp<10)            
            matchSplit = picsCell{1, i};  
            break;
        elseif(distTemp<distMin)
            distMin = distTemp;
            matchSplit = picsCell{1, i};                       
        end      
    end
    
    matchSplit = Transform(mergePicSplitAvg, matchSplit);
    return
end

end


function [dist] = Distance(mergePicSplitAvg, cellSplit)
    dist = abs(mergePicSplitAvg(1)-cellSplit{2}(1))+abs(mergePicSplitAvg(2)-cellSplit{2}(2))+abs(mergePicSplitAvg(3)-cellSplit{2}(3));     
end




