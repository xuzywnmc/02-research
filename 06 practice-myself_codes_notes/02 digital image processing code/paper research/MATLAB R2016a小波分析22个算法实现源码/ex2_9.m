% �����ź�
load julia
% ����ɫ��������
nbc=size(map,1);
% �õ��źŵ���ֵ������������С�����Ż���׼
[thr,sorh,keepapp,crit]=ddencmp('cmp','wp',X) 
% ͨ�����ϵõ��Ĳ������źŽ���ѹ��
[xd,treed,perf0,perfl2]=wpdencmp(X,sorh,4,'sym4',crit,thr*2,keepapp);
% ����������Ϊpink������
colormap(pink(nbc));
subplot(121);
image(wcodemat(X,nbc));
title('ԭʼͼ��'); 
subplot(122);
image(wcodemat(xd,nbc));
title('ȫ����ֵ��ѹ��ͼ��'); 
xlabel(['�����ɷ�',num2str(perfl2),'%','��ϵ���ɷ�',num2str(perf0),'%']);
plot(treed);
