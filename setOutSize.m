% 设置小图的大小，不能太小。

function [outSize] = setOutSize(chunkSize, longEdgeMin, shortEdgeMin)

if (chunkSize(1)>=shortEdgeMin && chunkSize(2)>=longEdgeMin)
    outSize = chunkSize;
    return 
end

i = 1;
st = i*chunkSize(1);
lt = i*chunkSize(2);

while (st<shortEdgeMin || lt < longEdgeMin)
    i = i+1;
    st = i*chunkSize(1);
    lt = i*chunkSize(2);
end

outSize = [st, lt];
