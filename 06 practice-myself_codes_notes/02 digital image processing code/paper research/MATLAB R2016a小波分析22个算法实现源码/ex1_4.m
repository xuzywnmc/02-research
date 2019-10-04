% 使用Haar小波，得到相应的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案
els={'p',[-0.125 0.125],0}
lsnew=addlift(lshaar,els);
% 对于简单信号，进行2层LWT
x=1:8;
xDec=lwt(x,lsnew,2)
% 提取尺度为1时的低频系数
ca1=lwtcoef('ca',xDec,lsnew,2,1)
% 重构低频和高频
a1=lwtcoef('a',xDec,lsnew,2,1)
a2=lwtcoef('a',xDec,lsnew,2,2)
d1=lwtcoef('d',xDec,lsnew,2,1)
d2=lwtcoef('d',xDec,lsnew,2,2)
% 检查重构效果
err=max(abs(x-a2-d2-d1))
