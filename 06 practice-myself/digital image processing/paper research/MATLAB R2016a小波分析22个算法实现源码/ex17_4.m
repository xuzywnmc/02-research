%delta�ź� 
x=zeros(1,256);
x(150)=1;
figure(1);
plot(1:length(x),x);
xlabel('������� n');
ylabel('��ֵ A');
% 3��db1С����
wpt = wpdec(x,3,'db1');
%���Ż�
T=besttree(wpt);
% С�����ṹ
plot(wpt);
%db1С�����µ�ʱƵ��
wpviewcf(wpt,1);
