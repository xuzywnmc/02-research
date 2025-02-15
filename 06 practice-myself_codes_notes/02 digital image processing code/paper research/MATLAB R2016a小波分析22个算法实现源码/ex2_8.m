load detfingr;
% 求得颜色映射表的长度，以便后面的转换
nbc=size(map,1);
% 用缺省方式求出图像的全局阈值
[thr,sorh,keepapp]=ddencmp('cmp','wv',X);
thr
% 对图像作用全局阈值
[xd,cxd,lxd,perf0,perfl2]=wdencmp('gbl',X,'bior3.5',3,thr,sorh,keepapp);
% 用bior.3.5小波对图像进行三层分解
[c,s]=wavedec2(X,3,'bior3.5');
% 指定Birge-Massart策略中的经验系数
alpha=1.5;m=2.7*prod(s(1,:));
% 根据各层小波系数确定分层阈值
[thr1,nkeep1]=wdcbm2(c,s,alpha,m);
% 对原图像作用分层阈值
[xd1,cxd1,sxd1,perf01,perfl21]=wdencmp('lvd',c,s,'bior3.5',3,thr1,'s');
thr1
% 将颜色映射表转换为灰度映射表
colormap(pink(nbc)); 
subplot(221);
image(wcodemat(X,nbc));
title('原始图像'); 
subplot(222);
image(wcodemat(xd,nbc));
title('全局阈值化压缩图像');
xlabel(['能量成分',num2str(perfl2),'%','零系数成分',num2str(perf0),'%']);
subplot(223);
image(wcodemat(xd1,nbc));
title('分层阈值化压缩图像');
xlabel(['能量成分',num2str(perfl21),'%','零系数成分',num2str(perf01),'%']);
