%װ�زɼ����ź�leleccum.mat
load leleccum;
%���ź��е�1160����1235�������㸳��s
index=1160:1235;
s=leleccum(index);
%����ԭʼ�ź�
figure(1);
plot(index,s);
xlabel('������� n');
ylabel('��ֵ A');

%��db3С������5��ֽ�
[c,l]=wavedec(s,5,'db3');
%�ع���1-5��ƽ��ź�
a5 = wrcoef('a',c,l,'db3',5);
a4 = wrcoef('a',c,l,'db3',4);
a3 = wrcoef('a',c,l,'db3',3);
a2 = wrcoef('a',c,l,'db3',2);
a1 = wrcoef('a',c,l,'db3',1);
%�ع���1-5��ϸ���ź�
d5 = wrcoef('d',c,l,'db3',5);
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%��ʾϸ���ź�
figure(2)
subplot(3,1,1);
plot(index,d3,'LineWidth',2);
ylabel('d3');
subplot(3,1,2);
plot(index,d2,'LineWidth',2);
ylabel('d2');
subplot(3,1,3);
plot(index,d1,'LineWidth',2);
ylabel('d1');
xlabel('������� n');
%���������
%%����1-3��ϸ���ź�Ϊ��
s0=a5+d5+d4;
%�����ع��ź�
figure(3);
plot(index,s0);
xlabel('������� n');
ylabel('��ֵ A');
