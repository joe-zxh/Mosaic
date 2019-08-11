function [ matchcell ] = findNeighbor( i,j,k, picRepo )
%���ϵ�ǰcell��rgbֵ��û��ͼƬ��Ҫ�Ӹ����ҵ�һ��cell�������ǰcell
%   ���ص�һ���ҵ��Ĳ��ǿյ�cell

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

