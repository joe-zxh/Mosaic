
picrepo=cell(15,15,15);

len = size(picsCell, 2);

for i=1:len
    ind = ceil(picsCell{1,i}{1,2}/17);
    picrepo{ind(1), ind(2), ind(3)} = [ picrepo{ind(1), ind(2), ind(3)} i];    
end

for i=1:15
    for j=1:15
        for k=1:15  
            if size(picrepo{i,j,k},2)==0
                picrepo{i,j,k}=findNeighbor(i,j,k,picrepo);
            end       
        end
    end       
end


