% ��Ƶ�ź���1��6��ϵ�����
cfs=[1];
mi=12;ma=30; % db6С���˲��������
rec=upcoef('d',cfs,'db6',1);
figure(2)
subplot(611),plot(rec(3:12));
for i=2:6
    rec=upcoef('d',cfs,'db6',i);   
    subplot(6,1,i),plot(rec(mi*2^(i-2):ma*2^(i-2)))
end
subplot(611)
title(['��Ψһ��ϵ���ӳ߶�1��6��õĵ�Ƶ�ź�'])
