function img=addMean(mat)
global Rmean;
global Gmean;
global Bmean;
R=mat(:,:,1);
G=mat(:,:,2);
B=mat(:,:,3);
R=R+Rmean;
G=G+Gmean;
B=B+Bmean;
img(:,:,1)=R;
img(:,:,2)=G;
img(:,:,3)=B;
end