clear all;
n = -2.0:.2:2.0;
[X,Y,Z] = peaks(n);
contour(X,Y,Z,10);
[U,V] = gradient(Z,.2);
hold on
quiver(X,Y,U,V)
hold off
