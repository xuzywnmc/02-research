% �źŵĸ���Ҷ�任
load freqbrk; % װ��Ҫ�������ź�
s=freqbrk;
ls=length(s);
subplot(6,1,1);plot(s);title('ԭʼ�źŵ�ʱ��ͼ');
% ���ź�s����FFT�任
fs=fft(s,1024); % ��s�ź���ȡ1024���㣬����s�в�����������油��
fs=abs(fs); % ��FFT��ĸ�����abs����ģ�Ĵ�С�����ص�ֵ�Ǹ�����ģ
subplot(6,1,2);plot(fs);
ylabel('FFT');grid;
% �ź���db1С���ֽ⵽��������Ƶ������
[c,l]=wavedec(s,3,'db1'); % ��db1С���ֽ��źŵ�������
% �Էֽ�ṹ[c,l]�ĵ������Ƶ���ֽ����ع�
a3=wrcoef('a',c,l,'db1',3);
subplot(6,1,3);plot(a3);ylabel('a3');
% �Էֽ�ṹ[c,l]�еĸ����Ƶ���ֽ����ع�
for i=1:3
    decmp=wrcoef('d',c,l,'db1',4-i);
    subplot(6,1,i+3);
    plot(decmp);
    ylabel(['d',int2str(4-i)]);
end
