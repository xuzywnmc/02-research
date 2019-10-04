function F = edge1(I)

%This code can only be used for research purpose only. 
%Please cite the following paper if you use it:
%P. Bao, L. Zhang and X. Wu
%Canny edge detection enhancement by scale multiplication,?
%IEEE. Trans. on Pattern Analysis and Machine Intelligence, vol. 27, pp. 1485-1490, Sept. 2005.

%This code is just one possible implementation of the scale production method
%described in the paper by using Mallat wavelet. You may use a Gaussian function 
%with odd number samples to realize the proposed scheme and may get better results.

% clear;
% ima=imread('MRI.jpg','jpg');
ima = I;
% ima = rgb2gray(ima);
ima=double(ima);
pima=mean(mean(ima.^2));

% figure(1),clf;
% imshow(ima,[0 255]);

n=length(ima);
v=20;
noi=v*randn(n,n);
iman=ima+noi;%%add noise to image
snr=10*log10(pima/v^2)

% figure(2),clf;
% imshow(iman,[0 255]);

sca=3;
th=getth2d(sca-1);th=th(sca-1);

[wr,wc,s,m]=WT2D(iman,sca);
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
edmap=nmsupress2d(Mod,Ang);
% figure(3);clf
% imshow(uint8(edmap));
% for con=16:2:26
%     [Mod,Ang]=compMA(w2r,w2c,corr,corc,th,v,con);%%get the edge map in different threshold
%     edmap=nmsupress2d(Mod,Ang);
%     k=k+1;figure(k);clf
%     imshow(edmap);
% end
F = edmap;
end
