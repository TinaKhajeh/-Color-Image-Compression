function [FinalVecP1,FinalVecP2,FinalVecP3]=change2vect(QdctImg)
global blksize;

global bit;
%bit=7;

plane1=QdctImg(:,:,1);
plane2=QdctImg(:,:,2);
plane3=QdctImg(:,:,3);
[m,n]=size(plane1);
[P1Zvec,P2Zvec,P3Zvec]=Zvec(plane1,plane2,plane3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[P1Hzvec,P2Hzvec,P3Hzvec]=Hzvec(plane1,plane2,plane3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[P1Vtvec,P2Vtvec,P3Vtvec]=Vtvec(plane1,plane2,plane3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[P1Hlvec,P2Hlvec,P3Hlvec]=Hlvec(plane1,plane2,plane3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% finding best scaning plane1%%I
for i=1:size(P1Zvec,1)
     
    a=[size(P1Zvec{i,:},2),size(P1Hzvec{i,:},2),size(P1Vtvec{i,:},2),size(P1Hlvec{i,:},2)];
    %%%%age a adade sefr dashte bashe ye 8bit sefr be un vector midim
    if(min(a)==0)
    FinalVecP1{i,:}=TR_Encoder(P1Zvec{i,:},'zigzag');
    else
    index=find(a==min(a));
    index=index(1,1);
    if(index==1)
        FinalVecP1{i,:}=TR_Encoder(P1Zvec{i,:},'zigzag');
    end
    %%%%
    if(index==2)
        FinalVecP1{i,:}=TR_Encoder(P1Hzvec{i,:},'horizontal');
    end
     %%%%
    if(index==3)
        FinalVecP1{i,:}=TR_Encoder(P1Vtvec{i,:},'vertical');
    end
     %%%%
    if(index==4)
        FinalVecP1{i,:}=TR_Encoder(P1Hlvec{i,:},'hilbert');
    end
    end
end

  %% finding best scaning plane2%%
for i=1:size(P2Zvec,1)
   
    a=[size(P2Zvec{i,:},2),size(P2Hzvec{i,:},2),size(P2Vtvec{i,:},2),size(P2Hlvec{i,:},2)];
    if(min(a)==0)
    FinalVecP2{i,:}=TR_Encoder(P2Zvec{i,:},'zigzag');
    else
    index=find(a==min(a));
        index=index(1,1);
    if(index==1)
        FinalVecP2{i,:}=TR_Encoder(P2Zvec{i,:},'zigzag');
    end
    %%%%
    if(index==2)
        FinalVecP2{i,:}=TR_Encoder(P2Hzvec{i,:},'horizontal');
    end
     %%%%
    if(index==3)
        FinalVecP2{i,:}=TR_Encoder(P2Vtvec{i,:},'vertical');
    end
     %%%%
    if(index==4)
        FinalVecP2{i,:}=TR_Encoder(P2Hlvec{i,:},'hilbert');
    end
    end
end  
  %% finding best scaning plane3%%
for i=1:size(P3Zvec,1)
    
    a=[size(P3Zvec{i,:},2),size(P3Hzvec{i,:},2),size(P3Vtvec{i,:},2),size(P3Hlvec{i,:},2)];
    if(min(a)==0)
    FinalVecP3{i,:}=TR_Encoder(P3Zvec{i,:},'zigzag');
    else
    index=find(a==min(a));
        index=index(1,1);
    if(index==1)
        FinalVecP3{i,:}=TR_Encoder(P3Zvec{i,:},'zigzag');
    end
    %%%%
    if(index==2)
        FinalVecP3{i,:}=TR_Encoder(P3Hzvec{i,:},'horizontal');
    end
     %%%%
    if(index==3)
        FinalVecP3{i,:}=TR_Encoder(P3Vtvec{i,:},'vertical');
    end
     %%%%
    if(index==4)
        FinalVecP3{i,:}=TR_Encoder(P3Hlvec{i,:},'hilbert');
    end
    end
end 










end%function