function [sigma_z1,sigma_z2]=getsigmaz1(sca)

%%%%compute the cov of z1 and z2 at scale i=1,2,...,sca%%%%%%

%sca----------the scale number
%sigma_z1-----a vector of length sca, consists of the cov of z1 at scale i=1,2,...,sca
%sigma_z2-----a vector of length sca, consists of the cov of z2 at scale i=1,2,...,sca


f=getf(sca+1);
nf=normf(sca+1);

for i=1:sca
   tao=2^(i-1);
   tf2=zeros(1,256);
   tf2(1:256-tao)=f(i+1,1+tao:256);
   z1=f(i,:)/nf(i)+tf2/nf(i+1);
   z2=f(i,:)/nf(i)-tf2/nf(i+1);

   sigma_z1(i)=norm(z1)^2/4;
   sigma_z2(i)=norm(z2)^2/4;
end
