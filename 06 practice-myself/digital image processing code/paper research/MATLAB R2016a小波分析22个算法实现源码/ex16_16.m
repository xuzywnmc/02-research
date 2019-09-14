% 装载实际信号
load vonkoch;
vonkoch=vonkoch(1:510);
lv=length(vonkoch);

subplot(311),plot(vonkoch);title('被分析信号');
set(gca,'Xlim',[0 510])
% 执行离散5层sym2小波变换
% 层数1～5分别对应尺度2,4,8,16 and 32
[c,l]=wavedec(vonkoch,5,'sym2');
% 扩展离散小波系数进行画图
% 层数1～5分别对应尺度2,4,8,16 and 32
cfd=zeros(5,lv);
for k=1:5
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',lv);
end

cfd=cfd(:);
I=find(abs(cfd)<sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,5,lv);

% 画出离散系数
subplot(312),colormap(pink(64));
img=image(flipud(wcodemat(cfd,64,'row')));
set(get(img,'parent'),'YtickLabel',[]);
title('离散变换，系数绝对值.');
ylabel('层数');
% 执行连续小波sym2变换，尺度从1～32
subplot(313);
ccfs=cwt(vonkoch,1:32,'sym2','plot');
title('离散变换，系数绝对值.');
colormap(pink(64));
ylabel('尺度');
