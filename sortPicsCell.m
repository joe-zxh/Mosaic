function [ picsCell ] = sortPicsCell( picsCell )

% ������򵥵�ð�����򣬿�����������㷨Ҫ���ɸ߼�һ��������㷨
% ������Ԫ�طŵ����

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


