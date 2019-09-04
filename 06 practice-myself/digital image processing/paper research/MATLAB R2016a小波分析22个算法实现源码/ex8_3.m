clear all;
clc;
load leleccum;
indx=1:1024;
x=leleccum(indx);
% 产生含噪信号
init=2055615866;
randn('seed',init);
nx=x+18*randn(size(x));
% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS添加到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 进行提升小波分解
[cA1,cD1]=lwt(x,lsnew);
[cA2,cD2]=lwt(cA1,lsnew);
length=size(cA2,2);
c=zeros(1,length*4);
for i=1:length;
    c(i)=cA2(i);
end
for i=length+1:2*length;
    c(i)=cD2(i-length);
end;
for i=length*2+1:4*length;
    c(i)=cD1(i-2*length);
end;
l(1)=length;
l(2)=length;
l(3)=length*2;
l(4)=length*4;
% 估计尺度1的噪声标准差
sigma=wnoisest(c,l,1);
alpha=2;
% 获得消噪过程中的阈值
thr=wbmpen(c,l,sigma,alpha);
keepapp=1;
% 对信号进行消噪
xd=wdencmp('gbl',c,l,'db6',1,thr,'s',keepapp);
subplot(221);
plot(x);
title('原始信号');
subplot(222);
plot(nx);
title('含噪信号');
subplot(223);
plot(xd(1:1000));
title('消噪后的信号');
