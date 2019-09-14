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
       
        Cax(i,j)=aA(i-1,j-1)+aA(i-1,j)+aA(i-1,j+1)-aA(i+1,j-1)-aA(i+1,j)-aA(i+1,j+1);
        Cay(i,j)=aA(i-1,j+1)+aA(i,j+1)+aA(i+1,j+1)-aA(i-1,j-1)-aA(i,j-1)-aA(i+1,j-1);
        Cbx(i,j)=bA(i-1,j-1)+bA(i-1,j)+bA(i-1,j+1)-bA(i+1,j-1)-bA(i+1,j)-bA(i+1,j+1);
        Cby(i,j)=bA(i-1,j+1)+bA(i,j+1)+bA(i+1,j+1)-bA(i-1,j-1)-bA(i,j-1)-bA(i+1,j-1);
        
        Ca(i,j)=sqrt(Cax(i,j)*Cax(i,j)+Cay(i,j)*Cay(i,j));
        Cb(i,j)=sqrt(Cbx(i,j)*Cbx(i,j)+Cby(i,j)*Cby(i,j));
         if  Ca(i,j)>=Cb(i,j);
            newA(i,j)=aA(i,j);
            else
            newA(i,j)=bA(i,j);
             end
        
    end
end
                  

%for p=-1:1
    % for q=-1:1
                   %Ca(i,j)=sqrt(Cax(i+p,j+q)*Cax(i+p,j+q)+Cay(i+p,j+q)*Cay(i+p,j+q));
                   %Cb(i,j)=sqrt(Cbx(i+p,j+q)*Cbx(i+p,j+q)+Cby(i+p,j+q)*Cby(i+p,j+q));
                   %Cb(i,j)=sqrt((Cbx(i+p,j+q))^2+(Cby(i+p,j+q))^2);
     %end
%end
    
            

for i=2:m-2
    for j=2:n-2
        BaH(i,j)=abs(aH(i,j)-aH(i+2,j));
        BaV(i,j)=abs(aV(i,j)-aV(i+2,j));
        BaD(i,j)=abs(aD(i,j)-aD(i+2,j));
        
        BbH(i,j)=abs(bH(i,j)-bH(i+2,j));
        BbV(i,j)=abs(bV(i,j)-bV(i+2,j));
        BbD(i,j)=abs(bD(i,j)-bD(i+2,j));
        
        SBaH(i,j)=(BaH(i,j))^2;
        SBaV(i,j)=(BaV(i,j))^2;
        SBaD(i,j)=(BaD(i,j))^2;
                
        SBbH(i,j)=(BbH(i,j))^2;
        SBbV(i,j)=(BbV(i,j))^2;
        SBbD(i,j)=(BbD(i,j))^2;
        if  SBaH(i,j)>=SBbH(i,j);
            newH(i,j)=aH(i,j);
        else
             newH(i,j)=bH(i,j);
        end
        if  SBaV(i,j)>=SBbV(i,j);
            newV(i,j)=aV(i,j);
        else
             newV(i,j)=bV(i,j);
        end 
        if  SBaD(i,j)>=SBbD(i,j);
            newD(i,j)=aD(i,j);
        else
             newD(i,j)=bD(i,j);
        end
        
    end
end
        
        %for p=-1:1
            %for q=-1:1
                %SBaH(i,j)=(BaH(i+p,j+q))^2;
                %SBaV(i,j)=(BaV(i+p,j+q))^2;
                %SBaD(i,j)=(BaD(i+p,j+q))^2;
                
                %SBbH(i,j)=(BbH(i+p,j+q))^2;
                %SBbV(i,j)=(BbV(i+p,j+q))^2;
                %SBbD(i,j)=(BbD(i+p,j+q))^2;
                
            %end
        %end
        
    

new=idwt2(newA,newH,newV,newD,'bior2.4');
%new=waverec2(newA,newH,newV,newD,'bior2.4');
new=uint8(new);
figure;
imshow(new);
imwrite(new,'xishu.bmp');
title('系数绝对值之和取大')