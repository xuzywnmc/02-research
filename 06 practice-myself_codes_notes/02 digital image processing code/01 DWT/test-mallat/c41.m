%����matlabʵ��С���ֽ����ع������㷨
%clc;clear
wname='db3';
randn('seed',531316785);
s=2+kron(ones(1,8),[1,-1])+((1:16).^2)/32+0.2*randn(1,16);
figure;
plot(s);title('(a) ԭʼͼ��');

%����db3С����ԭʼ�źŽ��ж��߶ȷֽ�
%ʹ��С���ֽ⺯��dwt
[cA1,cD1]=dwt(s,wname);
figure;plot(cA1);title('(b) ����ϵ��cA1');
figure;plot(cD1);title('(c) ����ϵ��cD1');

[cA2,cD2]=dwt(cA1,wname);
figure;plot(cA2);title('(d) ����ϵ��cA2');
figure;plot(cD2);title('(e) ����ϵ��cD2');

[Lo_R,Hi_R]=wfilters(wname,'r');
ss=idwt(cA2,cD2,Lo_R,Hi_R);
sss=idwt(ss,cD1,Lo_R,Hi_R);
%������ع��ź���ԭʼ�źŵ����
err=norm(s-sss)
figure;plot(sss);title('(f) �ع���ԭʼ�ź�');
xlabel(['������=',num2str(err)]);