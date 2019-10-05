function reconstructedImg=decoder(VQdctP1,VQdctP2,VQdctP3)

dctplane1=makePlane(VQdctP1);
dctplane2=makePlane(VQdctP2);
dctplane3=makePlane(VQdctP3);


 reconstructedImg(:,:,1) = dctplane1;
 reconstructedImg(:,:,2) = dctplane2;
 reconstructedImg(:,:,3) = dctplane3;

end