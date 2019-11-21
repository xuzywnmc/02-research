close all 
clc;clear;

t=[0:pi/20:1.25*pi];
r1=1;
r2=2;
x=[r1*cos(t),r2*cos(t(end:-1:1)),r1*cos(t(1))];
y=[r1*sin(t),r2*sin(t(end:-1:1)),r1*sin(t(1))];
x=-0.5:0.1:1;
x1 = [ -0.2, -0.1, -0.1, -0.3, -0.3, -0.25, -0.2, -0.1];
y1 = [ 0.75, 0.45, 0.55, 0.55, 0.7, 0.7, 0.6, 0.45];
z1 = [1, 1, 1, 1, 1, 1, 1, 1];
x2 = [ 0.2, 0.1, 0.1, 0.3, 0.3, 0.25, 0.2, 0.1];
y2 = [ -0.75, -0.45, -0.55, -0.55, -0.7, -0.7, -0.6, -0.45];
z2 = [-1, -1, -1, -1, -1, -1, -1, -1];
y11=-x+0.5;
z=[-2 2];
xx=[x;x];
yy=[y11;y11];
zz=z'*ones(size(x));
CO(:,:,1) = zeros(25); % red
CO(:,:,2) = ones(25).*linspace(0.5,0.6,25); % green
CO(:,:,3) = ones(25).*linspace(0,1,25); % blue
surf(xx,yy,zz,'FaceAlpha',0.5);
axis equal
hold on
y12=-(1.42/0.51)*x+(0.5/0.51);
z=[-2 2];
xx=[x;x];
yy=[y12;y12];
zz=z'*ones(size(x));
surf(xx,yy,zz,'FaceAlpha',0.5);
axis equal
hold on
scatter3(x1,y1,z1,'*r');
hold on
scatter3(x2,y2,z2,'*b');

%%%%%%%%%%%%%%%%%%%%
x=-0.5:0.1:1;
x1 = [ -0.2, -0.1, -0.1, -0.3, -0.3, -0.25, -0.2, -0.1];
y1 = [ 0.75, 0.45, 0.55, 0.55, 0.7, 0.7, 0.6, 0.45];
z1 = [1, 1, 1, 1, 1, 1, 1, 1];
x2 = [ 0.2, 0.1, 0.1, 0.3, 0.3, 0.25, 0.2, 0.1];
y2 = [ -0.75, -0.45, -0.55, -0.55, -0.7, -0.7, -0.6, -0.45];
z2 = [-1, -1, -1, -1, -1, -1, -1, -1];
y11=-x+0.5;
y12=-(1.42/0.51)*x+(0.5/0.51);
figure(1)
plot(x1,y1,'*r',x2,y2,'*b',x,y11,'r',x,y12,'b');
grid
figure(2)
scatter3(x1,y1,z1,'*r');
hold on
scatter3(x2,y2,z2,'*b');
[X,Z]=meshgrid(x);
Y=(0.5-1.42*X)/0.51;
mesh(X,Y,Z);
xlabel('x'),ylabel('y'),zlabel('z');
hold on
% [X,Z]=meshgrid(x);
% Y=0.5-X;
% mesh(X,Y,Z);
% xlabel('x'),ylabel('y'),zlabel('z');