% װ���ź�
load noisdopp;
x=noisdopp
% ��db1С�������ź�x�ֽ⵽������
wpt=wpdec(x,3,'db1');
% ��Ĭ�ϵģ�shannon)�طֽ�С����[3��0]
wpt=wpsplt(wpt,[3,0]);
% ��С�������Ľṹwpt��ͼ��
plot(wpt);
% ������Ѳ�ε���
blt=bestlevt(wpt);
% ������Ѳ�ε����ṹblt��ͼ��
plot(blt);
