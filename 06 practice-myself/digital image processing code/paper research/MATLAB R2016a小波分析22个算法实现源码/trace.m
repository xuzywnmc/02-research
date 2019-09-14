function trace(vm,vd);
zm=i;% 人的位置
zd=8+5i; % 狗的位置
% vm=3; % 人的速度
% vd=3.5; % 狗的速度
dt=0.02; % 时间间隔
A=0; % 设置人运动的方向
pm=plot(zm,'ko'); % 绘制人的位置
hold on;
pd=plot(zd,'k');% 绘制狗运动的轨迹
while abs(zm(end)-zd(end))>0.01; % 循环计算狗的运动轨迹
    At=angle(zm-zd(end)); % 计算狗当前运动的方向
    zd=[zd,zd(end)+exp(i*At)*vd*dt]; % 计算狗在下一时刻的位置
    zm=zm+exp(i*A)*vm*dt; % 计算下一时刻人的位置
    set(pm,'xdata',real(zm),'ydata',imag(zm)); % 更新人的位置
    set(pd,'xdata',real(zd),'ydata',imag(zd)); % 更新狗的运动轨迹
    pause(0.2); % 暂停0.2秒来显示动画效果
end
axis([0,max(real(zd)),0,5]); % 设置坐标轴范围
