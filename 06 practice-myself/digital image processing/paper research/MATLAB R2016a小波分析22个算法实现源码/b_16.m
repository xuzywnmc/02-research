clear all;
x=linspace(0,2*pi,60);
y=sin(x);
z=cos(x);
t=sin(x)./(cos(x)+eps);
c=cos(x)./(sin(x)+eps);
subplot(2,2,1);          %选择2×2个区中的第1号区
stairs(x,y);
title('sin(x)-1');axis([0,2*pi,-1,1]);
subplot(2,1,2);            %选择2×1个区中的第2号区
stem(x,y);
title('sin(x)-2');axis([0,2*pi,-1,1]);
subplot(4,4,3);            %选择4×4个区中的第3号区
plot(x,y);
title('sin(x)');axis([0,2*pi,-1,1]);
subplot(4,4,4);            %选择4×4个区中的第4号区
plot(x,z);
title('cos(x)');axis([0,2*pi,-1,1]);
subplot(4,4,7);            %选择4×4个区中的第7号区
plot(x,t);
title('tangent(x)');axis([0,2*pi,-40,40]);
subplot(4,4,8);            %选择4×4个区中的第8号区
plot(x,c);
title('cotangent(x)');axis([0,2*pi,-40,40]);
