function [ matchcell ] = findNeighbor( i,j,k, picRepo )
%符合当前cell的rgb值，没有图片，要从附近找到一个cell来替代当前cell
%   返回第一个找到的不是空的cell

radius = 1;
s = size(picRepo,3);
while true
    iileft = max(i-radius, 1);
    iiright = min(i+radius, s);
    
    jjleft = max(j-radius, 1);
    jjright = min(j+radius, s);
    
    kkleft = max(k-radius, 1);
    kkright = min(k+radius, s);
        
    for ii=iileft:iiright
        for jj=jjleft:jjright
            for kk=kkleft:kkright
                if size(picRepo{ii,jj,kk},2)~=0
                    matchcell=picRepo{ii,jj,kk};
                    return;
                end                         
            end        
        end  
    end
    radius = radius+1;
end

end

