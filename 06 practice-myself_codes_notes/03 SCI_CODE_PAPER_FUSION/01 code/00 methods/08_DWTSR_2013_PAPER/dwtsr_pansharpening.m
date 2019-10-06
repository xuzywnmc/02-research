function F=dwtsr_pansharpening(MS,P)
% This function is associated with the following paper:
% Yu Liu and Zengfu Wang, "A Practical Pan-Sharpening Method with Wavelet 
% Transform and Sparse Representation ", proceedings of the 10th IEEE 
% International Conference on Imaging Systems and Techniques, Oct. 2013, 
% pp. 288-293.
% 
% Usage of this code is free for research purposes only. 
% Please refer to the above publication if you use this code.
% 
% Please refer to the README.txt for more information.
% The code is edited by Yu Liu 
% 02-Dec-2014

%   DWTSR-based pan-sharpening
%   Input:
%   MS - low-resolution multispectral image
%   P -  panchromatic image
%   Output:
%   F  - high-resolution multispectral image

img_ms=double(MS);  
img_pan=double(P);  

[h1,w1,d1]=size(img_ms);
[h2,w2]=size(img_pan);
if h1~=h2
    img_ms=imresize(img_ms,[h2,w2],'bicubic');
end

img_ms_I=mean(img_ms,3); %IHS 

addpath(genpath('ksvdbox'));
load('dictionary/D_100000_256_8.mat');
overlap=6;                    
epsilon=0.1;
 
%-------------------------------------------------------------------------%
%                                DWT
%-------------------------------------------------------------------------%
tempA=img_ms_I;
tempB=img_pan;
level=1;              
global X;
global Y;
X=cell(level,4);                                                                                       
Y=cell(level,4);                                               
Z=cell(level,4);  
for i=1:level
    [X{i,1},X{i,2},X{i,3},X{i,4}]=dwt2(tempA,'db1','mode','per'); 
    tempA=X{i,1};
    [Y{i,1},Y{i,2},Y{i,3},Y{i,4}]=dwt2(tempB,'db1','mode','per'); 
    tempB=Y{i,1};
end

%-------------------------------------------------------------------------%
%                               lowpass fusion
%-------------------------------------------------------------------------%
img_f_I=lf_fusion(X{level,1},Y{level,1},D,level,overlap,epsilon);
Z{level,1}=img_f_I;

%-------------------------------------------------------------------------%
%                               highpass fusion
%-------------------------------------------------------------------------%
for i=level:-1:1                           
    for j=2:4  
        Z{i,j}=hf_fusion(X{i,j},Y{i,j},1);    
    end
end

%-------------------------------------------------------------------------%
%                               IDWT
%-------------------------------------------------------------------------%
for i=level:-1:1
    if i>1
        Z{i-1,1}=idwt2(Z{i,1},Z{i,2},Z{i,3},Z{i,4},'db1','mode','per');
    else
        img_f_I=idwt2(Z{i,1},Z{i,2},Z{i,3},Z{i,4},'db1','mode','per');
    end
end

img_f=zeros(h2,w2,d1);

for i=1:d1
    img_f(:,:,i)=img_ms(:,:,i)+img_f_I-img_ms_I;  %component substitution
end

F=img_f;