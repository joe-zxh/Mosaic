function [matchSplit] = Transform(mergePicSplitAvg, cellSplit)
    
    dR = mergePicSplitAvg(1)-cellSplit{2}(1);
    dG = mergePicSplitAvg(2)-cellSplit{2}(2);
    dB = mergePicSplitAvg(3)-cellSplit{2}(3);
    
    % ¼õ    
    cellSplit{1}(:,:,1) = cellSplit{1}(:,:,1)+dR; 
    cellSplit{1}(:,:,2) = cellSplit{1}(:,:,2)+dG; 
    cellSplit{1}(:,:,3) = cellSplit{1}(:,:,3)+dB; 
    
    matchSplit = cellSplit{1}; 
end

