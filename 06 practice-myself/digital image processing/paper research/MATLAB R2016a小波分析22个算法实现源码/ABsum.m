function S=ABsum(A,B)
% ABsum函数用于实现两个矩阵相加
[m1,n1]=size(A);
[m2,n2]=size(B);
%如果A,B中有一个为空矩阵或两矩阵的维数不等，即返回空矩阵，并给出警告信息
if isempty(A)
    warning('A为空矩阵！');
    S=[];
    return;
elseif isempty(B)
    warning('B为空矩阵！');
    S=[];
    return;
elseif m1~=m2|n1~=n2
    warning('两矩阵的维数不等！');
    S=[];
    return;
else
    for i=1:m1
        for j=1:n1
            S(i,j)=A(i,j)+B(i,j);
        end
    end
end
