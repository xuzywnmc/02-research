load noispol; % װ��Ҫ�������ź�
s=noispol; ls=length(s);
[c,l]=wavedec(s,4,'db3'); % ��db3С���ֽ��źŵ����Ĳ�
figure(1);
subplot(5,1,1); plot(s);
title('ԭʼ�źż���db3С���ֽ�������Ƶ�ź��ع�ͼ');
ylabel('s');
% �Էֽ�ṹ[c,l]�и���Ƶ���ֽ����ع�������ʾ���
for i=1:4
    decmp=wrcoef('d',c,l,'db3',5-i);
    subplot(5,1,i+1);
    plot(decmp)
    ylabel(['d',num2str(5-i)]);
end
% ������db1С�����ж��շ���
[c,l]=wavedec(s,4,'db1'); % ��db1С���ֽ��źŵ����Ĳ�
figure(2);
subplot(5,1,1); plot(s);
title('ԭʼ�źż���db1�ֽ�������Ƶ�ź��ع�ͼ');
ylabel('s');
% �Էֽ�ṹ[c,l]�и���Ƶ���ֽ����ع�������ʾ���
for i=1:4
    decmp=wrcoef('d',c,l,'db1',5-i);
    subplot(5,1,i+1);
    plot(decmp);
    ylabel(['d',num2str(5-i)]);
end
