clear                              %�����ǰ������
load  cuspamax;                    %����ԭʼ�źŵĲ�������
whos;                              %��ʾ���ݵĻ����ź�
figure(1)
plot(cuspamax)
xlabel('ʱ��');ylabel('��ֵ');     %�Զ���������
title('Ƶ��ͻ���ź�');              %�Զ�������
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
title('��ɢС���任ϵ���ľ���ֵ')
ylabel('����')

figure(3)
ccfs=cwt(cuspamax,1:32,'db6','plot');
title('����С���任ϵ���ľ���ֵ')
colormap(pink(64));
ylabel('�߶�')
xlabel('ʱ��(���߿ռ�)')
