%对大图的某个chunk，寻找一个RGB最适合的小图，并做一些修改，让他们的RGB平均值相等。

function [ matchSplit, picsCellTemp ] = findMatchSplit(mergePicSplit, picsCellTemp, picsCell)

R = mergePicSplit(:,:,1);
G = mergePicSplit(:,:,2);
B = mergePicSplit(:,:,3);

mergePicSplitAvg = [mean(R(:)), mean(G(:)), mean(B(:))];

if (size(picsCellTemp,2)>0) % 还有图片 没用完    
    
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
    
    picsCellTemp(i) = []; %删掉已经使用的元素
    
    matchSplit = Transform(mergePicSplitAvg, matchSplit);
    return  


else % 图片已经用完了
    
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




