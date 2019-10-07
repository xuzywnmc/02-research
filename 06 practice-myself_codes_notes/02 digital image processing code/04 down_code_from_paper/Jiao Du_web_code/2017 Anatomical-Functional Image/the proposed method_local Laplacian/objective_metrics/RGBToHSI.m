function outImg = RGBToHSI( origImg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
origImg = double(origImg);
R = origImg(:,:,1);
G = origImg(:,:,2);
B = origImg(:,:,3);

%I
I = (R + B + G)./3;

%S
minRGB = min(origImg,[],3);
S = 1 - (3./(R + G + B + eps)).* minRGB;

%H
A = (((R - G) + (R - B))* 0.5)./( sqrt(((R - G).^2) + (R - B).*(G - B)) + eps);
theta = acosd(A);
H = theta;
H(B > G) = 360 - H(B > G);
outImg = cat(3,H,S,I);
end

