function [n1,n2,n,f1,f2,f]=compFR(e1,e2,e)

%%%%%%%%%%%%%%%
[I1x,I1y]=find(e1);
n1=length(I1x);
T=5;

f1=0;
for i=1:n1
   d=abs(I1y(i)-129);
   if d<=T
      f1=f1+1/(1+d^2/9);
   end
end
f1=f1/max(252,n1);
%%%%%%%%%%%%%%%%%%
[I2x,I2y]=find(e2);
n2=length(I2x);

f2=0;
for i=1:n2
   d=abs(I2y(i)-129);
  if d<=T
      f2=f2+1/(1+d^2/9);
  end
end
f2=f2/max(252,n2);
%%%%%%%%%%%%%%%%%%%%%%
[Ix,Iy]=find(e);
n=length(Ix);

f=0;
for i=1:n
   d=abs(Iy(i)-129);
   if d<=T
      f=f+1/(1+d^2/9);
  end
end
f=f/max(252,n);

return



