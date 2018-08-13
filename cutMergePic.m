function [ A ] = cutMergePic( mergePath , ratio)

A = imread(mergePath);

s1 = size(A);
s2 = size(A);

if (s1(1)<s1(2))
    
    if (s1(1)*ratio<s1(2))
        s1(2) = s1(1)*ratio;
    else
        s1(1) =  s1(2) / ratio;    
    end
        
else
    
    if (s1(2)*ratio<s1(1))
        s1(1) = s1(2)*ratio;
    else
        s1(2) =  s1(1) / ratio;  
    end       
end

%开始裁剪

if (s1(1)<s2(1)) % x方向裁剪
    beg = round((s2(1)-s1(1))/2);
    ed = round(s2(1)-beg);
    A = A(beg:ed,:,:);
end
    
if (s1(2)<s2(2)) % y方向裁剪
    beg = round((s2(2)-s1(2))/2);
    ed = round(s2(2)-beg);
    A = A(:,beg:ed,:);
end

end

