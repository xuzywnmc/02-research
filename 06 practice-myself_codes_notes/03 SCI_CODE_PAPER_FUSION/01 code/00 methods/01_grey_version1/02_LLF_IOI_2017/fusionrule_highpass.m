%    ******** the proposed image fusion rule for residual images (highpass) by
%    Weisheng Li, Jiao Du, and Bin Xiao;*******

function Y = fusionrule_highpass(L1, L2)
% L1-anatomical medical image
% L2-functional medical image
[L11, L12] = anatomical_decomposition(L1);
[L21, L22] = functional_decomposition(L2);
Y = rule(L11, L12, L21, L22);
end

function [y1,y2] = anatomical_decomposition(L1)
% y1 smooth image 
% y2 texture image
[D11, C11] = localExtrema(L1,3);
% figure, imshow(uint8(D11));
% figure, imshow(uint8(C11));
y1 = C11;
y2 = image_substraction(L1, C11);
end

function [y1,y2] = functional_decomposition(L2)
% y1 smooth image
% y2 texture image

I =L2;
Intensity = 1/3*( I(:,:,1) + I(:,:,2) + I(:,:,3) );

matrixA = Intensity;
SF_A=SF(abs(matrixA));
% %

% % % 
y2 = cat(3, SF_A, SF_A, SF_A);
% figure, imshow(y1);
y1 = image_substraction(L2, y2);
% figure, imshow(y2);
end

% 
function Y = rule(L11, L12, L21, L22)
% % % 
Y1 = smooth_rule(L11, L21);
Y2(:,:,1) = texture_rule(L12(:,:,1), L22(:,:,1));
Y2(:,:,2) = texture_rule(L12(:,:,2), L22(:,:,2));
Y2(:,:,3) = texture_rule(L12(:,:,3), L22(:,:,3));
Y = image_addition(Y1,Y2);


end

% % substraction for two images
function Y = image_substraction(I, I1)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
% figure, imshow(uint8(D11));
% figure, imshow(uint8(C11));
r = I1(:,:,1);
g = I1(:,:,2);
b = I1(:,:,3);
% % % 
[M, N] = size(r);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if R(i,j)>r(i,j)
            T(i,j) = R(i,j) - r(i,j);
        else
            T(i,j) = R(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TR = T;
% % % 
[M, N] = size(g);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if G(i,j)>g(i,j)
            T(i,j) = G(i,j) - g(i,j);
        else
            T(i,j) = G(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TG =T;
% % % 
[M, N] = size(b);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if B(i,j)>b(i,j)
            T(i,j) = B(i,j) - b(i,j);
        else
            T(i,j) = B(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TB =T;
% % % 
I2 = cat(3, TR, TG, TB);
Y =I2;
end

% % addition for two images
function Y = image_addition(I1, I2)
R = I1(:,:,1);
G = I1(:,:,2);
B = I1(:,:,3);
% figure, imshow(uint8(D11));
% figure, imshow(uint8(C11));
r = I2(:,:,1);
g = I2(:,:,2);
b = I2(:,:,3);
% % % 
[M, N] = size(r);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if R(i,j)== r(i,j)
            T(i,j) = R(i,j) ;
        else
            T(i,j) = R(i,j) + r(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TR = T;
% % % 
[M, N] = size(g);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if G(i,j)==g(i,j)
            T(i,j) = G(i,j) ;
        else
            T(i,j) = G(i,j)+g(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TG =T;
% % % 
[M, N] = size(b);
T = zeros(M,N);
for i = 1:M
    for j = 1:N
        if B(i,j)>b(i,j)
            T(i,j) = B(i,j);
        else
            T(i,j) = B(i,j) + b(i,j);
        end
    end
end
% figure, imshow(uint8(T));
TB =T;
% % % 
I2 = cat(3, TR, TG, TB);
Y =I2;
end

function Y = smooth_rule(L11, L21)
% % % 
Y =0.5*(L11+ L21);
end


function Y = texture_rule(L12, L22)
M1 = L12;
M2 = L22;

%local energy maximum with window size of 3*3
A11=nlfilter(M1,[3 3],@myfunction3);
B11=nlfilter(M2,[3 3],@myfunction3);
[m,n]=size(A11);
for i=1:m
    for j=1:n
        if abs(A11(i,j))>abs(B11(i,j))
            c(i,j)=M1(i,j);
        else
            c(i,j)=M2(i,j);
        end
    end
end
Y = c;
end
%
function c=myfunction3(x)
y=0;
for i=1:numel(x)
    
    
    y=x(i).^2+y;
    
end
c=y;
end