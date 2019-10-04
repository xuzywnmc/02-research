%This code can only be used for research purpose only. 
%Please cite the following paper if you use it:
%J. Bao, W.S. Li and B. Xiao
%Fusion of anatomical and functional images using parallel saliency features
%Information Sciences, vol. 430-431, pp. 567-576, Mar. 2018. 

% % % % % % % % % % % image decomposition using average filtering
I = double(imread('MRI-014.jpg'));
 I = imresize(I,[256,256]);
% % % % %  
 se = fspecial('average', [5 5]);
% % % %  
 B = imfilter(I,se,'replicate');
 D = I - B;
 C11 = B; D11 = D;
% % % 
 I = C11;
 B = imfilter(I,se,'replicate');
 D = I - B;
 C12 = B; D12 = D;
% % % %  
 I = C12;
 B = imfilter(I,se,'replicate');
 D = I - B;
 C13 = B; D13 = D;
% % %  
imwrite(uint8(C11),'C11.jpg');
imwrite(uint8(D11),'D11.jpg');
imwrite(uint8(C12),'C12.jpg');
imwrite(uint8(D12),'D12.jpg');
imwrite(uint8(C13),'C13.jpg');
imwrite(uint8(D13),'D13.jpg');
% % % % PET image
I = double(imread('PET-014.jpg'));
 I = imresize(I,[256,256]);
% % % % %  
 se = fspecial('average', [5 5]);
% % % %  
 B = imfilter(I,se,'replicate');
 D = I - B;
 C21 = B; D21 = D;
% % % 
 I = C21;
 B = imfilter(I,se,'replicate');
 D = I - B;
 C22 = B; D22 = D;
% % % %  
 I = C22;
 B = imfilter(I,se,'replicate');
 D = I - B;
 C23 = B; D23 = D;
% % %  
imwrite(uint8(C21),'C21.jpg');
imwrite(uint8(D21),'D21.jpg');
imwrite(uint8(C22),'C22.jpg');
imwrite(uint8(D22),'D22.jpg');
imwrite(uint8(C23),'C23.jpg');
imwrite(uint8(D23),'D23.jpg');
