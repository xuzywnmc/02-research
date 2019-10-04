function [corr,corc]=compcor2d(wr,wc)

%%%%%compute the correlation of w%%%%%%%%%

%wr,wc----the wavelet coefficient

[sca,n,nn]=size(wr);%%%in fact n=nn

corr=zeros(sca-1,n,nn);
corc=corr;

for i=1:sca
   taor(i)=2^(i-1);
end

  taoc=[0 taor];


for i=1:sca-1
   twr1=reshape(wr(i,:,:),n,n);
   ttwr2=reshape(wr(i+1,:,:),n,n);
   twr2=zeros(n,n);
   twr2(1:n-taoc(i),1:n-taor(i))=ttwr2(1+taoc(i):n,1+taor(i):n);
   corr(i,:,:)=twr1.*twr2;
   
   twc1=reshape(wc(i,:,:),n,n);
   ttwc2=reshape(wc(i+1,:,:),n,n);
   twc2=zeros(n,n);
   twc2(1:n-taor(i),1:n-taoc(i))=ttwc2(1+taor(i):n,1+taoc(i):n);
   corc(i,:,:)=twc1.*twc2;
end
