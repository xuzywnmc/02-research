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
