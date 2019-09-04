function [xn]=idfs(Xk,N)
% ������ɢFourier��任
% ���÷�ʽ��[xn]=idfs(Xk,N)
% xn�������Fourier��任������У���ţ�0<=n=<N-1
% Xk���������飬��ţ�0<=n=<N-1
% N��Xk��Ԫ�ظ���
n=[0:1:N-1];            % ������������
k=[0:1:N-1];            % Ƶ����������
WN=exp(-j*2*pi/N);     % Wn����
nk=n'*k;               % ����N*N�ľ���nk
WNnk=WN.^(-nk);        % ��ɢFourier�任����
xn=(Xk*WNnk)/N;          % Fourier�任ϵ��
