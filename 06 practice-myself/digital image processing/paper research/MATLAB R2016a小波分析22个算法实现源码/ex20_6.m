% װ���ź�
load noisdopp;
x=noisdopp
% ��db1С�������ź�x�ֽ⵽������
wpt=wpdec(x,3,'db1');
% ��Ĭ�ϵģ�shannon���طֽ�С����[3��0]
wpt=wpsplt(wpt,[3,0]);
% ��С�������Ľṹwpt
plot(wpt);
% ���������
[bt,e,n]=besttree(wpt);
% ����������Ľṹbt
plot(bt);
disp('��ʾ��ʼ���ĸ���������ֵ����eΪ��')
e
disp('��ʾ��ʼ���ĸ�����������������nΪ��')
n
