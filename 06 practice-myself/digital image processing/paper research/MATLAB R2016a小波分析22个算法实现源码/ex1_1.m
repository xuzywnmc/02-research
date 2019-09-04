% 使用Haar小波，得到相应的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案
els={'p',[-0.125 0.125],0}
lsnew=addlift(lshaar,els);
% 对于简单图像，尺度为2进行LWT
x=reshape(1:16,4,4);
xDec=lwt2(x,lsnew,2)
% 提取第一层的低频系数
ca1=lwtcoef2('ca',xDec,lsnew,2,1)
% 重构低频和高频
a1=lwtcoef2('a',xDec,lsnew,2,1)
a2=lwtcoef2('a',xDec,lsnew,2,2)
h1=lwtcoef2('h',xDec,lsnew,2,1)
v1=lwtcoef2('v',xDec,lsnew,2,1)
d1=lwtcoef2('d',xDec,lsnew,2,1)
h2=lwtcoef2('h',xDec,lsnew,2,2)
v2=lwtcoef2('v',xDec,lsnew,2,2)
d2=lwtcoef2('d',xDec,lsnew,2,2)
% 检查重构效果
err=max(max(abs(x-a2-h2-v2-d2-h1-v1-d1)))
