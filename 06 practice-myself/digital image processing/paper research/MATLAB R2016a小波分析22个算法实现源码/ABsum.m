function S=ABsum(A,B)
% ABsum��������ʵ�������������
[m1,n1]=size(A);
[m2,n2]=size(B);
%���A,B����һ��Ϊ�վ�����������ά�����ȣ������ؿվ��󣬲�����������Ϣ
if isempty(A)
    warning('AΪ�վ���');
    S=[];
    return;
elseif isempty(B)
    warning('BΪ�վ���');
    S=[];
    return;
elseif m1~=m2|n1~=n2
    warning('�������ά�����ȣ�');
    S=[];
    return;
else
    for i=1:m1
        for j=1:n1
            S(i,j)=A(i,j)+B(i,j);
        end
    end
end
