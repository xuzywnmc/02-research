%װ�زɼ����ź�leleccum.mat
load leleccum;
%���ź��е�3600����3700�������㸳��s
index=1575:1720;
s=leleccum(index);
%����ԭʼ�ź�
figure(1);
plot(index,s);
xlabel('������� n');
ylabel('��ֵ A');
%��db3С������5��ֽ�
[c,l]=wavedec(s,5,'db3');
%�ع���1-5��ƽ�ϵ��.
a5 = wrcoef('a',c,l,'db3',5);
a4 = wrcoef('a',c,l,'db3',4);
a3 = wrcoef('a',c,l,'db3',3);
a2 = wrcoef('a',c,l,'db3',2);
a1 = wrcoef('a',c,l,'db3',1);
%��ʾ�ƽ�ϵ��
figure(2)
subplot(5,2,1);
plot(index,a5,'LineWidth',2);
ylabel('a5');
subplot(5,2,3);
plot(index,a4,'LineWidth',2);
ylabel('a4');
subplot(5,2,5);
plot(index,a3,'LineWidth',2);
ylabel('a3');
subplot(5,2,7);
plot(index,a2,'LineWidth',2);
ylabel('a2');
subplot(5,2,9);
plot(index,a1,'LineWidth',2);
ylabel('a1');
xlabel('������� n');
%�ع���1-5��ϸ��ϵ��
d5 = wrcoef('d',c,l,'db3',5);
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%��ʾϸ��ϵ��
subplot(5,2,2);
plot(index,d5,'LineWidth',2);
ylabel('d5');
subplot(5,2,4);
plot(index,d4,'LineWidth',2);
ylabel('d4');
subplot(5,2,6);
plot(index,d3,'LineWidth',2);
ylabel('d3');
subplot(5,2,8);
plot(index,d2,'LineWidth',2);
ylabel('d2');
subplot(5,2,10);
plot(index,d1,'LineWidth',2);
ylabel('d1');
xlabel('������� n');
