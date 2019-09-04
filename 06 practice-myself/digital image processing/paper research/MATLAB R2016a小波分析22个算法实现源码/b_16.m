clear all;
x=linspace(0,2*pi,60);
y=sin(x);
z=cos(x);
t=sin(x)./(cos(x)+eps);
c=cos(x)./(sin(x)+eps);
subplot(2,2,1);          %ѡ��2��2�����еĵ�1����
stairs(x,y);
title('sin(x)-1');axis([0,2*pi,-1,1]);
subplot(2,1,2);            %ѡ��2��1�����еĵ�2����
stem(x,y);
title('sin(x)-2');axis([0,2*pi,-1,1]);
subplot(4,4,3);            %ѡ��4��4�����еĵ�3����
plot(x,y);
title('sin(x)');axis([0,2*pi,-1,1]);
subplot(4,4,4);            %ѡ��4��4�����еĵ�4����
plot(x,z);
title('cos(x)');axis([0,2*pi,-1,1]);
subplot(4,4,7);            %ѡ��4��4�����еĵ�7����
plot(x,t);
title('tangent(x)');axis([0,2*pi,-40,40]);
subplot(4,4,8);            %ѡ��4��4�����еĵ�8����
plot(x,c);
title('cotangent(x)');axis([0,2*pi,-40,40]);
