function SINGLE_IMAGE_TIDU_FENLEI(image_input1,channel)
%%功能介绍
%%将image_input1进行字典训练
%测试IHS变换及反变换函数
% clc;clear;
% for i=1:7%删除.mat文件
%     filename1=['fenlei_data',num2str(i),'.mat'];
%     delete(filename1);
%     filename1=['sum_data',num2str(i),'.mat'];
%     delete(filename1);
% end
% image_input1=double(imread('./2.jpg'));
% % figure;
% % imshow(uint8(image_input1),[]);
% [OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
A=image_input1;%输入的就是各分量
%%
% 先进行小规模实验 取四分之一 减小计算量
% A=A(size(A,1),size(A,2));
%%
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


  %存储数据集类别
 data_n=zeros(64,70000,7);%由于考虑到足够存储空间
 geshu=zeros(7,1);
%  fenlei_geshu=zeros(7,1);
 dic_number=6;
 r=180/dic_number;
 %%soble算子
 dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
%%
  %%

for ii = 1:length(gridx)
    for jj = 1:length(gridy)
         xx = gridx(ii);
        yy = gridy(jj);
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
        if mean1~=0
        %%求梯度
            Dx=imfilter(patch_1,dx);
            Dy=imfilter(patch_1,dy);
            %%
        grad_mag=sqrt(Dx.*Dx+Dy.*Dy);
        grad_ori=atan(Dy./Dx)*180/pi;
         idx=(grad_ori<0);
        grad_ori(idx)=grad_ori(idx)+180;
        %%
        index=grad_ori./r;
%         r=（180/dic_number）=30;
        hist=zeros(dic_number,1);
%         patch_size = sqrt(size(D, 1))=16;
        for i=1:patch_size
            for j=1:patch_size
%                 Y = ceil(X) 将 X 的每个元素四舍五入到大于或等于该元素的最接近整数
                p=ceil(index(i,j));
                if p>=1&&p<=dic_number
                    hist(p,1)=hist(p,1)+grad_mag(i,j);
                end
            end
        end
        [max_v,max_p]=max(hist);
        if max_v/sum(hist)>(1.3/6)
            geshu(max_p)=geshu(max_p)+1;%数到了个数加1
            temp_data_n=data_n(:,:,max_p);
            temp_data_n(:,geshu(max_p))=patch1;
            data_n(:,:,max_p)=temp_data_n;
%             w1=omp2(D_n{max_p,1},patch1,G_n{max_p,1},epsilon);
%             w2=omp2(D_n{max_p,1},patch2,G_n{max_p,1},epsilon); 
        else
             geshu(7)=geshu(7)+1;%数到了个数加1
            temp_data_n=data_n(:,:,7);
            temp_data_n(:,geshu(7))=patch1;
            data_n(:,:,7)=temp_data_n;
%             w1=omp2(D,patch1,G,epsilon);
%             w2=omp2(D,patch2,G,epsilon);
%             flag=0;  
        end
        end
    end
end
sum_sum_geshu=zeros(7,1);
% cd('.\MAT_DATA');
if exist('index.mat')
    load index.mat;
%     cd('..');
end
for i=1:7
    temp=data_n(:,:,i);
    temp=temp(:,1:geshu(i));
%     首先判断是否是第一张图片而且是i=1情况
% cd('.\MAT_DATA');
     if ~exist('sum_data1.mat')
         index=1;%第几张图片索引和第几个通道索引
%          此处命名规则是说如果是通道0 说明和往常一样
%          如果是通道1 则第一次进来的时候进入这个循环 然后第一张图像命名
%          是从1001-1007 第二张则是1011-1017
         save index.mat index
%          cd('..');
        %用来为每个梯度进行存储
%         fen_data=cell(23,1);
%         fen_geshu=zeros(23,1);
        %将1张图片1梯度存储
        fen_geshu=geshu(i);
        %%分data存储
        %将i张图片1梯度所有像素存储
        fen_data=temp;
%         cd('.\MAT_DATA');
        currentFile = sprintf('fenlei_data%d.mat',i+(index-1)*10+1000*channel);
        save(currentFile,'fen_data','fen_geshu');
%         cd('..');
          %将i张图片1梯度总个数存储
%         sum_data=cell(7,1);
%         sum_geshu=zeros(7,1);
        sum_geshu=geshu(i);
%         temp_sum_geshu=sum_geshu;
        sum_data=temp;
%         cd('.\MAT_DATA');
        currentFile = sprintf('sum_data%d.mat',i);
        save(currentFile,'sum_data','sum_geshu');
%         cd('..');
     else 
         
         if index==1%如果为1 说明第一张图像 所有的原始变量都要创建
%                     fen_data=cell(23,1);
%                     fen_geshu=zeros(23,1);
                    %将1张图片1梯度存储
                    fen_geshu=geshu(i);
                    %%分data存储
                    %将i张图片1梯度所有像素存储
                    fen_data=temp;
%                     cd('.\MAT_DATA');
                    currentFile = sprintf('fenlei_data%d.mat',i+(index-1)*10+1000*channel);
                    save(currentFile,'fen_data','fen_geshu');
%                     cd('..');
                      %将i张图片1梯度总个数存储
%                     sum_geshu=temp_sum_geshu;
                    sum_geshu=geshu(i);
%                     temp_sum_geshu=sum_geshu;
                    sum_data=temp;
%                     cd('.\MAT_DATA');
                    currentFile = sprintf('sum_data%d.mat',i);
                    save(currentFile,'sum_data','sum_geshu');
%                     cd('..');
         else
                    fen_geshu=geshu(i);
                    %%分data存储
                    %将i张图片1梯度所有像素存储
                    fen_data=temp;
%                     cd('.\MAT_DATA');
                    currentFile = sprintf('fenlei_data%d.mat',i+(index-1)*10+1000*channel);
                    save(currentFile,'fen_data','fen_geshu');
%                     cd('..');
%                        cd('.\MAT_DATA');
                      %把前sum——data装入 第二个开始的sum命名应该不一样
                     currentFile = sprintf('sum_data%d.mat',i);
                     load(currentFile);
%                         cd('..')
                        sum_sum_geshu(i)=sum_geshu+geshu(i);
                        sum_geshu=sum_sum_geshu(i);
                        sum_data=[sum_data,temp];
%                                    cd('.\MAT_DATA') ;   
                     currentFile = sprintf('sum_data%d.mat',i);
                    save(currentFile,'sum_data','sum_geshu');
%                     cd('..');
         end
     
        %%分data存储
        %将i张图片1梯度所有像素存储
%         fen_data(index,1)=temp;
%         currentFile = sprintf('fenlei_data%d.mat',i);
%         save(currentFile,'fen_data','fen_geshu'); 
     
    
     end
end
%  cd('.\MAT_DATA');
index=index+1;
save index.mat index
% cd('..');
 disp(['The channel ', num2str(channel+1),' was working!']);
 disp(['the ',num2str(index-1),' image was finished,please waiting...']);
 if channel==2
 disp('congratulation! Matlab R2017a hopes everything will go well !');
 end
 end
%     if exist('fenlei_data.mat')
%          load fenlei_data.mat
%         %用来为每个梯度进行存储
%         fen_data=cell(23,1);
%         fen_geshu=zeros(23,1);
%         %将1张图片1梯度存储
%         fen_geshu(index)=geshu(i);
%         %%分data存储
%         %将i张图片1梯度所有像素存储
%         fen_data(index,1)=temp;
%         %分data存储
%          fen_geshu=geshu(i);
%          fenlei_data=temp;
%          currentFile = sprintf('fenlei_data%d.mat',i);
%          save(currentFile,'fen_data','fen_geshu');
% %        save(currentFile,'Dksvd')
% %总方向梯度数据data存储
%          sum_geshu(i)=sum_geshu(i)+geshu(i);
%          eval(['temp_for_pinjiedata','=','sum_data',';']); 
%          pinjiedata=[temp_for_pinjiedata,temp];
%          sum_data=pinjiedata;
%          save './fenlei_data.mat'  sum_data sum_geshu;
%     else
%         if exist('fenlei_data.mat')
%         index=1;%第几张图片索引
%         %用来为每个梯度进行存储
%         fen_data=cell(23,1);
%         fen_geshu=zeros(23,1);
%         %将1张图片1梯度存储
%         fen_geshu(index)=geshu(i);
%         %%分data存储
%         %将i张图片1梯度所有像素存储
%         fen_data(index,1)=temp;
%         currentFile = sprintf('fenlei_data%d.mat',i);
%         save(currentFile,'fen_data','fen_geshu');
% %          %总data存储
%   %将i张图片1梯度总个数存储
%         sum_data=cell(7,1);
%         sum_geshu=zeros(7,1);
%         sum_geshu(1)=geshu;
%         sum_data=temp;
%        save './fenlei_data.mat'  sum_data sum_geshu index;
%     end
%     

% end