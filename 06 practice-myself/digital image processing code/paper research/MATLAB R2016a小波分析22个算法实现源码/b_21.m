clear all;
x = -2.9:0.2:2.9;
subplot(1,2,1);bar(x,exp(-x.*x),'r');
xlabel('(a) 垂直条件图');
subplot(1,2,2);barh(x,exp(-x.*x),'y');
xlabel('(b) 水平条件图');
