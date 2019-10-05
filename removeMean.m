function img=removeMean(image)
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);
global Rmean;
global Gmean;
global Bmean;
Rmean=mean(mean(R));
Gmean=mean(mean(G));
Bmean=mean(mean(B));
R=round(double(R)-Rmean);
G=round(double(G)-Gmean);
B=round(double(B)-Bmean);
img(:,:,1)=R;
img(:,:,2)=G;
img(:,:,3)=B;
end