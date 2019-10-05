function dQmat=dequantize(mat)
global bit;
global MaxNZ;
global MinNZ;
plane1=mat(:,:,1);
plane2=mat(:,:,2);
plane3=mat(:,:,3);
for i=1:size(plane1,1)
    for j=1:size(plane1,2)
        if(plane1(i,j)~=0)
            dQp1(i,j)=(((plane1(i,j)-1)*(MaxNZ-MinNZ))/(2^bit-2))+MinNZ;
        else
            dQp1(i,j)=0;
        end
    end
end
for i=1:size(plane2,1)
    for j=1:size(plane2,2)
        if(plane2(i,j)~=0)
            dQp2(i,j)=(((plane2(i,j)-1)*(MaxNZ-MinNZ))/(2^bit-2))+MinNZ;
        else
            dQp2(i,j)=0;
        end
    end
end
for i=1:size(plane3,1)
    for j=1:size(plane3,2)
        if(plane3(i,j)~=0)
            dQp3(i,j)=(((plane3(i,j)-1)*(MaxNZ-MinNZ))/(2^bit-2))+MinNZ;
        else
            dQp3(i,j)=0;
        end
    end
end
dQmat(:,:,1)=round(dQp1);
dQmat(:,:,2)=round(dQp2);
dQmat(:,:,3)=round(dQp3);
