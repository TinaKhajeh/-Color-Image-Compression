function plane=makePlane(vecs)
global blksize;
Trow=(sqrt(size(vecs,1)*(blksize^2)))/blksize;
Tcol=Trow;
for i=1:size(vecs,1)
   
     block{i,:}=makeBlk(vecs{i,:});
end
index=1;
for row=1:Trow
    for col=1:Tcol
        matcell{row,col}=block{index,:};
        index=index+1;
    end
end
    
plane=cell2mat(matcell);


end