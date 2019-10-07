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
