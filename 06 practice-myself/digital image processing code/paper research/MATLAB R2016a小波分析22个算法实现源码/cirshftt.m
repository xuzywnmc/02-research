function y=cirshftt(n,m,N)
% ��N������xѭ����λm����λ����
% ������ʽ��[y]=cirshftt(x,m,N)
% y��ѭ����λ����������
% x����������
% m����λ�Ĳ�����λ��
% N���������еĴ�С
if length(x)>N
    error('N must be>=the length of x')
end
x=[x zeros(1,N-length(x))];
n=[0:1:N-1];
n=mod(n-m,N);
y=x(n+1);
