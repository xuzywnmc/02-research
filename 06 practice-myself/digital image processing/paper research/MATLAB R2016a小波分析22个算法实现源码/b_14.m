clear all;
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
h = legend('cos_x','sin_x',2);
set(h,'Interpreter','none')
xlabel('x'); ylabel('y');
title('������������');
grid on;        %���������
box off;        %ɾ����ͼ
