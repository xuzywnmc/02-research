function B=pixeldup(A,m,n)%pixeldup�����ظ����صģ���ˮƽ������m�����ڴ�ֱ������n����m��n����Ϊ������nû�и�ֵĬ��Ϊm
%��������������
if nargin<2
    error('At least two inputs are required.');
end
if nargin==2
    n=m;
end
u=1:size(A,1);%����һ����������������Ԫ�صĸ���ΪA������
%����������ÿ��Ԫ��m��
m=round(m);%��ֹmΪ������
u=u(ones(1,m),:);
u=u(:);
%�ڴ�ֱ�����ظ�����
v=1:size(A,2);
n=round(n);
v=v(ones(1,n),:);
v=v(:);
B=A(u,v);
