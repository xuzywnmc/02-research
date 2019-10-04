
function [wwr,wwc,ss,m]=wt2d(image,sca)

%%%2D dyanic wavelet transform%%%%%%%%%%%

%image------input image
%sca--------transform scale number

%wwr--------row output
%wwc--------column output
%ss---------smoothed image
%m----------extended point number

%!!! The image should be square

J=sca;
[n,m]=size(image);
if m>32
   m=32;
end

%%%%%%%%reform the image%%%%%%%%%%%%%%%%%%%
ima=zeros(2*m+n,2*m+n);
ima(m+1:m+n,:)=[image(:,m:-1:1) image image(:,n:-1:n-m+1)];
ima(1:m,m+1:m+n)=image(m:-1:1,:);
ima(m+n+1:2*m+n,m+1:m+n)=image(n:-1:n-m+1,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear image;

j=0;
while j<J
   rt=conv2(ima,getg(j));
   wwr(j+1,:,:)=rt(:,128:128+n+2*m-1);
   ct=conv2(ima,getg(j)');
   wwc(j+1,:,:)=ct(128:128+n+2*m-1,:);

   st=conv2(ima,geth(j));
   st=st(:,128:128+n+2*m-1);
   ima=conv2(st,geth(j)');
   ima=ima(128:128+n+2*m-1,:);
   j=j+1;
end

ss=ima;

return;   

     
