function finalString=TR_Encoder(vec,type)
global blksize;
if(isempty(vec))
    A='0';
    finalString='0';

else
    A='1';

global bit;
%bit=7;
i=1;
ind=1;
flag=0;
while(i~=size(vec,2)+1)
    
    if(vec(1,i)~=0)
       
        string=dec2bin(vec(1,i));
        if(size(string,2)<bit)
            sz=size(string,2);
            while(sz~=bit)
                string=strcat('0',string);
                sz=sz+1;
            end
        end
        Cstring=strcat('1',string);
        %num=bin2dec(Cstring);
        TRE{1,ind}=Cstring;
        ind=ind+1;
        i=i+1;
         flag=1;
    else
        
        if(i==size(vec,2) && flag==1)
            str='0';
            %%%checking%%
            for ss=1:bit
                str=strcat(str,'0');
            end
                
            TRE{1,ind}=str;
            break;
        else
        j=i+1;
        end
        cnt=1;
        while(vec(1,j)==0)
            cnt=cnt+1;
            j=j+1;
            if(j==size(vec,2)+1)
                break;
            end
        end
         while(cnt> 2^bit-1)
                TRE{1,ind}='01111111';
                ind=ind+1;
                cnt=cnt-(2^bit-1);
             
         end
        cntString=dec2bin(cnt);
        if(size(cntString,2)<bit+1)
            sz=size(cntString,2);
            while(sz~=bit+1)
                cntString=strcat('0',cntString);
                sz=sz+1;
            end
        end
        
        TRE{1,ind}=cntString;
        ind=ind+1;
        i=j;
        flag=0;
    end
end

if(strcmp(type,'zigzag'))
    AS='00';
end
if(strcmp(type,'horizontal'))
    AS='01';
end
if(strcmp(type,'vertical'))
    AS='10';
end
if(strcmp(type,'hilbert'))
    AS='11';
end
PLNZ=size(vec,2)-1;
p=log2(blksize*blksize);
PLNZstr=dec2bin(PLNZ);

        if(size(PLNZstr,2)<p)
            sz=size(PLNZstr,2);
            while(sz~=p)
                PLNZstr=strcat('0',PLNZstr);
                sz=sz+1;
            end
        end



finalString=strcat(A,AS);
finalString=strcat(finalString,PLNZstr);
for m=1:size(TRE,2)
finalString=strcat(finalString,TRE{1,m});
end
end
end


            

