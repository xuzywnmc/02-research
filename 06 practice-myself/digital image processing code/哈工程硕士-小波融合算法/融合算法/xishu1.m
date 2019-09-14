clear all;
close all;
x=imread('12.jpg');
y=imread('21.jpg');
%a=rgb2gray(x);
%b=rgb2gray(y);
a=double(x);
b=double(y);
[aA,aH,aV,aD]=dwt2(a,'bior2.4');
[bA,bH,bV,bD]=dwt2(b,'bior2.4');
newA=zeros(size(aA));
newH=zeros(size(aH));
newV=zeros(size(aV));
newD=zeros(size(aD));
[m,n]=size(aA);

for i=1:m
    for j=1:n
        if abs(aA(i,j))+abs(aH(i,j))+abs(aV(i,j))+abs(aD(i,j))>=abs(bH(i,j))+abs(bV(i,j))+abs(bD(i,j))+abs(bA(i,j));
            newA(i,j)=aA(i,j);newH(i,j)=aH(i,j);newV(i,j)=aV(i,j);newD(i,j)=aD(i,j);
        else
            newA(i,j)=bA(i,j);newH(i,j)=bH(i,j);newV(i,j)=bV(i,j);newD(i,j)=bD(i,j);
        end;
    end;
end;
new=idwt2(newA,newH,newV,newD,'bior2.4');
new=uint8(new);
figure;
imshow(new);
imwrite(new,'xishu1.bmp');
