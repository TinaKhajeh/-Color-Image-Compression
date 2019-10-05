function Ecalc(imgRGB,imgYBR)
R=double(imgRGB(:,:,1));
G=double(imgRGB(:,:,2));
B=double(imgRGB(:,:,3));
%%%%%%%%
Y=double(imgYBR(:,:,1));
Cb=double(imgYBR(:,:,2));
Cr=double(imgYBR(:,:,3));
%%%%%%%%%
TErgb=sum(sum(R.^2+G.^2+B.^2));
RSE=100*sum(sum(R.^2))/TErgb;
GSE=100*sum(sum(G.^2))/TErgb;
BSE=100*sum(sum(B.^2))/TErgb;
%%%%%%%%%
TEycbcr=sum(sum(Y.^2+Cb.^2+Cr.^2));
YSE=100*sum(sum(Y.^2))/TEycbcr;
CbSE=100*sum(sum(Cb.^2))/TEycbcr;
CrSE=100*sum(sum(Cr.^2))/TEycbcr;
%%%%%%%%%
disp('Energy distribution in RGB color space');
disp(sprintf('R component Energy= %f',RSE));
disp(sprintf('G component Energy= %f',GSE));
disp(sprintf('B component Energy= %f',BSE));
disp('Energy distribution in YCbCr color space');
disp(sprintf('Y component Energy= %f',YSE));
disp(sprintf('Cb component Energy= %f',CbSE));
disp(sprintf('Cr component Energy= %f',CrSE));

end