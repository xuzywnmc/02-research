%װ�ز���ʾԭʼͼ��
load julia;
subplot(2,2,1);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square;

%��ͼ���м�������
init=2055615866;
randn('seed',init);
X1=X+10*randn(size(X));
subplot(2,2,2);
image(X1);
colormap(map);
title('����ͼ��');
axis square;

%����С���������봦��
thr=10;sorh='s';
crit='shannon';
keepapp=0;
X2=wpdencmp(X1,sorh,3,'sym4',crit,thr,keepapp);

%����������ͼ��
subplot(2,2,3);
image(X2);
colormap(map);
title('ȫ����ֵ����ͼ��');
axis square;

%��ͼ�����ƽ����������ǿ����Ч������ֵ�˲���
for i=2:175;
    for j=2:259
        Xtemp=0;
        for m=1:3
            for n=1:3
                Xtemp=Xtemp+X2(i+m-2,j+n-2);
            end
        end
        Xtemp=Xtemp/9;
        X3(i,j)=Xtemp;
    end
end

%��ʾƽ�����
subplot(2,2,4);
image(X3);
colormap(map);
title('ƽ�����ͼ��');
axis square;
