%exp1.m
clc;
clear;

load data;
plot(dat)   %����ԭ�ź�f(t)
xlabel('t')
ylabel('f(t)')
title('ԭ�ź�f(t)')
 
x=-5:0.1:5
plot(x,psi(x))   %����С��ĸ������(t)
xlabel('t')
ylabel('��(t)')
title('С��ĸ����')

len=length(dat);  
lena=70;   %�߶�a��0��70֮��
a=zeros(1,lena);
wavefactor=zeros(lena,len);   %����С��ϵ������
%˵��С��ϵ����������70 ���������ݳ���1280
diswavefactor=zeros(1,len);   %������ɢ��С��ϵ������

for i=1:lena   %iΪ�߶�����

    for j=1:len
        diswavefactor(j)=psi(j/i);
        %�ȼ���
    end
    for k=1:len   %kΪƽ������
        wavefactor(i,k)=(sum(diswavefactor.*dat))/sqrt(i);   %��С��ϵ��
        diswavefactor=[psi(-1*k/i),diswavefactor(1:len-1)];
    end
end

image(wavefactor)
colormap
xlabel('λ������')
ylabel('�߶�����')
title('����С���任���')

