clear                              %�����ǰ������
load  nearbrk;                      %����ԭʼ�źŵĲ�������
whos;                             %��ʾ���ݵĻ����ź�
figure(1);
plot(nearbrk)
xlabel('ʱ��');ylabel('��ֵ');     %�Զ���������
title('Ƶ��ͻ���ź�');              %�Զ�������
figure(2);
f=fft(nearbrk);                      %���źŽ��и���Ҷ�任
plot(abs(f));                        %��ʾ�������ź�ͼ��
title('����Ҷ�任����ź�ʾ��ͼ')    %�Զ������������н�������ʾ��
figure(3);
[d,a]=wavedec(nearbrk,3,'db5');                %��ԭʼ�źŽ���3��С���ֽ�
a3=wrcoef('a',d,a,'db5',3);                    %�ع�3�����ϵ��
d3=wrcoef('d',d,a,'db5',3);                    %�ع�1�㡫3��ϸ��ϵ��  
d2=wrcoef('d',d,a,'db5',2);   
d1=wrcoef('d',d,a,'db5',1);   
subplot(411);plot(a3);ylabel('�����ź�a3');   %��ʾ����С��ϵ��
title('С���ֽ��ʾ��ͼ');
subplot(412);plot(d3);ylabel('ϸ���ź�d3');
subplot(413);plot(d2);ylabel('ϸ���ź�d2');
subplot(414);plot(d1);ylabel('ϸ���ź�d1');
xlabel('ʱ��'); 
