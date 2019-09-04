clear all;
x=[-0.196 0.146 0.487 1.778 6.031 14.897 15.000 17.524 9.138 2.971 1.652 ...
    -0.234 0.034 -1.789 -0.128];
thr=thselect(x,'rigrsure');              %求阈值
y=wthresh(x,'h',thr);                    %作用阈值
plot(x);
grid on; hold on;
plot(y,'-o');
wname='sym6';
lev=5;
[c,l]=wavedec(x,lev,wname);               %小波分解
sigma=wnoisest(c,l,1);
alpha=1.8;
thr=wbmpen(c,l,sigma,alpha);
keep=1;
xd=wdencmp('gbl',c,l,wname,lev,thr,'s',keep);    %消噪
plot(xd,'-*');
legend('原始数据','消噪方法1','消噪方法2');
xlabel('时间');ylabel('信号强度');
