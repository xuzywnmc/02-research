% װ��ʵ���ź�
load vonkoch;
vonkoch=vonkoch(1:510);
lv=length(vonkoch);

subplot(311),plot(vonkoch);title('�������ź�');
set(gca,'Xlim',[0 510])
% ִ����ɢ5��sym2С���任
% ����1��5�ֱ��Ӧ�߶�2,4,8,16 and 32
[c,l]=wavedec(vonkoch,5,'sym2');
% ��չ��ɢС��ϵ�����л�ͼ
% ����1��5�ֱ��Ӧ�߶�2,4,8,16 and 32
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

% ������ɢϵ��
subplot(312),colormap(pink(64));
img=image(flipud(wcodemat(cfd,64,'row')));
set(get(img,'parent'),'YtickLabel',[]);
title('��ɢ�任��ϵ������ֵ.');
ylabel('����');
% ִ������С��sym2�任���߶ȴ�1��32
subplot(313);
ccfs=cwt(vonkoch,1:32,'sym2','plot');
title('��ɢ�任��ϵ������ֵ.');
colormap(pink(64));
ylabel('�߶�');
