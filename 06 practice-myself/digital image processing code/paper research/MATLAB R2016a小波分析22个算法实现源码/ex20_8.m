% װ���ź�
load noisdopp;
x=noisdopp
% ��db2С�������ź�x�ֽ⵽�ڶ��㣬��shannon����Ϊ�ر�׼
t=wpdec(x,2,'db1','shannon');
% ����С�����ֽ����Ľ��
nodes=allnodes(t);
% ��ȡ��ʼС�����ֽ����ݽṹ�и�������ֵ
disp('��ʼ��������ֵ��');
ent=read(t,'ent',nodes)
% ���ı����ṹ�����ݽṹ��ѡ��'threshold'�ر�׼����ֵΪ0.5�������½�����ֵ
d=entrupd(t,'threshold',0.5);
% ��ȡ���º�С�����ֽ����ݽṹ�и�������ֵ
disp('���º��������ֵ��');
nent=read(t,'ent')
