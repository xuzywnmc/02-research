% 当前扩展模式是补零
% 低频信号由1～6层系数获得
cfs=[1];
essup=10;
figure(1)
for i=1:6
    rec=upcoef('a',cfs,'db6',i);
    % essup是重构信号必须的
    % 当j等于essup时，rec(j)非常小
    ax=subplot(6,1,i),h=plot(rec(1:essup));
    set(ax,'xlim',[1 325]);
    essup=essup*2;
end
subplot(611)
title(['尺度1到6,由唯一的系数获得的低频信号'])
