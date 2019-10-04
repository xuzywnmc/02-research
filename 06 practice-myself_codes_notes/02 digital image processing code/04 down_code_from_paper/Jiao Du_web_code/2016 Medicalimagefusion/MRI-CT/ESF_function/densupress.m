function edpoint=nmsupress2d(Mod,Ang)

%%do the non-maxium supression%%%%%%%%%
%%Mod--Modulus Matrix
%%Ang--edge direction

[n,m]=size(Mod);
edpoint=zeros(n,m);

for i=3:n-2
   for j=3:m-2
      if (Mod(i,j)>0)
      %%%%%%%%%%%%%%%%%%
      if (Ang(i,j)>=-0.4142)&(Ang(i,j)<=0.4142)%%%%in x direction%%%%
         if (Mod(i,j)>Mod(i,j-1))&(Mod(i,j)>Mod(i,j+1))
            edpoint(i,j)=1;
         end
      elseif abs(Ang(i,j))>=2.4142%%%%in y direction%%%%
         if (Mod(i,j)>Mod(i-1,j))&(Mod(i,j)>Mod(i+1,j))
            edpoint(i,j)=1;
         end
      elseif (Ang(i,j)>0.4142)&(Ang(i,j)<2.4142)%%%%in xy direction%%
         if (Mod(i,j)>Mod(i-1,j-1))&(Mod(i,j)>Mod(i+1,j+1))
            edpoint(i,j)=1;
            if (edpoint(i,j-1)==1)&(edpoint(i-1,j)==1)
               edpoint(i,j)=0;
            end
         end
      elseif (Ang(i,j)>-2.4142)&(Ang(i,j)<-0.4142)
         if (Mod(i,j)>Mod(i+1,j-1))&(Mod(i,j)>Mod(i-1,j+1))
               edpoint(i,j)=1;
            if (edpoint(i-1,j-1)==1)
               edpoint(i,j-1)=0;
            end
         end
      end
      %%%%%%%%%%%%%%%%%%
      end
   end
end

return