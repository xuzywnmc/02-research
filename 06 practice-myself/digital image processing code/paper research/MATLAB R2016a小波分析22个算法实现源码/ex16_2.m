% װ��nossin�ź�
load noissin;
x=noissin;
figure(1);
plot(x);
figure(2);
subplot(121);
% ��db4С����������һά����С���任
c=cwt(x,1:48,'db4','plot');
subplot(122);
% ����ѡ��߶Ⱥ����һά����С���任
c=cwt(x,2:2:128,'db4','plot');
figure(3);
% ʹ�ø�С�������������С���任
c=cwt(x,2:2:128,'cgau4','plot');
