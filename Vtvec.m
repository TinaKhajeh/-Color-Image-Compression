function [p1,p2,p3]=Vtvec(plane1,plane2,plane3)
global blksize;
Vplane1=blkproc(plane1,[blksize blksize],@VertScan);
reshaped=reshape(Vplane1',blksize*blksize,[]);
pp1=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp1,1)
  p1{i,:}=remove_run0(pp1(i,:));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
Vplane2=blkproc(plane2,[blksize blksize],@VertScan);
reshaped=reshape(Vplane2',blksize*blksize,[]);
pp2=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp2,1)
  p2{i,:}=remove_run0(pp2(i,:));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vplane3=blkproc(plane3,[blksize blksize],@VertScan);
reshaped=reshape(Vplane3',blksize*blksize,[]);
pp3=reshaped';
%%%remove last run of zero%%%%%%%%
for i=1:size(pp3,1)
  p3{i,:}=remove_run0(pp3(i,:));
end
end


%%
function vec=VertScan(blk)
[row col]=size(blk);

% Initialise the output vector
vec=zeros(1,row*col);



% First element
%vec(1)=blk(1,1);
cnt=1;
for j=1:col
    for i=1:row
        vec(cnt)=blk(i,j);
        cnt=cnt+1;
    end
end
  
        



end




