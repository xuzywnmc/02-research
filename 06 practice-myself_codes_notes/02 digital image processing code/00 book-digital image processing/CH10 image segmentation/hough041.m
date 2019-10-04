%
% 默认语法是： [ H, theta, rho ] = hough(f) 
% 完整语法是： [ H , theta, rho ] = hough(f, 'ThetaRes', val1, 'RhoRes', val2)
% 其中，H是Hough变换矩阵，theta（单位是度数）和rho是θ和ρ向量，
% 其中，H是Hough变换矩阵，theta（单位是度数）
% rho是θ和ρ向量，在这些值上产生Hough变换。
% 输入f是二值图像，val1是0到90的标量，
% 指定了沿θ轴Hough变换的间距（默认是1），
% val2是0到hypot(size(f,1), size(f,2))之间的实标量，
% 其中函数hypot()表示平方和的平方根，指定了沿ρ轴Hough变换的间隔（默认是1）。
% 创建合成图像
% 函数理解：就是利用在已经似乎确定的边缘点 然后利用经过这个边缘点所有直线
% 在极坐标系中能够找到属于自己的一个点 而经过这个点的所有直线一点会在极坐标系
% 中找到一组曲线 统计所有的极坐标 形成一个矩阵 这就是霍夫矩阵 而这里就是直接
% 相当于找到了边缘点
f = zeros(101, 101); 
f(1, 1) = 1; 
f(101, 1) = 1; 
f(1, 101) = 1; 
f(101, 101) = 1; 
f(51, 51) = 1;
 
% 显示合成图像
figure; 
subplot(221), imshow(f); 
title('Subplot 1: 五个点原图')
 
% 采用默认值进行hough变换，并显示hough变换的结果
H = hough(f); 
subplot(222), imshow(H, []);
title('Subplot 2: H变换矩阵')
 
% 采用完整语法形式调用hough函数 使用带有标度轴的较大图形中显示结果更利于看清Hough变换
%thera rho对应hough变换矩阵的每列和每行的值 这些向量可以作为附加输入参量
%传递给imshow来控制水平轴和垂直轴的标度
[ H, theta, rho ] = hough(f, 'ThetaRes', 1, 'RhoRes', 1); 
subplot(223), imshow(H, []);
title('Subplot 3: 不带坐标轴的H变换矩阵')
subplot(224), imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit'); 
%imshow（I）来显示，出来的只有黑白图像 在imshow里面添加一个空矩阵[]，才能显示正常的灰度图像
title('Subplot 4: 带坐标轴的H变换矩阵')
axis on;%打开所有的坐标轴标签、刻度、背景
axis normal;%将当前的坐标轴框恢复为全尺寸，并将单位刻度的所有限制取消
xlabel('\theta'); % 加上\后x坐标轴显示θ，否则显示theta
ylabel('\rho');

