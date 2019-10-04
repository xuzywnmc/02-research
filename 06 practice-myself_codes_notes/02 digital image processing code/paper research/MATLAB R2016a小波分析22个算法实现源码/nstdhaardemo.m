function nstdhaardemo(imgname) 
% nstdhaardemo haarС�������Ǳ�׼��񻯷ֽ����ع���ʾ���� 
% nstdhaardemo(imgname) 
% ����������:����ͼ���ļ�,��ʾͼ��3���Ǳ�׼haarС����񻯷ֽ����ع����� 
% ����: imgname ----Ҫװ�ص�ͼ������(���ɫ,�Ҷ�ͼ,����ͼ) 
% ȱʡͼ��Ϊcolor256.png 

if nargin==0 
imgname='color256.png'; 
end 
% �����X�к��б�װ�ص�ͼ���ź�,map�к��б�װ�ص�color 
[X,map] = imread(imgname); 
if ndims(X)==3 
imgcolor=1; 
else 
imgcolor=0; 
end 
X=double(X); 
h=size(X,1); 

%����ԭʼͼ�� 
figure(1); 
subplot(4,4,1);imshow(uint8(X),map); 
title(' haarС��3���Ǳ�׼��񻯷ֽ����'); 
xlabel('ԭʼͼ��'); 
axis square 

position=2; 
A=X; 
%�����򻭳�3���Ǳ�׼��񻯷ֽ�����ж�Ӧ���б任,�б任ͼ�� 
for i=1:3 
A011=decompose(A,imgcolor,1,1,h); 
subplot(4,4,position);imshow(uint8(A011),map);axis square 
A012=decompose(A011,imgcolor,1,2,h); 
subplot(4,4,position+4);imshow(uint8(A012),map);axis square 
xlabel(strcat(int2str(i),'���ֽ�ͼ��')); 
A=A012; 
h=h/2; 
position=position+5; 
end 
xlabel('haarС��3���Ǳ�׼��񻯷ֽ�ͼ��'); 

%����3���ֽ�ͼ�� 
figure(2); 
subplot(4,4,1);imshow(uint8(A),map); 
title('haarС��3���Ǳ�׼��񻯷ֽ��ع�����'); 
xlabel('3���ֽ�ͼ��'); 
axis square 
position=2; 

%�����򻭳�3���Ǳ�׼��񻯷ֽ���ع������ж�Ӧ���б任,�б任ͼ�� 
if imgcolor 
h=size(A(:,:,1),1)/4; 
else 
h=size(A,1)/4; 
end 
for i=1:3 
RX11=reconstruct(A,imgcolor,1,1,h); 
subplot(4,4,position);imshow(uint8(RX11),map);axis square 
RX12=reconstruct(RX11,imgcolor,1,2,h); 
subplot(4,4,position+4);imshow(uint8(RX12),map);axis square 
xlabel(strcat(int2str(3-i),'���ع�ͼ��')); 
A=RX12; 
h=h*2; 
position=position+5; 
end 
xlabel('haarС��3���Ǳ�׼�ֽ���ع�ͼ��'); 
figure(1); 
