%*******     the proposed image fusion rule for approximate images(lowpass) by
%Weisheng Li, Jiao Du, and Bin Xiao;********


function Y = fusionrule_lowpass(L1, L2)
% L1-anatomical medical image
% L2-functional medical image
%

M1 = L1(:,:,1);
M2 = L2(:,:,1);
% L1-anatomical medical image
% L2-functional medical image
%local energy maximum with window size of 3*3
um = 3;
N1 = conv2(M1, ones(um), 'valid');
N2 = conv2(M2, ones(um), 'valid');
 %
A1 = ordfilt2(abs(es2(N1, floor(um/2))), um*um, ones(um));
A2 = ordfilt2(abs(es2(N2, floor(um/2))), um*um, ones(um));
% second step
% 
mm =(conv2(double((A1 > A2)), double(ones(um)), 'same')) > floor(um*um/2);
YR = (mm.*M1) + ((~mm).*M2);
% % % 
M1 = L1(:,:,2);
M2 = L2(:,:,2);
% L1-anatomical medical image
% L2-functional medical image
%local energy maximum with window size of 3*3
um = 3;
N1 = conv2(M1, ones(um), 'valid');
N2 = conv2(M2, ones(um), 'valid');
 %
A1 = ordfilt2(abs(es2(N1, floor(um/2))), um*um, ones(um));
A2 = ordfilt2(abs(es2(N2, floor(um/2))), um*um, ones(um));
% second step
% 
mm =(conv2(double((A1 > A2)), double(ones(um)), 'same')) > floor(um*um/2);
YG = (mm.*M1) + ((~mm).*M2);
% % 
M1 = L1(:,:,3);
M2 = L2(:,:,3);
% L1-anatomical medical image
% L2-functional medical image
%local energy maximum with window size of 3*3
um = 3;
N1 = conv2(M1, ones(um), 'valid');
N2 = conv2(M2, ones(um), 'valid');
 %
A1 = ordfilt2(abs(es2(N1, floor(um/2))), um*um, ones(um));
A2 = ordfilt2(abs(es2(N2, floor(um/2))), um*um, ones(um));
% second step
% 
mm =(conv2(double((A1 > A2)), double(ones(um)), 'same')) > floor(um*um/2);
YB = (mm.*M1) + ((~mm).*M2);
% % 
Y = cat(3, YR, YG, YB);
end

