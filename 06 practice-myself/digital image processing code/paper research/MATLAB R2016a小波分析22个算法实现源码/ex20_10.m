load noisdopp;
x=noisdopp(1:1000);
% ��db1С�����ֽ��ź�x��������
% ����shannon�صı�׼
t=wpdec(x,3,'db1','shannon');
plot(t);% ����С�������ṹ��ͼ��
% ���·ֽ�С������㣨3��0������߸����
wpt=wpsplt(t,[3,0]);
% ��ȼ���wpt=wpsplt(t,7);
plot(wpt);% ����С�������ṹ��ͼ��
