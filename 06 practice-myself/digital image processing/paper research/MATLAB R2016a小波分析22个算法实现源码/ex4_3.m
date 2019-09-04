% װ��һԭʼ��һά�ź�
load leleccum;s=leleccum(1:3920);
ls=length(s);
% ����ԭʼ����ͼ
figure(1);
subplot(511);plot(s);
ylabel('s');
title('ԭʼ�ź�s�����߶ȷֽ�ĵ�Ƶϵ��ca1�͸�Ƶϵ��cd1');
% ��С��db1���е��߶�һά�ֽ�
[ca1,cd1]=dwt(s,'db1');
% �����ֽ��ĵ�Ƶϵ��ca1�͸�Ƶϵ��cd1
subplot(523);plot(ca1);
ylabel('ca1');
subplot(524);plot(cd1);
ylabel('cd1');
% �ֱ�Ե�Ƶϵ��ca1�͸�Ƶϵ��cd1�����ع�
a1=upcoef('a',ca1,'db1',1,ls);
d1=upcoef('d',cd1,'db1',1,ls);
% �ֱ𻭳��ع����Ƶ���ֺ͸�Ƶ���ֵĲ���ͼ
figure(2);
subplot(511);plot(a1);
ylabel('a1');
title('���߷ֽ�ĵ�Ƶ�ع��źš���Ƶ�ع��źż��ϳ��ع��ź�')
subplot(512);plot(d1);
ylabel('d1')
% ����a1+d1����ͼ������s�ķֽ�ϵ��ֱ�ӽ����ع�
a0=idwt(ca1,cd1,'db1',ls);
subplot(513);plot(a0);
ylabel('a1+d1');
% ��db1С�����źŽ�������ֽ�
[c,l]=wavedec(s,3,'db1');
% ��С���ֽ�ṹ[c,l]����ȡ��Ƶϵ��
ca3=appcoef(c,l,'db1',3);
% ��С���ֽ�ṹ[c,l]����ȡ��1��2��3��ĸ�Ƶϵ��
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd1=detcoef(c,l,1);
% �ֱ𻭳�ԭʼ�źš���Ƶϵ���͸�Ƶϵ���Ĳ���
figure(3);
subplot(511);plot(s);
ylabel('s');
title('ԭʼ�źż�����ֽ�ĸ���ֽ�ϵ��');
subplot(589);plot(ca3);
ylabel('ca3');
subplot(5,8,17);plot(cd3);
ylabel('cd3');
subplot(5,4,13);plot(cd2);
ylabel('cd2');
subplot(5,2,9);plot(cd1);
ylabel('cd1');
% �Ե�3��ĵ�Ƶϵ�������ع�
a3=wrcoef('a',c,l,'db1',3);
% ��С���ֽ�ṹ[c,l]����ȡ��1��2��3��ĸ�Ƶϵ�������ع�
d3=wrcoef('d',c,l,'db1',3);
d2=wrcoef('d',c,l,'db1',2);
d1=wrcoef('d',c,l,'db1',1);
% ��������ϵ���ع���Ĳ���ͼ
figure(4);
subplot(511);plot(ca3);
ylabel('ca3');
title('����ֽ�ϵ�����ع�ͼ���ϳ��ع�ͼa0');
subplot(512);plot(cd3);
ylabel('cd3');
subplot(513);plot(cd2);
ylabel('cd2');
subplot(514);plot(cd1);
ylabel('cd1');
% ��С���ֽ�ṹ[c,l]�����ع�
a0=waverec(c,l,'db1');
subplot(515);plot(a0);
ylabel('a0');
