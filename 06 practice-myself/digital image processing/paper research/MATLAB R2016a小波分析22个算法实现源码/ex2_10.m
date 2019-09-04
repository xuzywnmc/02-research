%装载并显示原始图像
load wbarb 
subplot(2,2,1);
image(X);
colormap(map);
title('原始图像 ');
axis square;
disp('压缩前图像的大小：');
whos('X')

%对图像进行7层小波分解
[c,l]=wavedec2(X,2,'bior3.7');
%提取小波分解结构中的一层的低频系数和高频系数
cA1=appcoef2(c,l,'bior3.7',1);
%水平方向
cH1=detcoef2('h',c,l,1);
%斜线方向
cD1=detcoef2('d',c,l,1);
%垂直方向
cV1=detcoef2('v',c,l,1);

%重构第一层系数
A1=wrcoef2('a',c,l,'bior3.7',1);
H1=wrcoef2('h',c,l,'bior3.7',1);
D1=wrcoef2('d',c,l,'bior3.7',1);
V1=wrcoef2('v',c,l,'bior3.7',1);
c1=[A1 H1;V1 D1];

%显示第一层频率信息
subplot(2,2,2);
image(c1);
title('分解后的低频和高频信息');

%对图像进行压缩：保留第一层低频信息并对其进行量化编码
ca1=wcodemat(cA1,440,'mat',0);
%改变图像高度并显示
ca1=0.1*ca1;
subplot(2,2,3);
image(ca1);
colormap(map);
title('第一次压缩后图像');
axis square;
disp('第一次压缩后图像的大小：');
whos('ca1')
%压缩图像：保留第二层低频信息并对其进行量化编码
cA2=appcoef2(c,l,'bior3.7',2);
ca2=wcodemat(cA2,440,'mat',0);
ca2=0.1*ca2;
subplot(2,2,4);
image(ca2);
colormap(map);
title('第二次压缩后图像');
disp('第二次压缩后图像大小：');
whos('ca2')
