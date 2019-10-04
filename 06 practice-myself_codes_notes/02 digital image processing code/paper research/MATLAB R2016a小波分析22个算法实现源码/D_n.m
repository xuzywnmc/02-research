function y=D_n(x)
N0=1.554336;  %¸³Öµ£¬x-delta y-D
k=2*pi/(632.8e-9);
B0=k+N0;
ns=1.521145;
eq1=@(y)quadl(@(z)k*sqrt((ns+x.*erfc(z./y)).^2-N0^2),...
    0,y*erfcinv((N0-ns)/x))-pi/4-atan(sqrt((B0^2-k^2)/(k^2*(ns+x)^2-B0^2))-...
    x*(k^2)*(ns+x)/(pi^0.5*y*(k^2*(ns+x)^2-B0^2)^1.5));
y=fzero(eq1,0.000001);
