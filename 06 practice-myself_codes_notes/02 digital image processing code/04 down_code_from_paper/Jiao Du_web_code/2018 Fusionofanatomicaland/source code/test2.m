%This code can only be used for research purpose only. 
%Please cite the following paper if you use it:
%J. Bao, W.S. Li and B. Xiao
%Fusion of anatomical and functional images using parallel saliency features
%Information Sciences, vol. 430-431, pp. 567-576, Mar. 2018. 

% % % % % processing for CSF
D1 = double(imread('C21.jpg'));
D2 = double(imread('C22.jpg'));
D3 = double(imread('C23.jpg'));

% % % %using run_saliency on C**.jpg to get the R**.jpg 
A = double(imread('R21.jpg'));
B = double(imread('R22.jpg'));
C = double(imread('R23.jpg'));
% % % % % % % % 

% % % % % % % 

%%
[M,N] = size(A);
cp = zeros(M,N,3);
%%
for j=1:N
    for i=1:M
        
if (A(i,j)>B(i,j)>C(i,j))||(A(i,j)>C(i,j)>B(i,j))||(A(i,j)>B(i,j) && B(i,j)==C(i,j))||(A(i,j)==C(i,j) && A(i,j)>B(i,j))||(A(i,j)==B(i,j) && B(i,j)>C(i,j))||(A(i,j)==C(i,j)&&C(i,j)==B(i,j)) 
    cp(i,j,1) = D1(i,j,1);
    cp(i,j,2) = D1(i,j,2);
    cp(i,j,3) = D1(i,j,3);
elseif (C(i,j)>A(i,j)>B(i,j))||(C(i,j)>B(i,j)>A(i,j))||(C(i,j)==B(i,j) && C(i,j)>A(i,j))||(C(i,j)==A(i,j) && C(i,j)>B(i,j)) ||(C(i,j)>A(i,j) && A(i,j)==B(i,j))
    cp(i,j,1) = D3(i,j,1);
    cp(i,j,2) = D3(i,j,2);
    cp(i,j,3) = D3(i,j,3);
else
    cp(i,j,1) = D2(i,j,1);
    cp(i,j,2) = D2(i,j,2);
    cp(i,j,3) = D2(i,j,3);
end
    end
end
       
imwrite(uint8(cp),'CSF.jpg');

% % % % % % % % 
% % % image process for ESF 
S1 = double(imread('D11.jpg'));
S2 = double(imread('D12.jpg'));
S3 = double(imread('D13.jpg'));
% % % % % % 
 [A1, A2, A3] = edge1(S1);
 [B1, B2, B3] = edge1(S2);
 [C1, C2, C3] = edge1(S3);

%%
[M,N] = size(A1);
cp = zeros(M,N,3);
% % % % % % % for red chaneel
A = A1; B = B1; C = C1;
%%
for j=1:N
    for i=1:M
        
if (A(i,j)>B(i,j)>C(i,j))||(A(i,j)>C(i,j)>B(i,j))||(A(i,j)>B(i,j) && B(i,j)==C(i,j))||(A(i,j)==C(i,j) && A(i,j)>B(i,j))||(A(i,j)==B(i,j) && B(i,j)>C(i,j))||(A(i,j)==C(i,j)&&C(i,j)==B(i,j)) 
    cp(i,j,1) = S1(i,j,1);

elseif (C(i,j)>A(i,j)>B(i,j))||(C(i,j)>B(i,j)>A(i,j))||(C(i,j)==B(i,j) && C(i,j)>A(i,j))||(C(i,j)==A(i,j) && C(i,j)>B(i,j)) ||(C(i,j)>A(i,j) && A(i,j)==B(i,j))
    cp(i,j,1) = S3(i,j,1);
else
    cp(i,j,1) = S2(i,j,1);
end
    end
end
% % % % % % 
% % % % % % % for blue 2 chaneel
A = A2; B = B2; C = C2;
%%
for j=1:N
    for i=1:M
        
if (A(i,j)>B(i,j)>C(i,j))||(A(i,j)>C(i,j)>B(i,j))||(A(i,j)>B(i,j) && B(i,j)==C(i,j))||(A(i,j)==C(i,j) && A(i,j)>B(i,j))||(A(i,j)==B(i,j) && B(i,j)>C(i,j))||(A(i,j)==C(i,j)&&C(i,j)==B(i,j)) 
    cp(i,j,2) = S1(i,j,2);

elseif (C(i,j)>A(i,j)>B(i,j))||(C(i,j)>B(i,j)>A(i,j))||(C(i,j)==B(i,j) && C(i,j)>A(i,j))||(C(i,j)==A(i,j) && C(i,j)>B(i,j)) ||(C(i,j)>A(i,j) && A(i,j)==B(i,j))
    cp(i,j,2) = S3(i,j,2);
else
    cp(i,j,2) = S2(i,j,2);
end
    end
end
% % % % 
% % % % % % % for green chaneel 3
A = A3; B = B3; C = C3;
%%
for j=1:N
    for i=1:M
        
if (A(i,j)>B(i,j)>C(i,j))||(A(i,j)>C(i,j)>B(i,j))||(A(i,j)>B(i,j) && B(i,j)==C(i,j))||(A(i,j)==C(i,j) && A(i,j)>B(i,j))||(A(i,j)==B(i,j) && B(i,j)>C(i,j))||(A(i,j)==C(i,j)&&C(i,j)==B(i,j)) 
    cp(i,j,3) = S1(i,j,3);

elseif (C(i,j)>A(i,j)>B(i,j))||(C(i,j)>B(i,j)>A(i,j))||(C(i,j)==B(i,j) && C(i,j)>A(i,j))||(C(i,j)==A(i,j) && C(i,j)>B(i,j)) ||(C(i,j)>A(i,j) && A(i,j)==B(i,j))
    cp(i,j,3) = S3(i,j,3);
else
    cp(i,j,3) = S2(i,j,3);
end
    end
end
imwrite(uint8(cp),'ESF.jpg');

