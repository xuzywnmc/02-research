%************************************测试一 王博电脑跑出来数据R通道恢复实验************
close all
%本程序是第三种加权方法的融合实验
clc;clear;
test_ronghe=1;
shangxian=1;
xiaxian=0;
    bufen=1;
zhuangzai_xishu=1;%采用预先训练字典获取系数之后再融合
   jiaquan=1;%加权方式选择
if test_ronghe==1
    if zhuangzai_xishu==1%预先装载节省时间
         cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
        for channel=1:3
                    currentFile = sprintf('%dfenlei_patch1.mat',channel);
                    load(currentFile);
                     eval(['temp_fenlei_patch1',num2str(channel),'=','cun_fenlei_patch1',';']);
                     
                    currentFile = sprintf('%dzidian_xishu_patch1.mat',channel);
                    load(currentFile);
                    eval(['temp_zidian_patch1',num2str(channel),'=','cun_xishu_patch1',';']);
                    
                    currentFile = sprintf('%dfenlei_patch2.mat',channel);
                    load(currentFile);
                     eval(['temp_fenlei_patch2',num2str(channel),'=','cun_fenlei_patch2',';']);
                     
                    currentFile = sprintf('%dzidian_xishu_patch2.mat',channel);
                    load(currentFile);
                     eval(['temp_zidian_patch2',num2str(channel),'=','cun_fenlei_patch2',';']);
        end
         cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
    end
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
figure;
imshow(uint8(A),[]);
figure;
imshow(uint8(B),[]);
[I1,FORRI,AA,BB]=RGB2IHS(A);
[I2,FORRI,AA,BB]=RGB2IHS(B);
I1=I1(:,:,1);
I2=I2(:,:,1);
mean_I1=sum(sum(I1))/(size(I1,1)*size(I1,2));
mean_I2=sum(sum(I2))/(size(I2,1)*size(I2,2));
dic_number=6;
r=180/dic_number;
patch_size=8;
% overlap=7时候 则 w1=cun_xishu_patch1(:,windows); 
%overlap=0时 w1=cun_xishu_patch1(:,(windows-1)*8+1);
overlap=0;
%
A100=A;
B100=B;
[kuan,chang,weishu]=size(B);
Fusion_image1=zeros(kuan,chang,3);
Fusion_image2=zeros(kuan,chang,3);
for channel=1:3
    windows=0;
    A=A100(:,:,channel);
    figure;
    imshow(uint8(A),[]);
    B=B100(:,:,channel);
    figure;
    imshow(uint8(B),[]);
    F=zeros(kuan,chang);
    cntMat=zeros(kuan,chang);
    F1=zeros(kuan,chang);
    cntMat1=zeros(kuan,chang);
    gridx = 1:patch_size - overlap : kuan-patch_size+1;
    gridy = 1:patch_size - overlap : chang-patch_size+1;
    dx=[-1 0 1;-2 0 2;-1 0 1];
    dy=dx';
for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        windows=windows+1;
        xx = gridx(ii);
        yy = gridy(jj);
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;


               if jiaquan==1 | 2
       if zhuangzai_xishu==0%换系数获取方式 换成通过查找系数的方式获取
          [F1,xishu,max_p1]=USE_DICTIONARY(patch_1,0);
          w1=xishu;
          [F2,xishu,max_p2]=USE_DICTIONARY(patch_2,0);
          w2=xishu;
       else
           eval(['cun_fenlei_patch1','=','temp_fenlei_patch1',num2str(channel),';']);
           w1=cun_xishu_patch1(:,windows);
           max_p1=cun_fenlei_patch1(windows);
           eval(['cun_fenlei_patch2','=','temp_fenlei_patch2',num2str(channel),';']);
           w2=cun_xishu_patch2(:,windows);
           max_p2=cun_fenlei_patch2(windows);
           if max_p1==0 | max_p2==0
               max_p1=1;max_p2=1;
           end
       end
   end    
      cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
      currentFile = sprintf('Dksvd%d.mat',max_p1);
      load(currentFile);
      patch_f_f1=Dksvd*w1;
       patch_f_f2=Dksvd*w2;
     currentFile = sprintf('Dksvd%d.mat',max_p2);
      load(currentFile);
      patch_f_f2=Dksvd*w2;
      cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
%%
        mean_f=(mean1+mean2)/2;
        
     
%               temp_max=max(abs(percent_patch1),abs(percent_patch2));
              P1atch_f=patch_f_f1+mean1;
    
       
        Patch_f= reshape(P1atch_f, [patch_size, patch_size]);
        
        F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;

    
        P1atch_f=patch_f_f2+mean2;
        Patch_f= reshape(P1atch_f, [patch_size, patch_size]);
        
        F1(yy:yy+patch_size-1, xx:xx+patch_size-1) = F1(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat1(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
    end
    %cnt
   fprintf([num2str(ii), ' rows have been processed\n']);
    if mod(ii,5)==0
        disp(['The channel ', num2str(channel),' was working!']);      
    end
end

%idx是逻辑值 所以知道其如果所在位置逻辑值不为1 则
%不会进行任何操作
idx = (cntMat < 1);
F(idx) = (A(idx)+B(idx))./2;
cntMat(idx) = 1;
F= F./cntMat; 
Fusion_image1(:,:,channel)=F;

idx = (cntMat1 < 1);
F1(idx) = (A(idx)+B(idx))./2;
cntMat1(idx) = 1;
F1 = F1./cntMat;  
Fusion_image2(:,:,channel)=F1;
end
%测试一维图效果 测试全局效果
quanju=0;
danceshi=1;
if danceshi==1
figure;
imshow(uint8(F),[]);

figure;
imshow(uint8(F1),[]);
end
if quanju==1
figure;
imshow(uint8(Fusion_image1),[]);

figure;
imshow(uint8(Fusion_image2),[]);
end
end
%******************************************end**************************
%%