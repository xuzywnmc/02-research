function a=getnh(i)


%%%%get the inverse low pass filter%%%%%%%%

a=zeros(1,256);
a(128)=0.375;
a(128-2^i)=0.375;
a(128+2^i)=0.125;
a(128-2*2^i)=0.125;

return;
