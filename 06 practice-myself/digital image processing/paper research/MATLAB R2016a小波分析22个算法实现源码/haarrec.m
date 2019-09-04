function y=haarrec(x,h)
% haarrec 1-D haar reconstruct program
c=x;
h1=h/2;
for i=1:h1
    y(2*i-1)=(c(i)+c(h1+i))/sqrt(2);
    y(2*i)=(c(i)-c(h1+i))/sqrt(2);
end
