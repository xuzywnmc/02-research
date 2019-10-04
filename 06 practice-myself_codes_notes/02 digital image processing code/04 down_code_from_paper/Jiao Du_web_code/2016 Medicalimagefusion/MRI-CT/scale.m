
function  scale(filename1, filename2)
% close all;clear all;
% % % %
% disp(varargin)
if ~isdeployed
	addpath ./ESF_function
end

I = imread(filename1);
I =im2double(I);
[D11, C11] = localExtrema(I,3);
[D12, C12] = localExtrema(I,5);
[D13, C13] = localExtrema(I,7);
% % detailed and corase image at different scale3,5,7
% % % % % % % % % % % % % %
I = imread(filename2);
I =im2double(I);
[D21, C21] = localExtrema(I,3);
[D22, C22] = localExtrema(I,5);
[D23, C23] = localExtrema(I,7);
% % detailed and corase image at different scale3,5,7
E21 = edge_preserving(C21);
% x = C21;
% cmd=['edge_preserving.exe' ' ' x];
% E21 = system(cmd,'-echo');
E22 = edge_preserving(C22);
E23 = edge_preserving(C23);
E11 = edge_preserving(C11);
E12 = edge_preserving(C12);
% x = C12;
% cmd=['edge_preserving.exe' ' ' x];
% E12 = system(cmd,'-echo');
E13 = edge_preserving(C13);
% x = C13;
% cmd=['edge_preserving.exe' ' ' x];
% E13 = system(cmd,'-echo');
W =entropy(E11)+entropy(E12)+entropy(E13)+entropy(E21)+entropy(E22)+entropy(E23);
W11 = entropy(E11)/W;
W12 = entropy(E12)/W;
W13 = entropy(E13)/W;
W21 = entropy(E21)/W;
W22 = entropy(E22)/W;
W23 = entropy(E23)/W;
E = W11*E11 + W12*E12 + W13*E13 + W21*E21 + W22*E22 + W23*E23 ;
%
CM(:,:,1) = E;
CM(:,:,2) = E;
CM(:,:,3) = E;
% % % % D21,D22,D23 VLI
W = VLI(D21) + VLI(D22) + VLI(D23);
W21 = VLI(D21)/W;
W22 = VLI(D22)/W;
W23 = VLI(D23)/W;
R = W21*D21 + W22*D22 + W23*D23 ;
DE = R;
% % % % D11,D12,D13
P = (D11+D12+D13)/3;
CD = (DE+ P)/2;
% % % % % % % % % % r
F = CD + CM;
imwrite(F,'F-001.jpg');
end
% % %
function F = edge_preserving(I)
%  I = imread('2MRI.jpg');  % 读入图像
%  I = im2double(I);
I=rgb2gray(I);               % 转化为灰色图像
% imshow(I);title('原图')
BW1 = edge1(I);  % 调用canny函数
% figure,imshow(uint8(BW1));     % 显示分割后的图像，即梯度图像
% title('matlab canny')
M1 = I;
M2 = BW1;
um = 3;th=.75;
% compute salience
S1 = conv2(es2(M1.*M1, floor(um/2)), ones(um), 'valid');
S2 = conv2(es2(M2.*M2, floor(um/2)), ones(um), 'valid');
% compute match
MA = conv2(es2(M1.*M2, floor(um/2)), ones(um), 'valid');
MA = 2 * MA ./ (S1 + S2 + eps);
% selection
m1 = MA > th; m2 = S1 > S2;
w1 = (0.5 - 0.5*(1-MA) / (1-th));
Y  = (~m1) .* ((m2.*M1) + ((~m2).*M2));
Y  = Y + (m1 .* ((m2.*M1.*(1-w1))+((m2).*M2.*w1) + ((~m2).*M2.*(1-w1))+((~m2).*M1.*w1)));
F = Y;
end
function [D, M] = localExtrema(I, k)

dim = ndims(I);
channel = size(I, 3);

if (~isa(I, 'double'))
    I = double(I)/255;
end

if (~exist('Y'))
    %% convert the I into luminance if necessary
    if (channel == 3)
        yiq = rgb2ntsc(I);
        Y = yiq(:, :, 1);
    else
        Y = I;
    end
end

if (~exist('k'))
    k = 3;
end


%disp('    Identi?cation of local minima and local maxima of I');
Sminima = double(ordfilt2(Y, k, true(k)) >= Y);
Smaxima = double(ordfilt2(Y, k*k-k+1, true(k)) <= Y);

%disp('    Interpolation of the local minima and maxima to compute minimal and maximal extremal envelopes respectively');
Icolor(:, :, 1) = Y;
for i=1:channel
    Icolor(:, :, i+1) = I(:, :, i);
end

Eminima = getColorExact(Sminima, Icolor);
Emaxima = getColorExact(Smaxima, Icolor);

%disp('    Computation of the smoothed mean M as the average of the extremal envelopes');
M = (Eminima(:,:,2:(channel+1)) + Emaxima(:,:,2:(channel+1)))/2;
%  figure,imshow (uint8(M));
D = I - M;
%  figure,imshow(uint8(D));
end

function nI=getColorExact(colorIm,ntscIm)
[n, m, d] = size(ntscIm);
imgSize=n*m;


nI(:,:,1)=ntscIm(:,:,1);

indsM=reshape([1:imgSize],n,m);
lblInds=find(colorIm);

wd=1;

len=0;
consts_len=0;
col_inds=zeros(imgSize*(2*wd+1)^2,1);
row_inds=zeros(imgSize*(2*wd+1)^2,1);
vals=zeros(imgSize*(2*wd+1)^2,1);
gvals=zeros(1,(2*wd+1)^2);


for j=1:m
    for i=1:n
        consts_len=consts_len+1;
        
        if (~colorIm(i,j))
            tlen=0;
            for ii=max(1,i-wd):min(i+wd,n)
                for jj=max(1,j-wd):min(j+wd,m)
                    
                    if (ii~=i)|(jj~=j)
                        len=len+1; tlen=tlen+1;
                        row_inds(len)= consts_len;
                        col_inds(len)=indsM(ii,jj);
                        gvals(tlen)=ntscIm(ii,jj,1);
                    end
                end
            end
            t_val=ntscIm(i,j,1);
            gvals(tlen+1)=t_val;
            c_var=mean((gvals(1:tlen+1)-mean(gvals(1:tlen+1))).^2);
            csig=c_var*0.6;
            mgv=min((gvals(1:tlen)-t_val).^2);
            if (csig<(-mgv/log(0.01)))
                csig=-mgv/log(0.01);
            end
            if (csig<0.000002)
                csig=0.000002;
            end
            
            gvals(1:tlen)=exp(-(gvals(1:tlen)-t_val).^2/csig);
            gvals(1:tlen)=gvals(1:tlen)/sum(gvals(1:tlen));
            vals(len-tlen+1:len)=-gvals(1:tlen);
        end
        
        
        len=len+1;
        row_inds(len)= consts_len;
        col_inds(len)=indsM(i,j);
        vals(len)=1;
        
    end
end


vals=vals(1:len);
col_inds=col_inds(1:len);
row_inds=row_inds(1:len);


A=sparse(row_inds,col_inds,vals,consts_len,imgSize);
b=zeros(size(A,1),1);


for t=2:d
    curIm=ntscIm(:,:,t);
    b(lblInds)=curIm(lblInds);
    new_vals=A\b;
    nI(:,:,t)=reshape(new_vals,n,m,1);
end
end


%snI=nI;
%nI=ntsc2rgb(nI);
