%��Ƶ�ź� 
load quachirp
x=quachirp;
figure(1);
plot(1:length(x),x);
xlabel('������� n');
ylabel('��ֵ A');
% 4��db1С����
wpt = wpdec(x,4,'db1');
% С�����ṹ
plot(wpt);
%db1С�����µ���ƽ��
wpviewcf(wpt,1);
