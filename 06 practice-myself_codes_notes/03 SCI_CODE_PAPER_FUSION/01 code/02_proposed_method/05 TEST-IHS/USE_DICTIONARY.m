%存储数据集类别
%***************************本程序最大的问题就是当为0时 没有返回值了*******************
%   clc;clear;
function [F,xishu,max_p]=USE_DICTIONARY(A,channel)
%关于系数说明
%A是输入图像第几通道 channel是第几通道 不同通道选用不同字典
%channel 0~2分别表示1~3通道
[h,w]=size(A);
for ii=1:7
%     cd('.\MAT_DATA');%此处如果报错 则采用将字典文件复制到外面的方法
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
   currentFile = sprintf('Dksvd%d.mat',ii+channel*10);
   load(currentFile);

   eval(['D','=','Dksvd',';']);
   G=D'*D;
   eval(['G',num2str(ii),'=','G',';']);
%           cd('..');
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
%
end
patch_size=8;
overlap=7;
gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;
%误差改小点能够减少时间
epsilon=0.1;
%测试IHS变换及反变换函数
% image_input1=double(imread('./2.jpg'));
% figure;
% imshow(uint8(image_input1),[]);
% [OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
% A=OUTPUT(:,:,1);
% 先进行小规模实验 取四分之一 减小计算量
% A=A(1:size(A,1),1:size(A,2));
% figure;
% imshow(uint8(A),[]);
F=zeros(size(A));
cntMat=zeros(size(A));
 data_n=zeros(64,62000,7);
 geshu=zeros(7,1);
 dic_number=6;
 r=180/dic_number;
 %%soble算子
 dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
%
  %

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
            %%
%             geshu(max_p)=geshu(max_p)+1;%数到了个数加1
%             temp_data_n=data_n(:,:,max_p);
%             temp_data_n(:,geshu(max_p))=patch1;
%             data_n(:,:,max_p)=temp_data_n;
%%
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
           currentFile = sprintf('Dksvd%d.mat',max_p+channel*10);
            load(currentFile);
            cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
            eval(['G','=','G',num2str(max_p),';']);
            xishu=omp2(Dksvd,patch1,G,epsilon);
            patch_f=Dksvd*xishu;
            Patch_f = reshape(patch_f, [8, 8]);
             F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f+ mean1;
            cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
             %%
%             w1=omp2(D_n{max_p,1},patch1,G_n{max_p,1},epsilon);
%             w2=omp2(D_n{max_p,1},patch2,G_n{max_p,1},epsilon); 
%%
        else
            max_p=7;
            cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
             currentFile = sprintf('Dksvd%d.mat',max_p+channel*10);
            load(currentFile);
            cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
            eval(['G','=','G',num2str(max_p),';']);
            xishu=omp2(Dksvd,patch1,G,epsilon);
            patch_f=Dksvd*xishu;
            Patch_f = reshape(patch_f, [8, 8]);
             F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f+ mean1;
            cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
             %%
%              geshu(7)=geshu(7)+1;%数到了个数加1
%             temp_data_n=data_n(:,:,7);
%             temp_data_n(:,geshu(7))=patch1;
%             data_n(:,:,7)=temp_data_n;
%             w1=omp2(D,patch1,G,epsilon);
%             w2=omp2(D,patch2,G,epsilon);
%             flag=0;  
        end

        else%如果为零则全部给回原值
            xishu=zeros(256,1);
            F=zeros(8,8);
            max_p=1;
%              F(yy:yy+patch_size-1, xx:xx+patch_size-1) = A(yy:yy+patch_size-1, xx:xx+patch_size-1) ;
                     end
    end
end
F = F./cntMat; 
% figure;
% imshow(uint8(F),[]);
end