% EM�㷨
% /*��ʼ��*/
% ���ѡ�� 
% ѡ�� �� 
% ���� Ϊ�ź� �ķ�Χ�ĵ���
% ��ʽ14��һ������ 
% �� Ϊһ������ʽ��ͨ�˲�������СΪ( )
%  
% Repeat
% /*E��*/
% for each sample  
%  /*�в�*/
% end
%   /*�ռ�ƽ���в�*/
% for each sample  
%   /*��������*/
%   /*�������*/
% end
% /*M��*/
% for each sample  
%   /*Ȩ�ؾ���*/
% end
%    /*�µ�������ֵ*/
%   /*�µĹ���ֵ*/
%  
% until   /*ֹͣ����*/







% ���������˵��������
% I     ����Ҫ�����ͼ��
% fxy   ����I��double�͵ľ���
% Pic   ������ȥ�߽����������ͼ�����
% y_Col������ʾfxy����������ʽ
% y_Row������ʾfxy����������ʽ
% y_Row_Ext�м���������ڵõ���ʽ(8)�е�Y

% [M L]����ͼ��Ĵ�С
% m     ����ͼ���������Ŀ������M��N
% mPic  �������˱߽������������������
% A     ���������Ժ��ͼ��
% P     ����ʽ(2)����������
% theta ����ʽ(2)�Ĳ�������ʾ���ı�׼��
% p0    ������һ���źŵķֲ�
% pw1   ������һ���źŵĺ������
% pw2   �����ڶ����źŵĺ������,����1-Pw1
% w_vector��ʽ(4)�е�����������СΪm��1
% w_vector_Matrix����w_vector����ת���ɵľ��󣬴�СΪM��L
% W     �����ԽǾ��󣬴�СΪm��m
% Pred  ����Ԥ����󣬴�СΪM��N
% R     �����в���󣬴�СΪM��N
% Alpha ����Ԥ��ϵ����������СΪ2Na��1
% N     ������ʾAlpha�Ĵ�С����
% �����м��������˵��
%
% ��ͼ��ת������
I=imread('test.png');
[M L] = size(I);
fxy = im2double(I);
Pic = fxy(2:M-1, 2:L-1);
m = M*L;
mPic =(M -2)* (L-2); % ���˱߽������������������

% ��ʼ��
N = 4;
Alpha = [0.125; 0.125; 0.125; 0.125; 0.125; 0.125; 0.125; 0.125]; % N��Ԫ��
pw1 = 0.5;
pw2 = 1- pw1;
% todo: p0 ������ʼ����������p0=0.5
p0=0.5;
theta = 1; % ������ֵ���ڵ����и���
threshold = 0.0001;
theta_New = theta + 2 * threshold;
% W = zeros(m,m);
W = zeros(mPic,mPic);
% debug
size(fxy)

% % ���㹫ʽ(9)�еľ���Y
% Pic_Trans = Pic'; % ת��
% y_Col = Pic_Trans(:); % ��ʽ���ڹ�ʽ��1���ͣ�7����
% Y = zeros(mPic, 8);
% for i = 2 : M-1
%     for j = 2 : L-1
%         % (i,j)����ԭ������fxy�����꣬��Pic�����ж�Ӧ����Ϊ(i-1,j-1)
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
% % EM�����㷨
% while abs(theta_New - theta) >= threshold % һֱ��107������ ==================
% 
% % ����ɵĲ���
% theta = theta_New;
%     
% % �ټ���(1)ʽ�е�R������������������������������������
% % R = y_Col - Y_Row_Order * Alpha; % �ó�����RΪ������,ά��Ϊm
% R = y_Col - Y * Alpha; % �ó�����RΪ������,ά��ΪmPic
% 
% % ����ʽ(2)�еĸ���,�����P�С���������������������������
% c1 = 1 / (theta *sqrt(2*pi)); % ��ʱ����
% P = c1 *exp( (- R.^2)/ (2* theta^2) );
% 
% % ����ʽ(4)�е�������ʡ�������������������������������
% % todo��W��Ҫ��ʼ����
% w_vector = (pw2 .* P) ./ (pw2 .*P + pw1* p0); % �õ�һ��mά������
% 
% % �����������,����ʽ(5)��������������������������������
% % pw2 = sum(w_vector)/m;
% pw2 = sum(w_vector)/mPic;
% pw1 = 1 - pw2;
% 
% % ��������ϵ������Alpha����ʽ(7)������������������������
% % �ȸ��£�9��ʽ���е�M����
% % for i=1:m
% for i=1:mPic
%     W(i,i) = w_vector(i);
% end
% Alpha = (Y'*W*Y)^(-1) * Y' * W * y_Col
% 
% % ���㷽��theta,��ʽ(3)����������������������������������
% square_theta = sum(w_vector .* R .* R) / sum(w_vector);
% theta_New = sqrt(square_theta);
% 
% end % end while loop =======================================================
% 
% % �������Ѻ������Wת����Ϊ�������ʽ���γɺ������ͼ���Լ����и���Ҷ�任�����Ƶ��ͼ
% w_vector_Matrix = zeros(M-2, L-2);
% for i = 1:M-2
%     % �����L-2��ʾÿһ�е�Ԫ�ظ���
%     w_vector_Matrix(i,:) = w_vector( (i-1)*(L-2) + 1 : i*(L-2) )';
% end
% 
% % Ƶ��
% W_Matrix_FFT = fft2(w_vector_Matrix, M-2, L-2);
% 
% % ��ͼ
% subplot(1,3,1);
% imshow(I),title('ԭͼ');
% subplot(1,3,2);
% imshow(w_vector_Matrix), title('�������ͼ');
% subplot(1,3,3);
% imshow(abs(W_Matrix_FFT)), title('����ͼ�ĸ���ҶƵ��');
% 
% % ����������pw1,pw2,theta, Alpha����workspace�в鿴����������֪��
