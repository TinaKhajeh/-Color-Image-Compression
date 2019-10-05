function CR=comp_ratio(img,p1,p2,p3)
total=3*8*size(img,1)*size(img,2);
cnt1=0;
for i=1:size(p1,1)
    cnt1=cnt1+size(p1{i,:},2);
end

cnt2=0;
for i=1:size(p2,1)
    cnt2=cnt2+size(p2{i,:},2);
end

cnt3=0;
for i=1:size(p3,1)
    cnt3=cnt3+size(p3{i,:},2);
end
after=cnt1+cnt2+cnt3;
CR=total/double(after);
disp(CR);
end
