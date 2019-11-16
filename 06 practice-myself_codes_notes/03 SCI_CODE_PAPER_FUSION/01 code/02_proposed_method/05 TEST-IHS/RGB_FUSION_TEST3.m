close all
clc;clear;
%关于此程序的说明
%此程序测试了当完全不相交情况下图像块之间 恢复效果 发现其恢复效果极差 故放弃

huifu_xishu=1;
huifu_xishu_patch1=1;
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
huifu_F=zeros(size(image_input1,1)/bufen,size(image_input1,2)/bufen,3);
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
overlap=0;
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
                      Fusion_result=zeros(h,w);
                    cntMat_result=zeros(h,w);
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
                    mean_f=(mean1+mean2)/2;
                    if huifu_xishu==1
                        if huifu_xishu_patch1==1
                             index=cun_fenlei_patch1(windows);
                             eval(['Dksvd','=','Dksvd',num2str(index),';']);
                             w=cun_xishu_patch1(:,windows);
                            patch_f_f1=Dksvd*w;
                            Patch_f = reshape(patch_f_f1, [patch_size, patch_size]);
                            Patch_f = Patch_f + mean1;

                            huifu_iamge1(yy:yy+patch_size-1, xx:xx+patch_size-1) = huifu_iamge1(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
                            cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                        end
                        if huifu_xishu_patch2==1
                             index=cun_fenlei_patch2(windows);
                             eval(['Dksvd','=','Dksvd',num2str(index),';']);
                             w=cun_xishu_patch2(:,windows);
                            patch_f_f2=Dksvd*w;
                            Patch_f2 = reshape(patch_f_f2, [patch_size, patch_size]);
                            Patch_f2 = Patch_f2 + mean2;

                            huifu_iamge2(yy:yy+patch_size-1, xx:xx+patch_size-1) = huifu_iamge2(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f2;
                            cntMat2(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat2(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                        end
                                                 %%*******************************求对应亮度patch**************
                                patch_I1 = I1(yy:yy+patch_size-1, xx:xx+patch_size-1);
                        %         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
                        %         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
                                A1=(patch_I1-mean_I1)/mean_I1;%和自己比看都大多少
                        %         [k1,k2]=max(max(A1));
                                percent_patch1=sum(sum(A1))/(size(A1,1)*size(A1,2));%全部转为正数 但是如果全部为负数
                                %则肯定就转不成正数了 所以意义不大

                                   patch_I2 = I2(yy:yy+patch_size-1, xx:xx+patch_size-1);
                        %         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
                        %         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
                                A2=(patch_I2-mean_I2)/mean_I2;%和自己比看都大多少
                        %         [k1,k2]=max(max(A1));
                                percent_patch2=sum(sum(A2))/(size(A2,1)*size(A2,2));%全部转为正数 但是如果全部为负数
                        %%***********************************end***************************** 
                        sum_percent=abs(percent_patch1)+abs(percent_patch2);
                       if percent_patch1 > percent_patch2     
                              temp_max=max(abs(percent_patch1),abs(percent_patch2));
                              %此处为了加强对彩色分量弱势区域的显示 采用方法就是如果低于均值则全部显示的方法
                              P1atch_f=patch_f_f1+mean1+patch_f_f2*(1-(temp_max/sum_percent));
                       end
                        if percent_patch1 < percent_patch2
                              temp_max=max(abs(percent_patch1),abs(percent_patch2));
                              P1atch_f=patch_f_f2+mean2+patch_f_f1*(1-(temp_max/sum_percent));
                       end
                       if percent_patch1 == percent_patch2
                            temp_max=max(abs(percent_patch1),abs(percent_patch2));
                              P1atch_f=(patch_f_f2+mean2)*(temp_max/sum_percent)+(patch_f_f1+mean1)*(1-(temp_max/sum_percent));
                       end 
                        Patch_f = reshape(P1atch_f, [patch_size, patch_size]);
        
                        Fusion_result(yy:yy+patch_size-1, xx:xx+patch_size-1) = Fusion_result(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
                        cntMat_result(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat_result(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
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
        idx = (cntMat_result < 1);
            Fusion_result(idx) = (A(idx)+B(idx))./2;
            cntMat_result(idx) = 1;
             Fusion_result =  Fusion_result./cntMat_result;                     
            huifu_F(:,:,channel)= Fusion_result;
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
            figure;
            imshow(uint8(huifu_F),[]);
    end
end

%******************************************end**************************
%%
