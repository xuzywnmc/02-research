% װ���ź�
load noisdopp;
x=noisdopp
% ��db1С�������ź�x�ֽ⵽������
wpt=wpdec(x,3,'db1');
% ��С�������Ľṹwpt��ͼ��
plot(wpt);
% ����С������
wt=wp2wtree(wpt);
% ��С�������Ľṹwt��ͼ��
plot(wt);
