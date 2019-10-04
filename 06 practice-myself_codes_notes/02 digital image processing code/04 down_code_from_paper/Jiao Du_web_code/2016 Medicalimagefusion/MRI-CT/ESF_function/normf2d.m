function nf=normf2d(sca);

%%%%compute ||H0*H0'*H1*H1'...*Grm||%%%%%%%

%sca----scale number
%nf-----the output in row or column direction, a vector of length sca

th=1;

for i=0:sca-1
  tg=conv(th,getg(i));
  nf(i+1)=norm(tg)*norm(th);
  th=conv(th,geth(i));
end

