function [Xk]=dfs(xn,N)
% ������ɢFourier���е�ϵ��
% ���÷�ʽ��[Xk]=dfs(xn,N)
% Xk����ɢFourier�任��ϵ������ţ�0<=k<=N-1
% xn��ȡ�����źŵ�һ�����ڣ���ţ�0<=k<=N-1
% N��xn�����ݸ���
n=[0:1:N-1];            % ������������
k=[0:1:N-1];            % Ƶ����������
WN=exp(-j*2*pi/N);      % Wn����
nk=n'*k;                % ����N*N�ľ���nk
WNnk=WN.^nk;            % ��ɢFourier�任����
Xk=xn*WNnk;             % Fourier�任ϵ��
