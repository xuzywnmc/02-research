%�������ź� 
load sinper8; 
x = sinper8;
figure(1);
plot(1:length(x),x);
xlabel('������� n');
ylabel('��ֵ A');
% 7��harrС����
% Shannon��. 
wpt = wpdec(x,7,'haar','shannon');
%���Ż�
T=besttree(wpt);
% С�����ṹ
plot(wpt);
%harrС�����µ���ƽ��
wpviewcf(wpt,1);
%���Ż��µ���ƽ��
wpviewcf(T,1);
