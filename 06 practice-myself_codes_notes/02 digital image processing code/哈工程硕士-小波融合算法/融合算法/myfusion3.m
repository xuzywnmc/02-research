clear all;
close all;
x=imread('12.jpg');
y=imread('21.jpg');
%a=rgb2gray(x);
%b=rgb2gray(y);
a=double(x);
b=double(y);
%[c1,s1]=wavedec2(x,4,'bior2.4');
%[c2,s2]=wavedec2(x,4,'bior2.4');
[aA,aH,aV,aD]=dwt2(a,'bior2.4');
[bA,bH,bV,bD]=dwt2(b,'bior2.4');
%aA=appcoef2(c1,s1,'bior2.4',2);
%aH=detcoef2('h',c1,s1,2);
%aV=detcoef2('v',c1,s1,2);
%aD=detcoef2('d',c1,s1,2);

%bA=appcoef2(c1,s1,'bior2.4',2);
%bH=detcoef2('h',c1,s1,2);
%bV=detcoef2('v',c1,s1,2);
%bD=detcoef2('d',c1,s1,2);

newA=zeros(size(aA));
newH=zeros(size(aH));
newV=zeros(size(aV));
newD=zeros(size(aD));
[m n]=size(aA);

for i=2:m-1
    for j=2:n-1
        %newA(i,j)=(aA(i,j)+bA(i,j))/2;
       
        Cax(i,j)=aA(i+1,j-1)+aA(i+1,j+1)-aA(i-1,j-1)-aA(i-1,j+1)+2*aA(i+1,j)-2*aA(i-1,j);
        Cay(i,j)=aA(i-1,j+1)+aA(i+1,j+1)-aA(i-1,j-1)-aA(i+1,j-1)+2*aA(i,j+1)-2*aA(i,j-1);
        Cbx(i,j)=bA(i+1,j-1)+bA(i+1,j+1)-bA(i-1,j-1)-bA(i-1,j+1)+2*bA(i+1,j)-2*bA(i-1,j);
        Cby(i,j)=bA(i-1,j+1)+bA(i+1,j+1)-bA(i-1,j-1)-bA(i+1,j-1)+2*bA(i,j+1)-2*bA(i,j-1);
        Ca(i,j)=sqrt(Cax(i,j)*Cax(i,j)+Cay(i,j)*Cay(i,j));
        Cb(i,j)=sqrt(Cbx(i,j)*Cbx(i,j)+Cby(i,j)*Cby(i,j));
         if  Ca(i,j)>=Cb(i,j);
           newA(i,j)=aA(i,j);
            else
            newA(i,j)=bA(i,j);
             end
        
    end
end
                  

for i=1:m
    for j=1:n
        if abs(aH(i,j))+abs(aV(i,j))+abs(aD(i,j))>=abs(bH(i,j))+abs(bV(i,j))+abs(bD(i,j));
            newH(i,j)=aH(i,j);newV(i,j)=aV(i,j);newD(i,j)=aD(i,j);
        else
            newH(i,j)=bH(i,j);newV(i,j)=bV(i,j);newD(i,j)=bD(i,j);
        end;
    end;
end;

new=idwt2(newA,newH,newV,newD,'bior2.4');
%new=waverec2(newA,newH,newV,newD,'bior2.4');
new=uint8(new);
figure;
imshow(new);
imwrite(new,'myfusion3.bmp');
