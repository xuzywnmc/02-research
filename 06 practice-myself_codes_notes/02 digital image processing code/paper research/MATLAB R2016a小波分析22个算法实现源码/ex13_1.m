%װ�زɼ����ź�leleccum.mat
load leleccum;
%���ź��е�2200����3600�������㸳��s
index=2200:3600;
s=leleccum(index);
%����ԭʼ�ź�
figure;
plot(index,s);
title('(a)���������źŲ���');
%��db3С������5��ֽ�
[c,l]=wavedec(s,5,'db3');
%�ع���1-5��ϸ��ϵ��
d5 = wrcoef('d',c,l,'db3',5);
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%��ʾϸ��ϵ��
figure;
plot(index,d3,'LineWidth',2);
title('(b)ϸ���źŲ���d3');
figure;
plot(index,d2,'LineWidth',2);
title('(c)ϸ���źŲ���d2');
figure;
plot(index,d1,'LineWidth',2);
title('(d)ϸ���źŲ���d1');
