close all
clc;clear;
%本段程序采用两种模式功能 一是存系数 二是测试恢复系数效果

huifu_xishu=1;
huifu_xishu_patch1=0;
 huifu_xishu_patch2=1;
 cun_zidian_xishu=0;
 cun_xishu_patch1_flag=0;
 cun_xishu_patch2_flag=0;
if huifu_xishu==1
        for ii=1:7
        %     cd('.\MAT_DATA');%此处如果报错 则采用将字典文件复制到外面的方法
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
           currentFile = sprintf('Dksvd%d.mat',ii);
           load(currentFile);
            eval(['Dksvd',num2str(ii),'=','Dksvd',';']);
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
        %
        end
end
%*********************************end***********************************
%%
test_ronghe=1;
%测试一参数选取为 70 69
shangxian=1;
xiaxian=0;
 bufen=1;
%************************************I分量为引导 RGB融合实验************
image_input1=double(imread('./2.jpg'));
image_input2=double(imread('./3.jpg'));
% image_input1=imresize(image_input1,[256 256]);
% image_input2=imresize(image_input2,[256 256]);
A=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
B=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
Fusion_image=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
for i=1:3
A(:,:,i)=image_input1(shangxian:size(image_input1,1)/bufen+xiaxian,shangxian:xiaxian+size(image_input1,2)/bufen,i);
B(:,:,i)=image_input2(shangxian:size(image_input1,1)/bufen+xiaxian,shangxian:xiaxian+size(image_input2,2)/bufen,i);
end
% if huifu_xishu_patch1==1
figure;
imshow(uint8(A),[]);
% end
% if huifu_xishu_patch2==1
figure;
imshow(uint8(B),[]);
% end
huifu_A=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
huifu_B=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
[I1,FORRI,AA,BB]=RGB2IHS(A);
[I2,FORRI,AA,BB]=RGB2IHS(B);
I1=I1(:,:,1);
I2=I2(:,:,1);
mean_I1=sum(sum(I1))/(size(I1,1)*size(I1,2));
mean_I2=sum(sum(I2))/(size(I2,1)*size(I2,2));
dic_number=6;
r=180/dic_number;
patch_size=8;
%Overlap=7时 就是为重叠方格为7
overlap=7;
A100=A;
B100=B;
for channel=1:3
            if huifu_xishu==1
                 cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');

                if huifu_xishu_patch1==1
                    currentFile = sprintf('%dfenlei_patch1.mat',channel);
                    load(currentFile);
                    currentFile = sprintf('%dzidian_xishu_patch1.mat',channel);
                    load(currentFile);
                end
                if huifu_xishu_patch2==1
                    currentFile = sprintf('%dfenlei_patch2.mat',channel);
                    load(currentFile);
                    currentFile = sprintf('%dzidian_xishu_patch2.mat',channel);
                    load(currentFile);
                end
                 cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');

            end
            A=A100(:,:,channel);
            figure;
            imshow(uint8(A),[]);
            B=B100(:,:,channel);
                        figure;
            imshow(uint8(B),[]);
            [h,w]=size(B);
             if huifu_xishu==1
                    huifu_iamge1=zeros(h,w);
                    cntMat1=zeros(h,w);
                    huifu_iamge2=zeros(h,w);
                    cntMat2=zeros(h,w);
             end
            gridx = 1:patch_size - overlap : w-patch_size+1;
            gridy = 1:patch_size - overlap : h-patch_size+1;
            dx=[-1 0 1;-2 0 2;-1 0 1];
            dy=dx';
            if cun_zidian_xishu==1
                cun_xishu_patch1=zeros(256,length(gridx)*length(gridy));
                cun_fenlei_patch1=zeros(length(gridx)*length(gridy),1);
                cun_xishu_patch2=zeros(256,length(gridx)*length(gridy));
                cun_fenlei_patch2=zeros(length(gridx)*length(gridy),1);
            end
            xishu=zeros(256,1);
            windows=0;
            for ii = 1:length(gridx)
                for jj = 1:length(gridy)
                    xx = gridx(ii);
                    yy = gridy(jj);
                    windows=windows+1;%第几个窗子
                    patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
                    mean1 = mean(patch_1(:));
                    patch1 = patch_1(:) - mean1;
                    patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
                    mean2 = mean(patch_2(:));
                    patch2 = patch_2(:) - mean2;
                    if cun_zidian_xishu==1
                                %%
                                %存第一张图像相关系数
                                if cun_xishu_patch1_flag==1
                                       [F1,xishu,max_p1]=USE_DICTIONARY(patch_1,0);
                                       cun_xishu_patch1(:,windows)=xishu;   
                                       cun_fenlei_patch1(windows)=max_p1;
                                    cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');

                                       currentFile = sprintf('%dzidian_xishu_patch1.mat',channel);
                                       save(currentFile,'cun_xishu_patch1')

                                        currentFile = sprintf('%dfenlei_patch1.mat',channel);
                                       save(currentFile,'cun_fenlei_patch1')
                                       cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
                                end
                                if cun_xishu_patch2_flag==1
                                       %%存第二张图像相关系数
                                        [F1,xishu,max_p1]=USE_DICTIONARY(patch_2,0);
                                       cun_xishu_patch2(:,windows)=xishu;   
                                       cun_fenlei_patch2(windows)=max_p1;
                                    cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');

                                       currentFile = sprintf('%dzidian_xishu_patch2.mat',channel);
                                       save(currentFile,'cun_xishu_patch2')

                                        currentFile = sprintf('%dfenlei_patch2.mat',channel);
                                       save(currentFile,'cun_fenlei_patch2')
                                       cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS')
                                             %%    
                                end
                    end
                    if huifu_xishu==1
                        if huifu_xishu_patch1==1
                             index=cun_fenlei_patch1(windows);
                             eval(['Dksvd','=','Dksvd',num2str(index),';']);
                             w=cun_xishu_patch1(:,windows);
                            patch_f=Dksvd*w;
                            Patch_f = reshape(patch_f, [patch_size, patch_size]);
                            Patch_f = Patch_f + mean1;

                            huifu_iamge1(yy:yy+patch_size-1, xx:xx+patch_size-1) = huifu_iamge1(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
                            cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                        end
                        if huifu_xishu_patch2==1
                             index=cun_fenlei_patch2(windows);
                             eval(['Dksvd','=','Dksvd',num2str(index),';']);
                             w=cun_xishu_patch2(:,windows);
                            patch_f=Dksvd*w;
                            Patch_f = reshape(patch_f, [patch_size, patch_size]);
                            Patch_f = Patch_f + mean2;

                            huifu_iamge2(yy:yy+patch_size-1, xx:xx+patch_size-1) = huifu_iamge2(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
                            cntMat2(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat2(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                        end
                    end
               fprintf([num2str(ii), ' rows have been processed\n']);
               fprintf([num2str(jj), ' cols have been processed\n']);
                if mod(ii,5)==0
                    disp(['The channel ', num2str(channel),' was working!']);      
                end
                end
            end


            %idx是逻辑值 所以知道其如果所在位置逻辑值不为1 则
            %不会进行任何操作
    if huifu_xishu==1
        if huifu_xishu_patch1==1
            idx = (cntMat1 < 1);
            huifu_iamge1(idx) = (A(idx)+B(idx))./2;
            cntMat1(idx) = 1;
           huifu_iamge1 = huifu_iamge1./cntMat1;   
            huifu_A(:,:,channel)=huifu_iamge1;
        end
        if huifu_xishu_patch2==1
            idx = (cntMat2 < 1);
            huifu_iamge2(idx) = (A(idx)+B(idx))./2;
            cntMat2(idx) = 1;
            huifu_iamge2 = huifu_iamge2./cntMat2;                     
            huifu_B(:,:,channel)=huifu_iamge2;
        end
    end
end
if huifu_xishu==1
    danwei=0;
    quanju=1;
    if danwei==1
        if huifu_xishu_patch1==1
    figure;
    imshow(uint8(huifu_iamge1),[]);
    end
    if huifu_xishu_patch2==1
    figure;
    imshow(uint8(huifu_iamge2),[]);
    end
    end
    if quanju==1
    if huifu_xishu_patch1==1
    figure;
    imshow(uint8(huifu_A),[]);
    end
    if huifu_xishu_patch2==1
    figure;
    imshow(uint8(huifu_B),[]);
    end
    end
end

%******************************************end**************************
%%
