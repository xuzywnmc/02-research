function [A]=OMPerr(D,X,errorGoal); 
%=============================================
% Sparse coding of a group of signals based on a given 
% dictionary and specified number of atoms to use. 
% input arguments: D - the dictionary
%                  X - the signals to represent
%                  errorGoal - the maximal allowed representation error for
%                  each siganl.
% output arguments: A - sparse coefficient matrix.
%=============================================
[n,P]=size(X);
% X应该是64X62001
[n,K]=size(D);
% 初始D只是64X256
E2 = errorGoal^2*n;
maxNumCoef = n/2;
% A为256X62001
A = sparse(size(D,2),size(X,2));
% P=62001
for k=1:1:P,
    a=[];
    x=X(:,k);
    %先取原图一列 这个是原图一列
    residual=x;
	indx = [];
	a = [];
    %原图每列的平方
	currResNorm2 = sum(residual.^2);
	j = 0;
    while currResNorm2>E2 & j < maxNumCoef,
		j = j+1;
        proj=D'*residual;
        %proj表示字典与原图每一列相乘
        pos=find(abs(proj)==max(abs(proj)));
        pos=pos(1);
        %将得到与原图乘出最大的行数拿出来
        indx(j)=pos;
        a=pinv(D(:,indx(1:j)))*x;
        residual=x-D(:,indx(1:j))*a;
		currResNorm2 = sum(residual.^2);
   end;
   if (length(indx)>0)
       A(indx,k)=a;
   end
end;
return;
