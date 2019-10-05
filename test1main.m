function [PSNR,CR]=test1main(th,nbit,blk,img)
global thresh;
thresh=th;
global bit;
bit=nbit;
global blksize;
blksize=blk;
rgbImg=img;
rgbImgMless=removeMean(rgbImg);
ycbcrImg=RGB2YBR(rgbImgMless);
dctImg=dctBlockFun(ycbcrImg);
QdctImg=Quantize(dctImg);
[P1Zvec,P2Zvec,P3Zvec]=Zvec(QdctImg(:,:,1),QdctImg(:,:,2),QdctImg(:,:,3));
for i=1:size(P1Zvec,1)
   
FinalVecP1{i,:}=TR_Encoder(P1Zvec{i,:},'zigzag');
FinalVecP2{i,:}=TR_Encoder(P1Zvec{i,:},'zigzag');
FinalVecP3{i,:}=TR_Encoder(P1Zvec{i,:},'zigzag');
end
reconstructedImg=decoder(FinalVecP1,FinalVecP2,FinalVecP3);
dqRImg=dequantize(reconstructedImg);
idctImg=idctBlockFun(dqRImg);
reconsImgRGBMless=YBR2RGB(idctImg);
reconsImgRGB=addMean(reconsImgRGBMless);
reconsImgRGB=uint8(reconsImgRGB);

PSNR=psnr(rgbImg,reconsImgRGB);
disp(PSNR);

CR=comp_ratio(rgbImg,FinalVecP1,FinalVecP2,FinalVecP3);
end