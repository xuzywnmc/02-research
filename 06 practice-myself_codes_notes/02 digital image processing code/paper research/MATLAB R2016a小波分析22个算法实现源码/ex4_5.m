x=0:0.05:6*pi;
s=sin(x)+sin(10*x)+sin(100*x); % ����һ�����ҵ����ź�
figure(1);
subplot(6,2,1);plot(s);
title('ԭʼ�ź�������Ƶ����');
ylabel('s');
subplot(6,2,2);plot(s);
title('ԭʼ�ź�������Ƶ����');
ylabel('s');
[c,l]=wavedec(s,5,'db3'); % ��db3С���ֽ��źŵ������
% �Էֽ�ṹ[c,l]�и���Ƶ���ֽ����ع�������ʾ���
for i=1:5
    decmp=wrcoef('a',c,l,'db3',6-i);
    subplot(6,2,2*i+1);
    plot(decmp);
    ylabel(['a',num2str(6-i)]);
end
% �Էֽ�ṹ[c,l]�и���Ƶ���ֽ����ع�������ʾ���
for i=1:5
    decmp=wrcoef('d',c,l,'db3',6-i);
    subplot(6,2,2*i+2);
    plot(decmp);
    ylabel(['d',num2str(6-i)]);
end
% ����d1�ķŴ���ͼ
figure(2);
d1=wrcoef('d',c,l,'db3',1);
subplot(411);plot(d1(1:100));
