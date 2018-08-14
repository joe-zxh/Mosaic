function [ ret ] = isBigger( picACell, picBCell )

rA = picACell{2}(1);
gA = picACell{2}(2);
bA = picACell{2}(3);

rB = picBCell{2}(1);
gB = picBCell{2}(2);
bB = picBCell{2}(3);

if (rA>rB)
    ret = true;
        
elseif(rA < rB)
    ret = false;
    
else %rA==rB
    if (gA>gB)
        ret = true;
    elseif (gA<gB)
        ret = false;
    else %gA==gB
        
        if (bA>bB)
            ret = true;
        elseif(bA<bB)
            ret = false;
        else %bA=bB
            ret = true;
        end
        
    end
        
end

