%��Ƶ�ź� 
for i=1:512
    x(i)=sin(500*pi*i/1000+20*sin(20*pi*i/1000));
end
figure(1);
plot(1:length(x),x);
xlabel('������� n');
ylabel('��ֵ A');
% 3��haarС����
wpt = wpdec(x,3,'haar');
%���Ż�
T=besttree(wpt);
% С�����ṹ
plot(wpt);
%haarС�����µ���ƽ��
wpviewcf(wpt,1);
