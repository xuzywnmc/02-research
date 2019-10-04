%This code can only be used for research purpose only. 
%Please cite the following paper if you use it:
%J. Bao, W.S. Li and B. Xiao
%Fusion of anatomical and functional images using parallel saliency features
%Information Sciences, vol. 430-431, pp. 567-576, Mar. 2018. 


MS1 = double(imread('C11.jpg'));
MS2 = double(imread('C12.jpg'));
MS3 = double(imread('C13.jpg'));
% % % % 

% % % 

% % % % % 
PS1 = double(imread('D21.jpg'));
PS2 = double(imread('D22.jpg'));
PS3 = double(imread('D23.jpg'));
% % % % % 
% % % % 
w1 = entropy(MS1)./(entropy(MS1) + entropy(MS2) +entropy(MS3));
w2 = entropy(MS2)./(entropy(MS1) + entropy(MS2) +entropy(MS3));
w3 = entropy(MS3)./(entropy(MS1) + entropy(MS2) +entropy(MS3));
MS = w1*MS1 + w2*MS2 + w3*MS3;
imwrite(uint8(MS),'MS.jpg');
% figure,imshow(uint8(MS));
w1 = entropy(PS1)./(entropy(PS1) + entropy(PS2) +entropy(PS3));
w2 = entropy(PS2)./(entropy(PS1) + entropy(PS2) +entropy(PS3));
w3 = entropy(PS3)./(entropy(PS1) + entropy(PS2) +entropy(PS3));
PS = w1*PS1 + w2*PS2 + w3*PS3;
imwrite(uint8(PS),'PS.jpg');
% figure,imshow(uint8(PS));
% % % % 
MD = double(imread('ESF.jpg'));

% % %  

% % % 
PD = double(imread('CSF.jpg'));
% % % % 
mm = (abs(MD)) > (abs(PS));
F1  = (mm.*MD) + ((~mm).*PS);
F2 = (MS+PD)./2;

% % % % 
F = F1+F2;
imwrite(uint8(F1),'F1.jpg');
imwrite(uint8(F2),'F2.jpg');
imwrite(uint8(F),'PRO-014.jpg');
figure, imshow(uint8(F));



