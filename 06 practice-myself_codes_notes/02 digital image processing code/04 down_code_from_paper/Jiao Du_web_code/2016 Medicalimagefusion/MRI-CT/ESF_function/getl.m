function a=getl(i)

%%%%%get filter L%%%%%%%%%%%

sxy=256;
a=zeros(1,sxy);
a(sxy/2)=0.65625;
a(sxy/2+1*2^i)=0.1171875;
a(sxy/2+2*2^i)=0.046875;
a(sxy/2+3*2^i)=0.0078125;
a(sxy/2-1*2^i)=0.1171825;
a(sxy/2-2*2^i)=0.046875;
a(sxy/2-3*2^i)=0.0078125;

return;
