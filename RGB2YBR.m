function ycbcrImage=RGB2YBR(rgbImage)

R=double(rgbImage(:,:,1));
G=double(rgbImage(:,:,2));
B=double(rgbImage(:,:,3));

y=zeros(size(R,1),size(R,2));
cb=zeros(size(R,1),size(R,2));
cr=zeros(size(R,1),size(R,2));
for i=1:size(R,1)
    for j=1:size(R,2);
        y(i,j)=0.299*R(i,j)+0.587*G(i,j)+0.114*B(i,j);
        cb(i,j)=(-0.16875)*R(i,j)+(-0.33126)*G(i,j)+0.5*B(i,j);
        cr(i,j)=0.5*R(i,j)+(-0.4186)*G(i,j)+(-0.08131)*B(i,j);
    end
end

%  ycbcrImage(:,:,1) = round(y);
%  ycbcrImage(:,:,2) = round(cb);
%  ycbcrImage(:,:,3) = round(cr);
ycbcrImage(:,:,1) = y;
 ycbcrImage(:,:,2) = cb;
 ycbcrImage(:,:,3) = cr;


end