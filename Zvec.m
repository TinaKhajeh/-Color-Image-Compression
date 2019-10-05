function [p1,p2,p3]=Zvec(plane1,plane2,plane3)
global blksize;
Vplane1=blkproc(plane1,[blksize blksize],@ZigZagScan);
reshaped=reshape(Vplane1',blksize*blksize,[]);
pp1=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp1,1)
    
  p1{i,:}=remove_run0(pp1(i,:));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vplane2=blkproc(plane2,[blksize blksize],@ZigZagScan);
reshaped=reshape(Vplane2',blksize*blksize,[]);
pp2=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp2,1)
  p2{i,:}=remove_run0(pp2(i,:));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vplane3=blkproc(plane3,[blksize blksize],@ZigZagScan);
reshaped=reshape(Vplane3',blksize*blksize,[]);
pp3=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp3,1)
  p3{i,:}=remove_run0(pp3(i,:));
end
end


%%
function vec=ZigZagScan(blk)
global blksize;


    ind = ZZindex(blksize); 

vec = [];
for k=1:size(ind,1)
    vec = horzcat(vec, blk(ind(k,1),ind(k,2)) ) ;
end
end