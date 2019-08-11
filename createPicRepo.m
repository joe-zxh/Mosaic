function [ picRepo ] = createPicRepo( picsCell )
%生成15*15*15的cell，里面包含对图片的索引值
%   输入：picsCell

picRepo=cell(15,15,15);

len = size(picsCell, 2);

for i=1:len
    ind = ceil(picsCell{1,i}{1,2}/17);
    ind = max(1,ind);
    picRepo{ind(1), ind(2), ind(3)} = [ picRepo{ind(1), ind(2), ind(3)} i];    
end

for i=1:15
    for j=1:15
        for k=1:15  
            if size(picRepo{i,j,k},2)==0
                picRepo{i,j,k}=findNeighbor(i,j,k,picRepo);
            end       
        end
    end       
end

end

