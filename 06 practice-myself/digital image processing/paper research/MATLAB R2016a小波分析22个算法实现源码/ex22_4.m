% ����chess�ź�
load chess
% �ֱ𱣴���DCT������С�������ı任ϵ��
blur1=X;
blur2=X;
% ��ԭͼ������ά��ɢ���ұ任
ff1=dct2(X);
% �Ա任�����Ƶ����BUTTERWORTH�˲�
for i=1:256
   for j=1:256
      ff1(i,j)=ff1(i,j)/(1+((i*j+j*j)/8192)^2);
   end
end
% �ؽ��任���ͼ��
blur1=idct2(ff1);
% ��ͼ����2��Ķ�άС���ֽ�
[c,l]=wavedec2(X,2,'db3');
csize=size(c);
% �Ե�Ƶϵ�����зŴ��������Ƹ�Ƶϵ��
for i=1:csize(2);
   if(c(i)>300)
      c(i)=c(i)*2;
   else
      c(i)=c(i)/2;
   end
end
% ͨ��������С��ϵ���ؽ�ͼ��
blur2=waverec2(c,l,'db3');
% ��ʾ����ͼ��
subplot(221);
image(wcodemat(X,192));
colormap(gray(256));
title('ԭʼͼ��','fontsize',8);
subplot(223);
image(wcodemat(blur1,192));
colormap(gray(256));
title('����DCT�����ۻ�ͼ��','fontsize',8);
subplot(224);
image(wcodemat(blur2,192));
colormap(gray(256));
title('����С�������ۻ�ͼ��','fontsize',8);
