 clear all;
t = 0:0.5:10;    % ʱ������
s = 0.05+i;      % ��ת��
Z = exp(-s*t);   % ����˥��ָ��
feather(Z)      %��ëͼ
