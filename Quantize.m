function Qmat=Quantize(mat)
global bit;
plane1=mat(:,:,1);
plane2=mat(:,:,2);
plane3=mat(:,:,3);
global MaxNZ;
global MinNZ;
MaxNZ1=max(max(plane1));
MaxNZ2=max(max(plane2));
MaxNZ3=max(max(plane3));
MaxNZ=max([MaxNZ1,MaxNZ2,MaxNZ3]);
tmpMat1=plane1;
tmpMat1(tmpMat1==0)=Inf;
MinNZ1=min(min(tmpMat1));
tmpMat2=plane2;
tmpMat2(tmpMat2==0)=Inf;
MinNZ2=min(min(tmpMat2));
tmpMat3=plane3;
tmpMat3(tmpMat3==0)=Inf;
MinNZ3=min(min(tmpMat3));
MinNZ=min([MinNZ1,MinNZ2,MinNZ3]);



for i=1:size(plane1,1)
    for j=1:size(plane1,2)
        if(plane1(i,j)~=0)
            Qp1(i,j)=round(((plane1(i,j)-MinNZ)/(MaxNZ-MinNZ))*(2^bit-2)+1);
        else
            Qp1(i,j)=0;
        end
    end
end
for i=1:size(plane2,1)
    for j=1:size(plane2,2)
        if(plane2(i,j)~=0)
            Qp2(i,j)=round(((plane2(i,j)-MinNZ)/(MaxNZ-MinNZ))*(2^bit-2)+1);
        else
            Qp2(i,j)=0;
        end
    end
end
for i=1:size(plane3,1)
    for j=1:size(plane3,2)
        if(plane3(i,j)~=0)
            Qp3(i,j)=round(((plane3(i,j)-MinNZ)/(MaxNZ-MinNZ))*(2^bit-2)+1);
        else
            Qp3(i,j)=0;
        end
    end
end
Qmat(:,:,1)=Qp1;
Qmat(:,:,2)=Qp2;
Qmat(:,:,3)=Qp3;

end
