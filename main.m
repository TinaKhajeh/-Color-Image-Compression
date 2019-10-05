function [reconsImgRGB,PSNR,CR]=main(th,nbit,bs,pic)
% SahaR taheri / Tina khaje / Marzie Farhadi
%clear all;
global thresh;
thresh=th;
global bit;
bit=nbit;
global blksize;
blksize=bs;
%khandane tasviir RGB
rgbImg=pic;
%imshow(RGBImg);

%tabdil fazaye rang be YCbCr
ybrImg=RGB2YBR(rgbImg);
%figure,imshow(ybrImg);

%mohasebe energy dar 2 fazaye rang
Ecalc(rgbImg,ybrImg);
%%%%%%%%%%%%%%%%%%%%%%%

%kam kardan miangine R va G va B az tasvir
rgbImgMless=removeMean(rgbImg);

%tabdil tasvir RGB ke miangine an kam shode be YCbCr
ycbcrImg=RGB2YBR(rgbImgMless);

%DCT transform
dctImg=dctBlockFun(ycbcrImg);

%quantize DCT coeficient
QdctImg=Quantize(dctImg);

%tabdile block ha be vector(proposed method)
[VQdctP1,VQdctP2,VQdctP3]=change2vect(QdctImg);
disp('change2vector....');

%bazsazii block ha az vectorha
reconstructedImg=decoder(VQdctP1,VQdctP2,VQdctP3);

disp('change2image...');

%dequantize
dqRImg=dequantize(reconstructedImg);

%%% inverse dct transform
idctImg=idctBlockFun(dqRImg);

%tabdile fazaye rang be RGB va afzudane miangin haye kam shode be an
reconsImgRGBMless=YBR2RGB(idctImg);
reconsImgRGB=addMean(reconsImgRGBMless);
%imshow(uint8(reconsImgRGB),[]);
reconsImgRGB=uint8(reconsImgRGB);
%mohasebe PSNR tasvir aslii ba tasvir bad az compression
PSNR=psnr(rgbImg,reconsImgRGB);
disp(PSNR);
CR=comp_ratio(rgbImg,VQdctP1,VQdctP2,VQdctP3);
end