function nf=normf(sca);

%%%%compute ||H0*H1*...*Gm||%%%%%%%

%sca----scale number
%nf-----the output, a vector of length sca

th=1;

for i=0:sca-1
  tg=conv(th,getg(i));
  nf(i+1)=norm(tg);
  th=conv(th,geth(i)); 
end
