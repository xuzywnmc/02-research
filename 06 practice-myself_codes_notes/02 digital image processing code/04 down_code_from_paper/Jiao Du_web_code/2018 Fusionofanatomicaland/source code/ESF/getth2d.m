function tth=getth2d(sca)

%%%%compute ||F1||||F2||sigma_z1^2%%%%

%sca-----scale number
%tth-----the output, a vector of length sca, consists of the threshold at scale i=1,2,...,sca

nf=normf2d(sca+1);
[sigma_z1,sigma_z2]=getsigma2d(sca);

for i=1:sca
   tth(i)=(nf(i)*nf(i+1)*sigma_z1(i));
end

return;
