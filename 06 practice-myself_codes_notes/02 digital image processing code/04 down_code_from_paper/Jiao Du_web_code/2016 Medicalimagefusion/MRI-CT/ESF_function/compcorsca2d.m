function [w1r,w2r,w1c,w2c,corr,corc]=compcorsca2d(wr,wc,m)

%%%%%compute the correlation of w on the last two scales%%%%%%%%%

%wr,wc----the wavelet coefficient
%m--------the bound extend parameter

[sca,numr,numc]=size(wr);%%%in fact numr=numc
n=numr-2*m;

for i=1:sca
   taor(i)=2^(i-1)-1;
end
taoc=[0 taor];

i=sca-1;
   w1r=reshape(wr(i,:,:),numr,numc);
   w2r=reshape(wr(i+1,:,:),numr,numc);
   w1r=w1r(m+1+taoc(i):m+n+taoc(i),m+1+taor(i):m+n+taor(i));
   w2r=w2r(m+1+taoc(sca):m+n+taoc(sca),m+1+taor(sca):m+n+taor(sca));
   corr=w1r.*w2r;
   
   w1c=reshape(wc(i,:,:),numr,numc);
   w2c=reshape(wc(i+1,:,:),numr,numc);
   w1c=w1c(m+1+taor(i):m+n+taor(i),m+1+taoc(i):m+n+taoc(i));
   w2c=w2c(m+1+taor(sca):m+n+taor(sca),m+1+taoc(sca):m+n+taoc(sca));
   corc=w1c.*w2c;

