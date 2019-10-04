function f=getf(sca)

%%%get filter f=H0*H1*....*Gm%%%%%%%%%
%sca----scale number
%f------f(i,:) is the filter of scale i, i=1,2,...,sca

h=zeros(1,256);
h(128)=1;
for i=0:sca-1
   ff=conv(h,getg(i));
   f(i+1,:)=ff(128:127+256);
   h=conv(h,geth(i));
   h=h(128:127+256);
end





      
   