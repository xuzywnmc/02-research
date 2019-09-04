function C=reconstruct(A,imgcolor,level,roworcol,h) 

if imgcolor 
Ar=A(:,:,1); 
Ag=A(:,:,2); 
Ab=A(:,:,3); 
Cr=nstdhaarrec2(Ar,level,roworcol,h); 
Cg=nstdhaarrec2(Ag,level,roworcol,h); 
Cb=nstdhaarrec2(Ab,level,roworcol,h); 
C(:,:,1)=Cr; 
C(:,:,2)=Cg; 
C(:,:,3)=Cb; 
else 
C=nstdhaarrec2(A,level,roworcol,h); 
End

