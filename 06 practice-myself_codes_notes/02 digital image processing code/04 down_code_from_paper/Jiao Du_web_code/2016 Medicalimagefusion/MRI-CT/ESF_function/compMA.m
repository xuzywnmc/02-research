function [Mod,Ang]=compMA(w1r,w1c,corr,corc,t,v,con)

%corr----the correlation in row after thresholding
%corc----the correlation in col after thresholding

Mod=sqrt(corr+corc);
mask=(Mod>0.8*sqrt(v^2*t*con*2));
Mod=Mod.*mask;

signr=sign(w1r)+0.00001;
%signr(:,1)=signr(:,1)+0.00001;

signc=sign(w1c);
c=sqrt(corc).*signc;
r=sqrt(corr+0.00001).*signr;
Ang=c./r;

return;
