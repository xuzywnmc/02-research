%������������Ƶ��
fb = 1.5; fc = 1;
% ������Ч֧�ź�����
lb = -8; ub = 8; n = 1000;
% ���㸴MorletС��cmor1.5-1
[psi,x] = cmorwavf(lb,ub,n,fb,fc);
% ������MorletС��
figure;
plot(psi);
a=[1,2,3,4,5,6,7,8,9];
b=cumsum(a);
y = wkeep1(a,5)