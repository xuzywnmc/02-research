% ��ǰ��չģʽ�ǲ���
% ��Ƶ�ź���1��6��ϵ�����
cfs=[1];
essup=10;
figure(1)
for i=1:6
    rec=upcoef('a',cfs,'db6',i);
    % essup���ع��źű����
    % ��j����essupʱ��rec(j)�ǳ�С
    ax=subplot(6,1,i),h=plot(rec(1:essup));
    set(ax,'xlim',[1 325]);
    essup=essup*2;
end
subplot(611)
title(['�߶�1��6,��Ψһ��ϵ����õĵ�Ƶ�ź�'])
