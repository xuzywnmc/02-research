clear all;
img6 = 'lena.png';
Im = imread(img6);
Im = rgb2gray(Im);
img= double(Im);
figure('name','orginal-img');
imshow(img, [ ])
%%²âÊÔgetExtrema.mÖĞblock
A=[1 2 3;4 5 6;7 8 9];
C=[19 20 21;22 23 24;25 26 27];
B=[10 11 12 ;13 14 15 ;16 17 18 ];
[x,y] = size(A);
extr = zeros(x,y);
for i = 2
    for j = 2,
        block = ([A(i-1:i+1, j-1:j+1); B(i-1:i+1, j-1:j+1); C(i-1:i+1 ,j-1:j+1)]);
         [c,index] = max(block(:));
%         if (index == 14),
%             if (c>thresh),
%                 extr(i,j)=1;
%             end
%         end
    end
end
%%
ksig1 = fspecial('gaussian', [5 5], 0.4);
A = imfilter(img, ksig1);
figure('name','gaussian-img');
imshow(A, [ ])
tt=diag(2,2)