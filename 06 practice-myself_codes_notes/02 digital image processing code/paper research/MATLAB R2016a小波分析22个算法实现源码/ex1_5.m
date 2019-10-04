% 定义劳伦多项式
P=laurpoly([1:3],2);
P=laurpoly([1:3],'dmax',2)
P=laurpoly([1:3],'dmin',2)
% 计算劳伦多项式
Z=laurpoly(1,1)
Q=Z*P
