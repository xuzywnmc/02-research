function Y = scalefuse(I1, I2)
%Y = scalefuse(M1, M2, ap) coefficinet selection for highpass components 
%
%    I1  - coefficients A
%    I2  - coefficients B
%   
%    Y   - combined coefficients

%    (Oliver Rockinger 16.08.99)

% check inputs 
[z1 s1] = size(I1);
[z2 s2] = size(I2);
if (z1 ~= z2) | (s1 ~= s2)
  error('Input images are not of same size');
end;

% method
% % % % Eight orientation decompositions for each scale
        Y = fuse(I1, I2)
% % % % 
end

function y = fuse(I1, I2)

% % % % % % % % % % % % % % % % % % 


% Í¼ÏñÏñËØÖµµÄ·ÂÉä±ä»»-Ë®Æ½¼ôÇĞh1ºÍ´¹Ö±¼ôÇĞh2
% affine transform

h1=[1 2;0 1];
h2=[1 0;2 1];

k11 = imfilter(I1,h1);
k12 = imfilter(I1,h2);

k21 = imfilter(I2,h1);
k22 = imfilter(I2,h2);
% % % % % % % % % % % % % contrast
c1 = W_contrast( W_direction(k11), W_direction(k12));
c2 = W_contrast( W_direction(k21), W_direction(k22));
% % % % % % % % % % % % % % outline
% % % % % % % % % % horizotal
o11 = W_outline( k11,I1);
o12 = W_outline( k21,I2);
o1 = (o11+o12)./2;
% % % % % % % %vertical
o21 = W_outline( k12,I1);
o22 = W_outline( k22,I2);
o2 = (o21+o22)./2;
% % % % % % % % % % 
y= (o1+o2)./2 + (c1+c2)./2;

end

function y = W_direction (I1)
% matlab±ßÔµ¼ì²âkirschËã×Ó
% the opeartor kirsch for edge detection
h1=[5 5 5;-3 0 -3;-3 -3 -3];
h2=[-3 5 5;-3 0 5;-3 -3 -3];
h3=[-3 -3 5;-3 0 5;-3 -3 5];
h4=[-3 -3 -3;-3 0 5;-3 5 5];
h5=[-3 -3 -3;-3 0 -3;5 5 5];
h6=[-3 -3 -3;5 0 -3;5 5 -3];
h7=[5 -3 -3; 5 0 -3;5 -3 -3];
h8=[5 5 -3;5 0 -3;-3 -3 -3];

K1=imfilter(I1,h1);       %¾ùÖµÂË²¨

K2=imfilter(I1,h2);       %¾ùÖµÂË²¨

K3=imfilter(I1,h3);       %¾ùÖµÂË²¨

K4=imfilter(I1,h4);       %¾ùÖµÂË²¨

K5=imfilter(I1,h5);       %¾ùÖµÂË²¨

K6=imfilter(I1,h6);       %¾ùÖµÂË²¨

K7=imfilter(I1,h7);       %¾ùÖµÂË²¨

K8=imfilter(I1,h8);       %¾ùÖµÂË²¨

y = (K1 + K2 + K3 + K4 + K5 + K6 + K7 + K8)./8;
end
function Y = W_contrast (M1, M2)
% PCA is for the contrast

%
%    M1 - input image #1
%    M2 - input image #2
%
%    Y  - fused image   

%    (Oliver Rockinger 16.08.99)

% check inputs 
[z1 s1] = size(M1);
[z2 s2] = size(M2);
if (z1 ~= z2) | (s1 ~= s2)
  error('Input images are not of same size');
end;

% compute, select & normalize eigenvalues 
[V, D] = eig(cov([M1(:) M2(:)]));
if (D(1,1) > D(2,2))
  a = V(:,1)./sum(V(:,1));
else  
  a = V(:,2)./sum(V(:,2));
end;

% and fuse
Y = a(1)*M1+a(2)*M2;

end




function y = W_outline(img1, img2)
 y=0.5*(img1 + img2);

% 
end



 



