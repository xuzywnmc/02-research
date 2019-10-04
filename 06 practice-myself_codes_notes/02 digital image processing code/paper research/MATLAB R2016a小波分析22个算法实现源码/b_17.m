clear all;
x=0.001:0.01*pi:2*pi;
y=log10(x);
subplot(2,2,1);plot(x,y);
xlabel('(a)用plot函数绘制log10x函数曲线');
subplot(2,2,2);semilogx(x,y,'-s')
xlabel('(b)用semilogx函数绘制log10x函数曲线');
subplot(2,2,3);semilogy(x,y,'-o')
xlabel('(c)用semilogy函数绘制log10x函数曲线');
subplot(2,2,4);loglog(x,y,'-p')
xlabel('(d)用loglog函数绘制log10x函数曲线');
