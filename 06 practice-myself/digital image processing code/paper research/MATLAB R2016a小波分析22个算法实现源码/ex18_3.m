clear all;
x=linspace(0,10,1000);
y=25*exp(-(x-5.7).^2/(2*0.5*2))+20*exp(-(x-3.6).^2/(2*0.2^2));      %ɫ��ģ��
[c1,l1]=wavedec(y,7,'db4');
[c,l]=wavedec(y,7,'db2');
d25=wrcoef('d',c1,l1,'db4',5);
d15=wrcoef('d',c,l,'db2',5);
figure;
plot(x,y);
xlabel('ʱ��');ylabel('��ֵ');
axis([0 10 0 25])
figure;
plot(d25);hold on;
plot(d15,':');
xlabel('ʱ��');ylabel('��ֵ');
legend('d25�ź�','d15�ź�');
