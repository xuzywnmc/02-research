clear all;
x = -2.9:0.2:2.9;
subplot(1,2,1);bar(x,exp(-x.*x),'r');
xlabel('(a) ��ֱ����ͼ');
subplot(1,2,2);barh(x,exp(-x.*x),'y');
xlabel('(b) ˮƽ����ͼ');
