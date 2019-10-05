function RGB=YBR2RGB(mat)
y=mat(:,:,1);
cb=mat(:,:,2);
cr=mat(:,:,3);



for i=1:size(y,1)
    for j=1:size(y,2);
        R(i,j)=1*y(i,j)+(1.402)*cr(i,j);
        G(i,j)=1*y(i,j)+(-0.34413)*cb(i,j)+(-0.71414)*cr(i,j);
        B(i,j)=1*y(i,j)+(1.772)*cb(i,j)+(0)*cr(i,j);
    end
end

 RGB(:,:,1) = R;
 RGB(:,:,2) = G;
 RGB(:,:,3) = B;

end