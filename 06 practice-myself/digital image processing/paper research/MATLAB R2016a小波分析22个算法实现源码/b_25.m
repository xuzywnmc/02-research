 clear all;
X = [19.3 22.1 51.6; 34.2 70.3 82.4; 61.4 82.9 90.8; 50.5 54.9 59.1;29.4 36.3 47.0];
x = sum(X);
explode = zeros(size(x));
[c,offset] = max(x);
explode(offset) = 1;      %Ϊ1ʱ��ʾ��������Σ�Ϊ0ʱ��������
h = pie(x,explode); 
colormap summer           %�����ɫЧ��
