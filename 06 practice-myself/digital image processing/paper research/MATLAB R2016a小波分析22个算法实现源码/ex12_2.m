load noiswom
[swa,swh,swv,swd]=swt2(X,3,'db1');
% ʹ��db1С����noiswomͼ���������С���ֽ�
mzero=zeros(size(swd));
A=mzero;
A(:,:,3)=iswt2(swa,mzero,mzero,mzero,'db1');
% ʹ��iswt2���˲������ܣ��ؽ���3��Ľ���ϵ����Ϊ�˱���iswt�ĺ�
% �����㣬ע�����ؽ������У�Ӧ��֤��������ϵ��Ϊ�㡣
H=mzero;V=mzero;D=mzero;
for i=1;3
swcfs=mzero;swcfs(:,:,i)=swh(:,:,i);
H(:,:,i)=iswt2(mzero,swcfs,mzero,mzero,'db1');
swcfs=mzero;swcfs(:,:,i)=swv(:,:,i);
V(:,:,i)=iswt2(mzero,mzero,swcfs,mzero,'db1');
swcfs=mzero;swcfs(:,:,i)=swh(:,:,i);
H(:,:,i)=iswt2(mzero,mzero,mzero,swcfs,'db1');
end
% �ֱ��ؽ�1~3���ĸ���ϸ��ϵ����ͬ�����ؽ�ĳһ���յ�ʱ��Ҫ������ϵ��Ϊ0
A(:,:,2)=A(:,:,3)+H(:,:,3)+V(:,:,3)+D(:,:,3);
A(:,:,1)=A(:,:,2)+H(:,:,2)+V(:,:,2)+D(:,:,2);
% ʹ�õ��Ƶķ���������1��͵�2�����ϵ��
colormap(map)
kp=0;
for i=1:3
subplot(3,4,kp+1),image(wcodemat(A(:,:,i),192));
title(['��',num2str(i),'�����ϵ��ͼ��'],'fontsize',6)
subplot(3,4,kp+2),image(wcodemat(H(:,:,i),192));
title(['��',num2str(i),'��ˮƽϸ��ϵ��ͼ��'],'fontsize',6)
subplot(3,4,kp+3),image(wcodemat(V(:,:,i),192));
title(['��',num2str(i),'����ֱϸ��ϵ��ͼ��'],'fontsize',6)
subplot(3,4,kp+4),image(wcodemat(D(:,:,i),192));
title(['��',num2str(i),'��Խ�ϸ��ϵ��ͼ��'],'fontsize',6)
kp=kp+4;
end
% ����ͨ���ֹ������ؽ��ĸ���С��ϵ��ͼ��
err=norm(A(:,:,2)-swa(:,:,2))
% ����������㷨�ؽ��ĵ�2�����ϵ���ͷֽ�ϵ��֮������
