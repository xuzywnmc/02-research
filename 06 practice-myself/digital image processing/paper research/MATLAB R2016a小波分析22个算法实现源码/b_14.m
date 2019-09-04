clear all;
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
h = legend('cos_x','sin_x',2);
set(h,'Interpreter','none')
xlabel('x'); ylabel('y');
title('绘制两条曲线');
grid on;        %添加网格线
box off;        %删除框图
