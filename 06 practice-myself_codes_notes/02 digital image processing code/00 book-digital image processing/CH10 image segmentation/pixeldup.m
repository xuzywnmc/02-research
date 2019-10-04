function B=pixeldup(A,m,n)%pixeldup用来重复像素的，在水平方向复制m倍，在垂直方向复制n倍，m，n必须为整数，n没有赋值默认为m
%检查输入参数个数
if nargin<2
    error('At least two inputs are required.');
end
if nargin==2
    n=m;
end
u=1:size(A,1);%产生一个向量，其向量中元素的个数为A的行数
%复制向量中每个元素m次
m=round(m);%防止m为非整数
u=u(ones(1,m),:);
u=u(:);
%在垂直方向重复操作
v=1:size(A,2);
n=round(n);
v=v(ones(1,n),:);
v=v(:);
B=A(u,v);
