function [w1,w2,cor]=compcorsca(w,m)

%%%%%compute the correlation of w on the last two scale%%%%%%%%%

%w----the wavelet coefficient
%m----bound extend parameter

[sca,len]=size(w);
n=len-2*m;

tao1=2^(sca-2)-1;
tao2=2^(sca-1)-1;
w1=w(sca-1,m+1+tao1:m+n+tao1);
w2=w(sca,m+1+tao2:m+n+tao2);
cor=w1.*w2;

return