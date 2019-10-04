clear all;load chess;
I=ind2gray(X,map);
I=imadjust(I,stretchlim(I),[0 1]);
[N,M]=size(I);
figure
imshow(I);title('(a) 原始图像');
% 设置样条滤波器系数
h=[0.125,0.375,0.375,0.125];
g=[0.5,-0.5];
delta=[1,0,0];
% 设置分解级数，逼近和x,y方向的二进小波系数及梯度绝对值数组清零
J=2;
a(1:N,1:M,1:J+1)=0;
dx(1:N,1:M,1:J+1)=0;
dy(1:N,1:M,1:J+1)=0;
d(1:N,1:M,1:J+1)=0;
% 第1级分解，显示第1级分解的边缘
a(:,:,1)=conv2(h,h,I,'same');
dx(:,:,1)=conv2(delta,g,I,'same');
dy(:,:,1)=conv2(g,delta,I,'same');
x=dx(:,:,1);
y=dy(:,:,1);
d(:,:,1)=sqrt(x.^2+y.^2);
I=imadjust(d(:,:,1),stretchlim(d(:,:,1)),[0 1]);
figure;
imshow(I);title('(b) 第1级小波变换边缘检测');
% 第2至J+1级分解
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
    imshow(I);title(['(',ch,') 第',num2str(j+1),'级小波变换边缘检测']);
end  
