function blk=makeBlk(vec)
global bit;
global blksize;
p=log2(blksize*blksize);
A=vec(1,1);
if(A=='0')
    blk=zeros(blksize,blksize);
    
else
vec=vec(2:end);
AS=vec(1:2);
vec=vec(3:end);
PLNZ=vec(1:p);
PLNZ=bin2dec(PLNZ);
vec=vec(p+1:end);
ind=1;
for i=1:bit+1:size(vec,2)
   
    div{ind,1}=vec(i:i+bit);
    ind=ind+1;
end
index=1;
for i=1:size(div,1)
    strg=div{i,1};
    if(strg(1,1)=='1')
        strg=strg(2:end);
        numV(index,1)=bin2dec(strg);
        index=index+1;
    else
        tmp=bin2dec(strg);
        numV(index:index+tmp-1,1)=0;
        index=index+tmp;
        
    end
        
end
if(PLNZ+2<= blksize^2)
numV(PLNZ+2:blksize^2,1)=0;
end
%%%%%%%%%%%%%%%%
if(strcmp(AS,'00'))
blk=iZvec(numV);
end
%%%%%%%%%%%%%%%%
if(strcmp(AS,'01'))
    blk=iHzvec(numV);
end
%%%%%%%%%%%%%%%%%%%
if(strcmp(AS,'10'))
    blk=iVtvec(numV);
end
%%%%%%%%%%%%%%%
if(strcmp(AS,'11'))
    blk=iHlvec(numV);
end



end
end

%%
function blk = iHlvec(vec)
vec=vec';
global blksize;
if(blksize==8)
    

blk=[	vec(1,1)  vec(1,2)  vec(1,15) vec(1,16) vec(1,17)  vec(1,20)  vec(1,21)  vec(1,22)   
        vec(1,4)  vec(1,3)  vec(1,14) vec(1,13) vec(1,18)  vec(1,19)  vec(1,24)  vec(1,23)  
        vec(1,5)  vec(1,8)  vec(1,9)  vec(1,12) vec(1,31)  vec(1,30)  vec(1,25)  vec(1,26)   
        vec(1,6)  vec(1,7)  vec(1,10) vec(1,11) vec(1,32)  vec(1,29)  vec(1,28)  vec(1,27)  
        vec(1,59) vec(1,58) vec(1,55) vec(1,54) vec(1,33)  vec(1,36)  vec(1,37)  vec(1,38)  
        vec(1,60) vec(1,57) vec(1,56) vec(1,53) vec(1,34)  vec(1,35)  vec(1,40)  vec(1,39)  
        vec(1,61) vec(1,62) vec(1,51) vec(1,52) vec(1,47)  vec(1,46)  vec(1,41)  vec(1,42)  
        vec(1,64) vec(1,63) vec(1,50) vec(1,49) vec(1,48)  vec(1,45)  vec(1,44)  vec(1,43) ];
end
if(blksize==16)
    
