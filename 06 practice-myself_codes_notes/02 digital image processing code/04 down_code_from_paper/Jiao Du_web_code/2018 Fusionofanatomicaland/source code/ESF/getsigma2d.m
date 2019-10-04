function [sigma_z1,sigma_z2]=getsigma2d(sca)

%%%%compute the cov of z1 and z2 at scale i=1,2,...,sca%%%%%%

%sca----------the scale number
%sigma_z1-----a vector of length sca, consists of the cov of z1 at scale i=1,2,...,sca
%sigma_z2-----a vector of length sca, consists of the cov of z2 at scale i=1,2,...,sca


[fr,fc]=getf2d(sca+1);
nf=normf2d(sca+1);

for i=1:sca
   taor(i)=2^(i-1);
end

taoc=[0 taor];

for i=1:sca
   fr1=reshape(fr(i,:,:),256,256);
   fr2=reshape(fr(i+1,:,:),256,256);
   tfr2=zeros(256,256);
   tfr2(1:256-taoc(i),1:256-taor(i))=fr2(1+taoc(i):256,1+taor(i):256);
   z1=fr1/nf(i)+tfr2/nf(i+1);
   z2=fr1/nf(i)-tfr2/nf(i+1);

   sigma_z1(i)=sum(sum(z1.^2))/4;
   sigma_z2(i)=sum(sum(z2.^2))/4;
end
