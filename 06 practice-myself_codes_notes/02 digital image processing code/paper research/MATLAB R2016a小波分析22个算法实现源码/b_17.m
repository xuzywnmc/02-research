clear all;
x=0.001:0.01*pi:2*pi;
y=log10(x);
subplot(2,2,1);plot(x,y);
xlabel('(a)��plot��������log10x��������');
subplot(2,2,2);semilogx(x,y,'-s')
xlabel('(b)��semilogx��������log10x��������');
subplot(2,2,3);semilogy(x,y,'-o')
xlabel('(c)��semilogy��������log10x��������');
subplot(2,2,4);loglog(x,y,'-p')
xlabel('(d)��loglog��������log10x��������');
