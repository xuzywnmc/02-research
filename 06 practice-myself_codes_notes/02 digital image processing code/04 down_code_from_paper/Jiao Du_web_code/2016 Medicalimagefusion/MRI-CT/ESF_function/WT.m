function [w,s,m]=wt(sig,J)

%%%forward dyadic wavelet transform%%%%%%

%sig------original signal
%J--------scale number   

%w--------wavelet coefficients
%s--------smoothed signal

n=length(sig);
if n>256
   m=256;
else
   m=n;
end


s=[sig(m:-1:1) sig sig(n:-1:n-m+1)];

j=0;
while j<J
	r=conv(s,getg(j));
	w(j+1,:)=r(128:128+n+2*m-1);
	s=conv(s,geth(j));
	s=s(128:128+n+2*m-1);
	j=j+1;
	clear r;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

