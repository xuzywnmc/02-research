function [map1, map2, map3] = edge1(im)

%This code can only be used for research purpose only. 
%Please cite the following paper if you use it:
%P. Bao, L. Zhang and X. Wu
%Canny edge detection enhancement by scale multiplication,?
%IEEE. Trans. on Pattern Analysis and Machine Intelligence, vol. 27, pp. 1485-1490, Sept. 2005.

%This code is just one possible implementation of the scale production method
%described in the paper by using Mallat wavelet. You may use a Gaussian function 
%with odd number samples to realize the proposed scheme and may get better results.

% clear;
% im=imread('C11.jpg','jpg');
% % %red component     
ima = im(:,:,1);
ima=double(ima);
pima=mean(mean(ima.^2));
n=length(ima);
v=20;
noi=v*randn(n,n);
iman=ima+noi;%%add noise to image
snr=10*log10(pima/v^2)
sca=3;
th=getth2d(sca-1);th=th(sca-1);

[wr,wc,s,m]=wt2d(iman,sca);
[w1r,w2r,w1c,w2c,corr,corc]=compcorsca2d(wr,wc,m);
%%%%%%%%%%%%%%%%%%%%%%%
maskr=(corr>0);
maskc=(corc>0);
corr=corr.*maskr;
corc=corc.*maskc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;
con = 26;
[Mod,Ang]=compMA(w2r,w2c,corr,corc,th,v,con);%%get the edge map in different threshold
edmap1=nmsupress2d(Mod,Ang);

% % % blue component
ima = im(:,:,2);
ima=double(ima);
pima=mean(mean(ima.^2));
n=length(ima);
v=20;
noi=v*randn(n,n);
iman=ima+noi;%%add noise to image
snr=10*log10(pima/v^2)
sca=3;
th=getth2d(sca-1);th=th(sca-1);

[wr,wc,s,m]=wt2d(iman,sca);
[w1r,w2r,w1c,w2c,corr,corc]=compcorsca2d(wr,wc,m);
%%%%%%%%%%%%%%%%%%%%%%%
maskr=(corr>0);
maskc=(corc>0);
corr=corr.*maskr;
corc=corc.*maskc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;
con = 26;
[Mod,Ang]=compMA(w2r,w2c,corr,corc,th,v,con);%%get the edge map in different threshold
edmap2=nmsupress2d(Mod,Ang);

% % % 
% % % 
ima = im(:,:,1);
ima=double(ima);
pima=mean(mean(ima.^2));
n=length(ima);
v=20;
noi=v*randn(n,n);
iman=ima+noi;%%add noise to image
snr=10*log10(pima/v^2)
sca=3;
th=getth2d(sca-1);th=th(sca-1);

[wr,wc,s,m]=wt2d(iman,sca);
[w1r,w2r,w1c,w2c,corr,corc]=compcorsca2d(wr,wc,m);
%%%%%%%%%%%%%%%%%%%%%%%
maskr=(corr>0);
maskc=(corc>0);
corr=corr.*maskr;
corc=corc.*maskc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;
con = 26;
[Mod,Ang]=compMA(w2r,w2c,corr,corc,th,v,con);%%get the edge map in different threshold
edmap3=nmsupress2d(Mod,Ang);
map1 = edmap1; map2 = edmap2; map3 = edmap3;



