function modetest()
% 不同小波在不同的分解模式下3级分解与重构图像
% 图像为kids.tif，haar小波，per分解模式
% 装载图像为黑白索引图像，X中含有被装载的信号，map中含有被装载的color
imgname='kids.tif';    % 输入：imgname  图像文件
wavename='haar';       % wavename  小波名称
mode='per';
[X,map]=imread(imgname);
deccof=struct('cA',[],'cH',[],'cV',[],'cD',[]);
reccof=struct('RX',[]);
sX=size(X);
nbcol=size(map,1);
X=double(X);
% 画出原始图像
figure(1);
subplot(241);imshow(uint8(X));colormap(map);
title(strcat('原始图像(',wavename,'小波)'),'FontSize',7.5);
ylabel(strcat('3级分解与重构演示图(',mode,'模式)'),'FontSize',7.5);
xlabel(mat2str(sX));
axis square
DX=X;
deccof(1).cA=X;
for i=2:4
    % 用小波函数进行分解
    [deccof(i).cA,deccof(i).cH,deccof(i).cV,deccof(i).cD]=dwt2(DX,wavename,'mode',mode);
    % 画出各分解系数对应的图像
    subplot(2,4,i);
    imshow([deccof(i).cA/255,deccof(i).cH/255;deccof(i).cV/255,deccof(i).cD/255;]);
    colormap(map);
    title(strcat(int2str(i-1),'级分解系数图像'),'FontSize',7.5);
    xlabel(mat2str(2*size(deccof(i).cA)));
    axis square;
    DX=deccof(i).cA;
end
reccof(i).RX=deccof(i).cA;
i=i+4;
for j=4:-1:2
    % 画出每级重构的图像
    figure(1);
    subplot(2,4,i);
    imshow([reccof(j).RX/255,deccof(j).cH/255;deccof(j).cV/255,deccof(j).cD/255]);
    if j==3
         title(strcat(int2str(j-1),'级分解系数图像'),'FontSize',7.5);
    else
         title(strcat('重构',int2str(j-1),'级分解系数图像'),'FontSize',7.5);
    end
    axis square;
    xlabel(mat2str(2*size(reccof(j).RX)));
    % 利用分解系数进行直接重构
    reccof(j-1).RX=idwt2(reccof(j).RX,deccof(j).cH,deccof(j).cV,deccof(j).cD,wavename,size(deccof(j-1).cA),'mode',mode);
    i=i-1;
end
% 检查重构精度
A0max1=max(max(abs(X-reccof(1).RX)));
A0max2=prod(size(find(abs((X-(reccof(1).RX)))~=0)));
subplot(245);imshow(reccof(1).RX/255);colormap(map);
title('系数重构图像','FontSize',7.5);
axis square;
xlabel(mat2str(size(reccof(1).RX)));
ylabel(strcat('最大重构误差=',num2str(A0max1)),'FontSize',7.5);
