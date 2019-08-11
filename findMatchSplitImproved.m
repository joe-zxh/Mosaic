function [ matchSplit ] = findMatchSplitImproved(mergePicSplit, picsCell, picRepo )
%FINDMATCHSPLITIMPROVED 此处显示有关此函数的摘要
%   此处显示详细说明

    R = mergePicSplit(:,:,1);
    G = mergePicSplit(:,:,2);
    B = mergePicSplit(:,:,3);
    
    mergePicSplitAvg = [mean(R(:)), mean(G(:)), mean(B(:))];
    
    ind = ceil(mergePicSplitAvg/17);
    ind = max(1, ind);    
    
    repo = picRepo(ind(1),ind(2),ind(3));
    
    len = size(repo, 2);
    
    if len==1
        matchSplit=picsCell{1, repo{1}};
    elseif len>1 % 随便找一个就好
        index=ceil(len*rand());
        matchSplit=picsCell{index, repo{1}};
    else 
        disp('有bug：repo为空!!!');
    end
    
    matchSplit = Transform(mergePicSplitAvg, matchSplit);

end

function [matchSplit] = Transform(mergePicSplitAvg, cellSplit)
    
    dR = mergePicSplitAvg(1)-cellSplit{2}(1);
    dG = mergePicSplitAvg(2)-cellSplit{2}(2);
    dB = mergePicSplitAvg(3)-cellSplit{2}(3);
    
    % 减    
    cellSplit{1}(:,:,1) = cellSplit{1}(:,:,1)+dR; 
    cellSplit{1}(:,:,2) = cellSplit{1}(:,:,2)+dG; 
    cellSplit{1}(:,:,3) = cellSplit{1}(:,:,3)+dB; 
    
    matchSplit = cellSplit{1}; 
end