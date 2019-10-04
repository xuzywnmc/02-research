function modetest()
% ��ͬС���ڲ�ͬ�ķֽ�ģʽ��3���ֽ����ع�ͼ��
% ͼ��Ϊkids.tif��haarС����per�ֽ�ģʽ
% װ��ͼ��Ϊ�ڰ�����ͼ��X�к��б�װ�ص��źţ�map�к��б�װ�ص�color
imgname='kids.tif';    % ���룺imgname  ͼ���ļ�
wavename='haar';       % wavename  С������
mode='per';
[X,map]=imread(imgname);
deccof=struct('cA',[],'cH',[],'cV',[],'cD',[]);
reccof=struct('RX',[]);
sX=size(X);
nbcol=size(map,1);
X=double(X);
% ����ԭʼͼ��
figure(1);
subplot(241);imshow(uint8(X));colormap(map);
title(strcat('ԭʼͼ��(',wavename,'С��)'),'FontSize',7.5);
ylabel(strcat('3���ֽ����ع���ʾͼ(',mode,'ģʽ)'),'FontSize',7.5);
xlabel(mat2str(sX));
axis square
DX=X;
deccof(1).cA=X;
for i=2:4
    % ��С���������зֽ�
    [deccof(i).cA,deccof(i).cH,deccof(i).cV,deccof(i).cD]=dwt2(DX,wavename,'mode',mode);
    % �������ֽ�ϵ����Ӧ��ͼ��
    subplot(2,4,i);
    imshow([deccof(i).cA/255,deccof(i).cH/255;deccof(i).cV/255,deccof(i).cD/255;]);
    colormap(map);
    title(strcat(int2str(i-1),'���ֽ�ϵ��ͼ��'),'FontSize',7.5);
    xlabel(mat2str(2*size(deccof(i).cA)));
    axis square;
    DX=deccof(i).cA;
end
reccof(i).RX=deccof(i).cA;
i=i+4;
for j=4:-1:2
    % ����ÿ���ع���ͼ��
    figure(1);
    subplot(2,4,i);
    imshow([reccof(j).RX/255,deccof(j).cH/255;deccof(j).cV/255,deccof(j).cD/255]);
    if j==3
         title(strcat(int2str(j-1),'���ֽ�ϵ��ͼ��'),'FontSize',7.5);
    else
         title(strcat('�ع�',int2str(j-1),'���ֽ�ϵ��ͼ��'),'FontSize',7.5);
    end
    axis square;
    xlabel(mat2str(2*size(reccof(j).RX)));
    % ���÷ֽ�ϵ������ֱ���ع�
    reccof(j-1).RX=idwt2(reccof(j).RX,deccof(j).cH,deccof(j).cV,deccof(j).cD,wavename,size(deccof(j-1).cA),'mode',mode);
    i=i-1;
end
% ����ع�����
A0max1=max(max(abs(X-reccof(1).RX)));
A0max2=prod(size(find(abs((X-(reccof(1).RX)))~=0)));
subplot(245);imshow(reccof(1).RX/255);colormap(map);
title('ϵ���ع�ͼ��','FontSize',7.5);
axis square;
xlabel(mat2str(size(reccof(1).RX)));
ylabel(strcat('����ع����=',num2str(A0max1)),'FontSize',7.5);
