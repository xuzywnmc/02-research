function a=getg(i)

%%%get the high pass filter%%%%%

a=zeros(1,256);
a(128)=-2.0;
a(128+2^i)=2.0;


return;
