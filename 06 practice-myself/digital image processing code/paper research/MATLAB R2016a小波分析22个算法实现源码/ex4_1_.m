% ����db3С����ԭʼ�źŽ��ж��߶ȷֽ�
% ʹ��С���ֽ⺯��dwt
[cA1,cD1]=dwt(s,wname);
figure;plot(cA1);title('(b) ����ϵ��cA1');
figure;plot(cD1);title('(c) ϸ��ϵ��cD1');
% ��һ�߶��ϵĽ���ϵ���ٴν���С���ֽ�
[cA2,cD2]=dwt(cA1,wname);
figure;plot(cA2);title('(d) ����ϵ��cA2');
figure;plot(cD2);title('(e) ϸ��ϵ��cD2');
