syms t v w x;
x=1/2*exp(-2*t)*sym('heaviside(t)');
F=fourier(x);
subplot(211);
ezplot(x);
subplot(212);
ezplot(abs(F));
