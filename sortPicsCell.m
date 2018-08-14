function [ picsCell ] = sortPicsCell( picsCell )

% 就用最简单的冒泡排序，可能这个排序算法要换成高级一点的排序算法
% 把最大的元素放到最后

n = size(picsCell,2);

for j=1:n-1    
    for i=1:n-j
        
        if (isBigger(picsCell{1, i}, picsCell{1, i+1}))
            cellTemp = picsCell{1, i};
            picsCell{1, i} = picsCell{1, i+1};
            picsCell{1, i+1} = cellTemp;                       
        end        
    end   
end


