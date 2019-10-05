
function idctImg=idctBlockFun(img)
global blksize;
global thresh;
p1=img(:,:,1);
p2=img(:,:,2);
p3=img(:,:,3);
idct=@idct2;
pp1=round(blkproc(p1,[blksize blksize],idct));
pp2=round(blkproc(p2,[blksize blksize],idct));
pp3=round(blkproc(p3,[blksize blksize],idct));

idctImg(:,:,1)=pp1;
idctImg(:,:,2)=pp2;
idctImg(:,:,3)=pp3;
end