blk=[vec(1,1) vec(1,2) vec(1,15) vec(1,16) vec(1,17) vec(1,20) vec(1,21) vec(1,22)  vec(1,235) vec(1,236) vec(1,237) vec(1,240) vec(1,241) vec(1,242) vec(1,255) vec(1,256) 
vec(1,4) vec(1,3) vec(1,14) vec(1,13) vec(1,18) vec(1,19) vec(1,24) vec(1,23) vec(1,234) vec(1,233) vec(1,238) vec(1,239) vec(1,244) vec(1,243) vec(1,254) vec(1,253)
vec(1,5) vec(1,8) vec(1,9)  vec(1,12) vec(1,31) vec(1,30) vec(1,25) vec(1,26) vec(1,231) vec(1,232) vec(1,227) vec(1,226) vec(1,245) vec(1,248) vec(1,249) vec(1,252)
vec(1,6) vec(1,7) vec(1,10) vec(1,11) vec(1,32) vec(1,29) vec(1,28)  vec(1,27) vec(1,230) vec(1,229) vec(1,228) vec(1,225) vec(1,246) vec(1,247) vec(1,250) vec(1,251)
vec(1,59) vec(1,58) vec(1,55) vec(1,54) vec(1,33)  vec(1,36) vec(1,37)  vec(1,38) vec(1,219) vec(1,220) vec(1,221) vec(1,224) vec(1,203) vec(1,202) vec(1,199) vec(1,198)
vec(1,60) vec(1,57) vec(1,56) vec(1,53) vec(1,34)  vec(1,35) vec(1,40)  vec(1,39) vec(1,218) vec(1,217) vec(1,222) vec(1,223) vec(1,204) vec(1,201) vec(1,200) vec(1,197) 
vec(1,61) vec(1,62) vec(1,51) vec(1,52) vec(1,47) vec(1,46)  vec(1,41)  vec(1,42) vec(1,215) vec(1,216) vec(1,211) vec(1,210) vec(1,205) vec(1,206) vec(1,195) vec(1,196)
vec(1,64) vec(1,63) vec(1,50) vec(1,49) vec(1,48) vec(1,45)  vec(1,44)  vec(1,43) vec(1,214) vec(1,213) vec(1,212) vec(1,209) vec(1,208) vec(1,207) vec(1,194) vec(1,193) 
vec(1,65) vec(1,68) vec(1,69) vec(1,70) vec(1,123) vec(1,124) vec(1,125) vec(1,128) vec(1,129) vec(1,132) vec(1,133) vec(1,134) vec(1,187) vec(1,188) vec(1,189) vec(1,192)
vec(1,66) vec(1,67) vec(1,72) vec(1,71) vec(1,122) vec(1,121) vec(1,126) vec(1,127) vec(1,130) vec(1,131) vec(1,136) vec(1,135) vec(1,186) vec(1,185) vec(1,190) vec(1,191)
vec(1,79) vec(1,78) vec(1,73) vec(1,74) vec(1,119) vec(1,120) vec(1,115) vec(1,114) vec(1,143) vec(1,142) vec(1,137) vec(1,138) vec(1,183) vec(1,184) vec(1,179) vec(1,178)
vec(1,80) vec(1,77) vec(1,76) vec(1,75) vec(1,118) vec(1,117) vec(1,116) vec(1,113) vec(1,144) vec(1,141) vec(1,140) vec(1,139) vec(1,182) vec(1,181) vec(1,180) vec(1,177)
vec(1,81) vec(1,82) vec(1,95) vec(1,96) vec(1,97)  vec(1,98) vec(1,111) vec(1,112) vec(1,145) vec(1,146) vec(1,159) vec(1,160) vec(1,161) vec(1,162) vec(1,175) vec(1,176)
vec(1,84) vec(1,83) vec(1,94) vec(1,93) vec(1,100) vec(1,99)  vec(1,110) vec(1,109) vec(1,148) vec(1,147) vec(1,158) vec(1,157) vec(1,164) vec(1,163) vec(1,174) vec(1,173) 
vec(1,85) vec(1,88) vec(1,89) vec(1,92) vec(1,101) vec(1,104) vec(1,105) vec(1,108) vec(1,149) vec(1,152) vec(1,153) vec(1,156) vec(1,165) vec(1,168) vec(1,169) vec(1,172)
vec(1,86) vec(1,87) vec(1,90) vec(1,91) vec(1,102) vec(1,103) vec(1,106) vec(1,107) vec(1,150) vec(1,151) vec(1,154) vec(1,155) vec(1,166) vec(1,167) vec(1,170) vec(1,171)
 ];
end

end
%%
function blk = iZvec(vec)


    index = ZZindex(sqrt(length(vec))); 

blk=[];
for k=1:length(vec)
    blk( index(k,1),index(k,2) )=vec(k);
end
end
%%
function blk = iHzvec(vec)
global blksize;
blk=vec2mat(vec,blksize);

 
end
%%
function blk = iVtvec(vec)
global blksize;
blk=reshape(vec,[blksize blksize]);

end





%end
