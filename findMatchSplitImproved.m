function [ matchSplit ] = findMatchSplitImproved(mergePicSplit, picsCell, picRepo )
%FINDMATCHSPLITIMPROVED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

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
    elseif len>1 % �����һ���ͺ�
        index=ceil(len*rand());
        matchSplit=picsCell{index, repo{1}};
    else 
        disp('��bug��repoΪ��!!!');
    end
    
    matchSplit = Transform(mergePicSplitAvg, matchSplit);

end