function b=remove_run0(a)
%a=[0 0 1 2 3 0 0 0 0 3 0 0 0 0 0 0 0 0 0];
 for i=size(a,2):-1:1
    if(a(1,i)==0)
        a=a(1:i-1);
        
    else
        break;
    end
 end
b=a;
end
