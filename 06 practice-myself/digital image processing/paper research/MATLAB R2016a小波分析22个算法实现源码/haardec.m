function y=haardec(c,h)
% haardec 1-D haar decompose program
% y=haardec(c,l)
y=c;
sqrt2=sqrt(2);
h=h/2;
for i=1:h
    y(i)=(c(2*i-1)+c(2*i))/sqrt2;
    y(h+i)=(c(2*i-1)-c(2*i))/sqrt2;
end
