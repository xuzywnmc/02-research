load detfingr;
% �����ɫӳ���ĳ��ȣ��Ա�����ת��
nbc=size(map,1);
% ��ȱʡ��ʽ���ͼ���ȫ����ֵ
[thr,sorh,keepapp]=ddencmp('cmp','wv',X);
thr
% ��ͼ������ȫ����ֵ
[xd,cxd,lxd,perf0,perfl2]=wdencmp('gbl',X,'bior3.5',3,thr,sorh,keepapp);
% ��bior.3.5С����ͼ���������ֽ�
[c,s]=wavedec2(X,3,'bior3.5');
% ָ��Birge-Massart�����еľ���ϵ��
alpha=1.5;m=2.7*prod(s(1,:));
% ���ݸ���С��ϵ��ȷ���ֲ���ֵ
[thr1,nkeep1]=wdcbm2(c,s,alpha,m);
% ��ԭͼ�����÷ֲ���ֵ
[xd1,cxd1,sxd1,perf01,perfl21]=wdencmp('lvd',c,s,'bior3.5',3,thr1,'s');
thr1
% ����ɫӳ���ת��Ϊ�Ҷ�ӳ���
colormap(pink(nbc)); 
subplot(221);
image(wcodemat(X,nbc));
title('ԭʼͼ��'); 
subplot(222);
image(wcodemat(xd,nbc));
title('ȫ����ֵ��ѹ��ͼ��');
xlabel(['�����ɷ�',num2str(perfl2),'%','��ϵ���ɷ�',num2str(perf0),'%']);
subplot(223);
image(wcodemat(xd1,nbc));
title('�ֲ���ֵ��ѹ��ͼ��');
xlabel(['�����ɷ�',num2str(perfl21),'%','��ϵ���ɷ�',num2str(perf01),'%']);
