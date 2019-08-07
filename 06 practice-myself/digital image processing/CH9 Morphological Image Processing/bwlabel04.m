%��ע���ӷ���ʹ��
% 8�ڽ�����λ�� Ȼ����б�ע ���ƽ��ֵ�͵õ��˷���ͼ�����������
f=imread('./image/g6.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ');

[L,n]=bwlabel(f);
%conn���� Ĭ��ֵ��8 Ҳ����8���� num�����ӷ��������� L�Ǳ�Ǿ���
[r,c]=find(L==3);
%find�Ƿ�����������λ�� r��������λ�� c��������λ��
rbar=mean(r);
cbar=mean(c);
subplot(2,2,2);
imshow(f,[]);
title('Subplot 2: ԭͼ');

 hold on
%  ������ǰ�������еĻ�ͼ���Ӷ�ʹ����ӵ��������еĻ�ͼ����ɾ�����л�ͼ��
%  �»�ͼ������������
%  ColorOrder �� LineStyleOrder ����ʹ�ú�������ɫ�����͡�
for k=1:n
    [r,c]=find(L==k);
    rbar=mean(r);
    cbar=mean(c);
    plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
    plot(cbar,rbar,'*','MarkerEdgeColor','w');
end
    