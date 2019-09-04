x=rand(1,200);% 产生一个初始的随机信号
% 计算信号x的shannon熵
e1=wentropy(x,'shannon')
% 计算信号x的对数能量熵
e2=wentropy(x,'log energy')
% 计算信号x的阈值熵，阈值等于0.2
e3=wentropy(x,'threshold',0.2)
% 计算信号x的SURE熵，阈值等于3
e4=wentropy(x,'sure',3)
% 计算信号x的范数熵，范数指数等于1.1
e5=wentropy(x,'norm',1.1)
