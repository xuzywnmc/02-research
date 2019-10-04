function C=decompose(A,imgcolor,level,roworcol,h) 

if imgcolor 
Ar=A(:,:,1); 
Ag=A(:,:,2); 
Ab=A(:,:,3); 
Cr=nstdhaardec2(Ar,level,roworcol,h); 
Cg=nstdhaardec2(Ag,level,roworcol,h); 
Cb=nstdhaardec2(Ab,level,roworcol,h); 
C(:,:,1)=Cr; 
C(:,:,2)=Cg; 
C(:,:,3)=Cb; 
else 
C=nstdhaardec2(A,level,roworcol,h); 
end 

