clear                              %清除以前的数据
load  cuspamax;                    %载入原始信号的波形数据
whos;                              %显示数据的基本信号
figure(1)
plot(cuspamax)
xlabel('时间');ylabel('幅值');     %自定义坐标轴
title('频率突变信号');              %自定义坐标
figure(2)
[c,l]=wavedec(cuspamax,5,'db6');
cfd=zeros(5,1024);
for k=1:5
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',1024)
end
cfd=cfd(:);
I=find(abs(cfd)<sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,5,1024);
colormap(pink(64));
img=image(flipud(wcodemat(cfd,64,'row')));
set(get(img,'parent'),'YtickLabel',[]);
title('离散小波变换系数的绝对值')
ylabel('层数')

figure(3)
ccfs=cwt(cuspamax,1:32,'db6','plot');
title('连续小波变换系数的绝对值')
colormap(pink(64));
ylabel('尺度')
xlabel('时间(或者空间)')
