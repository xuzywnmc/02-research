function a=getk(i)


%%%get inverse high pass filter%%%%%%

a=zeros(1,256);
a(128)=-0.171875;
a(128-2^i)=0.171875;
a(128-2*2^i)=0.054685;
a(128-3*2^i)=0.0078125;
a(128+1*2^i)=-0.054685;
a(128+2*2^i)=-0.0078125;


return;
