M1=laurmat(eye(2,2))
Z=laurpoly(1,1);
M2=laurmat({1 Z;0 1})
% 计算劳伦多项式
P=M1*M2
d=det(P)
