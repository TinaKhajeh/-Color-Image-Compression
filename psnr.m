function  [psnr,mse] = psnr(A, B)
% Peak Signal-to-Noise Ratio
%
if(size(A,3)==3)
a1=A(:,:,1);
a2=A(:,:,2);
a3=A(:,:,3);
b1=B(:,:,1);
b2=B(:,:,2);
b3=B(:,:,3);
diff1 = a1 - b1;
diff2 = a2 - b2;
diff3 = a3 - b3;
diff_sq1 = diff1 .^ 2;
diff_sq2 = diff2 .^ 2;
diff_sq3 = diff3 .^ 2;
mse1 = mean(mean(diff_sq1));
mse2 = mean(mean(diff_sq2));
mse3 = mean(mean(diff_sq3));% means squared error
if (mse1 == 0 || mse2==0 || mse3==0)
    psnr=Inf;
    if(mse1 == 0 && mse2==0 && mse3==0)
        disp('NO LOSS');
    end
else
    psnr = 10*log10((255^2)*3/(mse1+mse2+mse3));          % PSNR
end
else
    diff = A - B;
diff_sq = diff .^ 2;
mse = mean(mean(diff_sq));
if (mse == 0)
    psnr=Inf;
else
    psnr = 10*log10(255^2)/(mse);          % PSNR
end
end
end
    