clc;clear;

%测试IHS变换及反变换函数
image_input1=double(imread('./2.jpg'));
% figure;
% imshow(uint8(image_input1),[]);
[OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
A=OUTPUT(:,:,1);
% 先进行小规模实验 取四分之一 减小计算量
A=A(1:size(A,1)/2,1:size(A,2)/2);
% figure;
% imshow(uint8(A),[]);
% fenliang2=uint8(OUTPUT(:,:,2));
% fenliang3=uint8(OUTPUT(:,:,3));
% figure;
% imshow(A,[]);
% figure;
% imshow(fenliang2,[]);
% figure;
%%
%下面就是字典训练然后恢复原图
patch_size=8;
gridx = 1:1:size(A,1)-7;
gridy = 1:1:size(A,2)-7;
%%
%小测试 一块进行字典训练 不可行
%         patch_1 = A(26:26+patch_size-1, 126:126+patch_size-1);
%         mean1 = mean(patch_1(:));
%         patch1 = patch_1(:) - mean1;
%%

%%初始化字典 博客说有问题的方式
% bb=8;
% Pn=ceil(sqrt(256));
% DCT=zeros(bb,Pn);
% for k=2:2:2,
%     V=cos([0:1:bb-1]'*k*pi/Pn);
%     if k>0, V=V-mean(V); end;
%     DCT(:,k+1)=V/norm(V);
% end;
% DCT=kron(DCT,DCT);
%%
% % 博客https://blog.csdn.net/dugudaibo/article/details/78418318所认为正确的的生成DCT方式
MM = 8; NN = 16;      % 其中MM是DCT字典的行数，NN是DCT字典经过分频采样后的列数
V = sqrt(2 / MM)*cos((0:MM-1)'*(0:NN-1)*pi/MM/2); 
V(1,:) = V(1,:) / sqrt(2);
DCT=kron(V,V); 
for k=1:size(DCT,1)
V1=DCT(:,k)-mean(DCT(:,k));
DCT(:,k)=V1/norm(V1);
end
  %存储数据集类别
 data_n=zeros(64,62000,7);
 geshu=zeros(7,1);
 dic_number=6;
 r=180/dic_number;
 %%soble算子
 dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
%%
  %%

% for ii = 1:length(gridx)
%     for jj = 1:length(gridy)
%          xx = gridx(ii);
%         yy = gridy(jj);
%         patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
%         mean1 = mean(patch_1(:));
%         patch1 = patch_1(:) - mean1;
%         if mean1~=0
%         %%求梯度
%             Dx=imfilter(patch_1,dx);
%             Dy=imfilter(patch_1,dy);
%             %%
%         grad_mag=sqrt(Dx.*Dx+Dy.*Dy);
%         grad_ori=atan(Dy./Dx)*180/pi;
%          idx=(grad_ori<0);
%         grad_ori(idx)=grad_ori(idx)+180;
%         %%
%         index=grad_ori./r;
% %         r=（180/dic_number）=30;
%         hist=zeros(dic_number,1);
% %         patch_size = sqrt(size(D, 1))=16;
%         for i=1:patch_size
%             for j=1:patch_size
% %                 Y = ceil(X) 将 X 的每个元素四舍五入到大于或等于该元素的最接近整数
%                 p=ceil(index(i,j));
%                 if p>=1&&p<=dic_number
%                     hist(p,1)=hist(p,1)+grad_mag(i,j);
%                 end
%             end
%         end
%         [max_v,max_p]=max(hist);
%         if max_v/sum(hist)>(1.3/6)
%             geshu(max_p)=geshu(max_p)+1;%数到了个数加1
%             temp_data_n=data_n(:,:,max_p);
%             temp_data_n(:,geshu(max_p))=patch1;
%             data_n(:,:,max_p)=temp_data_n;
% %             w1=omp2(D_n{max_p,1},patch1,G_n{max_p,1},epsilon);
% %             w2=omp2(D_n{max_p,1},patch2,G_n{max_p,1},epsilon); 
%         else
%              geshu(7)=geshu(7)+1;%数到了个数加1
%             temp_data_n=data_n(:,:,7);
%             temp_data_n(:,geshu(7))=patch1;
%             data_n(:,:,7)=temp_data_n;
% %             w1=omp2(D,patch1,G,epsilon);
% %             w2=omp2(D,patch2,G,epsilon);
% %             flag=0;  
%         end
%         end
%     end
% end
% for i=1:7
%     temp=data_n(:,:,i);
%     temp=temp(:,1:geshu(i));
%     eval(['data',num2str(i),'=','temp',';']);
% end
% save './data.mat' data1 data2 data3 data4 data5 data6 data7 geshu
%%
load data.mat
% for i=1:7
%     temp=data_n(:,:,i);
%     temp=temp(:,1:geshu(i));
%     eval(['data',num2str(i),'=','temp',';']);
% end
% save './data.mat' data1 data2 data3 data4 data5 data6 data7 geshu
for i=1:7
    eval(['params.data','=','data',num2str(i),';']);
% params.data =  data1;
params.Edata = 0.01;
params.dictsize = 256;
params.initdict=DCT(:,1:256);
params.iternum = 30;
%决定算法模式 当选择high时 则说明在OMP算法训练时
%需要G=D'*D and DtX=D'*X
params.memusage = 'high';
params.codemode='error';
[Dksvd,g,err] = ksvd(params,'');
%  eval(['Dksvd',num2str(i),'=','Dksvd',';']);
    currentFile = sprintf('Dksvd%d.mat',i);
   save(currentFile,'Dksvd')
%  eval([save,'DKSVD.data','Dksvd',num2str(i),';']); 
end
