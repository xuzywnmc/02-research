% װ���ź�
load noisdopp;
x=noisdopp
% ��db1С�������ź�x�ֽ⵽������
wpt=wpdec(x,3,'db1');
plot(wpt);% ��С�������ṹ��ͼ��
% �ڵڶ������С������
[nwpt,rn]=wpcutree(wpt,2);% 2��ָ�ڶ���
plot(nwpt);% ��С�������ṹ��nwpt����ͼ��
disp('��ʼ���о����������������ţ�')
rn
