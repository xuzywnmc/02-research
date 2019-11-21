function [H,S,V]=RGB2HBV(img)
img=mat2gray(img);  %��������ӳ�䵽[0,1];
[m,n,dim]=size(img);
%%ͼ���RGB
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%%ͼ���RGB2HSV
H=zeros(m,n);   %ɫ���
S=zeros(m,n);   %���Ͷ� ��ֱ��
V=zeros(m,n);   %���� ˮƽ��
for i=1:m
   for j=1:n
       r=R(i,j);
       g=G(i,j);
       b=B(i,j);
       MAX=max([r,g,b]);
       MIN=min([r,g,b]);

       if MAX==MIN
            H(i,j)=0;
       elseif MAX==r && g>=b
            H(i,j)=60*(g-b)/(MAX-MIN);
       elseif MAX==r && g<b
            H(i,j)=60*(g-b)/(MAX-MIN)+360;
       elseif MAX==g
            H(i,j)=60*(b-r)/(MAX-MIN)+120;
       elseif MAX==b
            H(i,j)=60*(r-g)/(MAX-MIN)+240;
       end

       if MAX==0
            S(i,j)=0;
       else
            S(i,j)=1-MIN/MAX;
       end

       V(i,j)=MAX;
   end
end
end

%%ͼ��HSV2RGB
