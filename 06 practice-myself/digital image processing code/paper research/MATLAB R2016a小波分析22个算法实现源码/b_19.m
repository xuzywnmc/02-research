clear all;
theta=0:pi/20:2*pi;
rho=sin(theta);
[X,Y]=meshgrid(theta,rho);
Z=Y.*X;
[X,Y,Z]=pol2cart(X,Y,Z);
mesh(X,Y,Z);
set(gcf,'color','w');     %����ͼ�α�����ɫΪ��ɫ
