load woman;
X1=X;map1=map;
%����ԭʼͼ��
subplot(131);image(X1);colormap(map1);
title('woman');
axis square
load wbarb;
X2=X;map2=map;
for i=1:256
   for j=1:256
      if (X2(i,j)>100)
         X2(i,j)=1.2*X2(i,j);
      else
         X2(i,j)=0.5*X2(i,j);
      end
   end
end
subplot(132);
image(X2);
colormap(map2);
title('wbarb');
axis square
%��С������sym4��X1����2��С���ֽ�
[c1,s1]=wavedec2(X1,2,'sym4');
%�Էֽ�ϵ�����д�����ͻ���������֣�����ϸ�ڲ���
sizec1=size(c1);
for i=1:sizec1(2)
   c1(i)=1.2*c1(i);
end
%��С������sym4��X2����2��С���ֽ�
[c2,s2]=wavedec2(X2,2,'sym4');
%�������С���任���ͼ���ں�
c=c1+c2;
%��Сͼ������
c=0.5*c;
%���ںϵ�ϵ�������ع�
xx=waverec2(c,s1,'sym4');
%�����ںϺ��ͼ��
subplot(133);image(xx);
title('�ں�ͼ��','fontsize',8);
axis square
