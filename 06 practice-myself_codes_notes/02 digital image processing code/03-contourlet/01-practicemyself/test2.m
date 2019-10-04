% EM算法
% /*初始化*/
% 随机选择 
% 选择 和 
% 设置 为信号 的范围的倒数
% 如式14中一样设置 
% 设 为一个二项式低通滤波器，大小为( )
%  
% Repeat
% /*E步*/
% for each sample  
%  /*残差*/
% end
%   /*空间平均残差*/
% for each sample  
%   /*条件概率*/
%   /*后验概率*/
% end
% /*M步*/
% for each sample  
%   /*权重矩阵*/
% end
%    /*新的误差估计值*/
%   /*新的估计值*/
%  
% until   /*停止条件*/







% 参数与变量说明：如下
% I     ——要处理的图像
% fxy   ——I的double型的矩阵
% Pic   ——除去边界像素以外的图像矩阵
% y_Col——表示fxy的列向量形式
% y_Row——表示fxy的行向量形式
% y_Row_Ext中间变量，用于得到公式(8)中的Y

% [M L]——图像的大小
% m     ——图像的像素数目，等于M×N
% mPic  ——除了边界像素以外的像素总数
% A     ——处理以后的图像
% P     ——式(2)的条件概率
% theta ——式(2)的参数，表示误差的标准差
% p0    ——第一类信号的分布
% pw1   ——第一类信号的后验概率
% pw2   ——第二类信号的后验概率,等于1-Pw1
% w_vector—式(4)中的列向量，大小为m×1
% w_vector_Matrix——w_vector向量转化成的矩阵，大小为M×L
% W     ——对角矩阵，大小为m×m
% Pred  ——预测矩阵，大小为M×N
% R     ——残差矩阵，大小为M×N
% Alpha ——预测系数向量，大小为2Na×1
% N     ——表示Alpha的大小的量
% 其他中间变量不再说明
%
% 读图像，转换类型
I=imread('test.png');
[M L] = size(I);
fxy = im2double(I);
Pic = fxy(2:M-1, 2:L-1);
m = M*L;
mPic =(M -2)* (L-2); % 除了边界像素以外的像素总数

% 初始化
N = 4;
Alpha = [0.125; 0.125; 0.125; 0.125; 0.125; 0.125; 0.125; 0.125]; % N个元素
pw1 = 0.5;
pw2 = 1- pw1;
% todo: p0 怎样初始化？暂且设p0=0.5
p0=0.5;
theta = 1; % 随便设的值，在迭代中更新
threshold = 0.0001;
theta_New = theta + 2 * threshold;
% W = zeros(m,m);
W = zeros(mPic,mPic);
% debug
size(fxy)

% % 计算公式(9)中的矩阵Y
% Pic_Trans = Pic'; % 转置
% y_Col = Pic_Trans(:); % 该式用于公式（1）和（7）中
% Y = zeros(mPic, 8);
% for i = 2 : M-1
%     for j = 2 : L-1
%         % (i,j)是与原来矩阵fxy的坐标，在Pic矩阵中对应坐标为(i-1,j-1)
%         rowIdx_Y = (i-2)*(L-2) + (j-1);
%         
%         Y(rowIdx_Y, 1) = fxy(i-1, j-1);
%         Y(rowIdx_Y, 2) = fxy(i-1, j  );
%         Y(rowIdx_Y, 3) = fxy(i-1, j+1);
%         
%         Y(rowIdx_Y, 4) = fxy(i  , j-1);
%         Y(rowIdx_Y, 5) = fxy(i  , j+1);
%         
%         Y(rowIdx_Y, 6) = fxy(i+1, j-1);
%         Y(rowIdx_Y, 7) = fxy(i+1, j  );
%         Y(rowIdx_Y, 8) = fxy(i+1, j+1);
%     end
% end
% 
% % EM迭代算法
% while abs(theta_New - theta) >= threshold % 一直到107行左右 ==================
% 
% % 保存旧的参数
% theta = theta_New;
%     
% % 再计算(1)式中的R——————————————————
% % R = y_Col - Y_Row_Order * Alpha; % 得出来的R为列向量,维数为m
% R = y_Col - Y * Alpha; % 得出来的R为列向量,维数为mPic
% 
% % 计算式(2)中的概率,结果在P中——————————————
% c1 = 1 / (theta *sqrt(2*pi)); % 临时变量
% P = c1 *exp( (- R.^2)/ (2* theta^2) );
% 
% % 计算式(4)中的先验概率————————————————
% % todo：W需要初始化吗？
% w_vector = (pw2 .* P) ./ (pw2 .*P + pw1* p0); % 得到一个m维列向量
% 
% % 更新先验概率,见公式(5)————————————————
% % pw2 = sum(w_vector)/m;
% pw2 = sum(w_vector)/mPic;
% pw1 = 1 - pw2;
% 
% % 计算线性系数向量Alpha，见式(7)————————————
% % 先更新（9）式子中的M矩阵
% % for i=1:m
% for i=1:mPic
%     W(i,i) = w_vector(i);
% end
% Alpha = (Y'*W*Y)^(-1) * Y' * W * y_Col
% 
% % 计算方差theta,见式(3)—————————————————
% square_theta = sum(w_vector .* R .* R) / sum(w_vector);
% theta_New = sqrt(square_theta);
% 
% end % end while loop =======================================================
% 
% % 接下来把后验概率W转换成为矩阵的形式，形成后验概率图，以及进行傅立叶变换，绘出频谱图
% w_vector_Matrix = zeros(M-2, L-2);
% for i = 1:M-2
%     % 下面的L-2表示每一行的元素个数
%     w_vector_Matrix(i,:) = w_vector( (i-1)*(L-2) + 1 : i*(L-2) )';
% end
% 
% % 频谱
% W_Matrix_FFT = fft2(w_vector_Matrix, M-2, L-2);
% 
% % 绘图
% subplot(1,3,1);
% imshow(I),title('原图');
% subplot(1,3,2);
% imshow(w_vector_Matrix), title('后验概率图');
% subplot(1,3,3);
% imshow(abs(W_Matrix_FFT)), title('概率图的傅立叶频谱');
% 
% % 其他参数如pw1,pw2,theta, Alpha等在workspace中查看变量即可以知道
