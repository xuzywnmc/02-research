clear all;load chess;
I=ind2gray(X,map);
I=imadjust(I,stretchlim(I),[0 1]);
[N,M]=size(I);
figure
imshow(I);title('(a) ԭʼͼ��');
% ���������˲���ϵ��
h=[0.125,0.375,0.375,0.125];
g=[0.5,-0.5];
delta=[1,0,0];
% ���÷ֽ⼶�����ƽ���x,y����Ķ���С��ϵ�����ݶȾ���ֵ��������
J=2;
a(1:N,1:M,1:J+1)=0;
dx(1:N,1:M,1:J+1)=0;
dy(1:N,1:M,1:J+1)=0;
d(1:N,1:M,1:J+1)=0;
% ��1���ֽ⣬��ʾ��1���ֽ�ı�Ե
a(:,:,1)=conv2(h,h,I,'same');
dx(:,:,1)=conv2(delta,g,I,'same');
dy(:,:,1)=conv2(g,delta,I,'same');
x=dx(:,:,1);
y=dy(:,:,1);
d(:,:,1)=sqrt(x.^2+y.^2);
I=imadjust(d(:,:,1),stretchlim(d(:,:,1)),[0 1]);
figure;
imshow(I);title('(b) ��1��С���任��Ե���');
% ��2��J+1���ֽ�
lh=length(h);
lg=length(g);
for j=1:J
    lhj=2^j*(lh-1)+1;
    lgj=2^j*(lg-1)+1;
    hj(1:lhj)=0;
    gj(1:lgj)=0;
    for n=1:lh
        hj(2^j*(n-1)+1)=h(n);
    end
    for n=1:lg
        gj(2^j*(n-1)+1)=g(n);
    end
    a(:,:,j+1)=conv2(hj,hj,a(:,:,j),'same');
    dx(:,:,j+1)=conv2(delta,gj,a(:,:,j),'same');
    dy(:,:,j+1)=conv2(gj,delta,a(:,:,j),'same');
    x=dx(:,:,j+1);
    y=dy(:,:,j+1);
    d(:,:,j+1)=sqrt(x.^2+y.^2);
    I=imadjust(d(:,:,j+1),stretchlim(d(:,:,j+1)),[0 1]);
    figure(j+2);
    if j==1 
        ch='c'
    else
        ch='d'
    end
    imshow(I);title(['(',ch,') ��',num2str(j+1),'��С���任��Ե���']);
end  
