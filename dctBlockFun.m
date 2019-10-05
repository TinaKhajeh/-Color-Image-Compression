function dctImg=dctBlockFun(img)
global blksize;
global thresh;
Y=img(:,:,1);
Cb=img(:,:,2);
Cr=img(:,:,3);
dct=@dct2;
Ydct=round(blkproc(Y,[blksize blksize],dct));
Cbdct=round(blkproc(Cb,[blksize blksize],dct));
Crdct=round(blkproc(Cr,[blksize blksize],dct));
%thresh=3;
Ydct(abs(Ydct)<=thresh)=0;
Cbdct(abs(Cbdct)<=thresh)=0;
Crdct(abs(Crdct)<=thresh)=0;
dctImg(:,:,1)=Ydct;
dctImg(:,:,2)=Cbdct;
dctImg(:,:,3)=Crdct;
end