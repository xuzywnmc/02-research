%************************************I分量为引导 RGB融合实验************
%注意点1 如果改变求均值方式的时候 还要改变percent_patch2地方的求值方式
%注意点2 此处发现个很大的bug 那就是在求percent或者其他时 如果a=0 那么无论是判断大于零还是小于零 都是不会有
% 结果的
% a=0/0;
% % a=1;
% if a>-0.2
%     k=3;
% end
% 注意点3 load操作其实很费时间
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
          for ii=1:7
        %     cd('.\MAT_DATA');%此处如果报错 则采用将字典文件复制到外面的方法 装载其实很费时间
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
           currentFile = sprintf('Dksvd%d.mat',ii);
           load(currentFile);
            eval(['Dksvd',num2str(ii),'=','Dksvd',';']);
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
        %
        end
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
[Ifenliang_1,FORRI,AA,BB]=RGB2IHS(A);
[Ifenliang_2,FORRI,AA,BB]=RGB2IHS(B);
I1=Ifenliang_1(:,:,1);
I2=Ifenliang_2(:,:,1);
S2=Ifenliang_2(:,:,3);
[I1_zero1,I1_zero2]=find(I1>0);
[I2_zero1,I2_zero2]=find(I2>0);
[S2_zero1,S2_zero2]=find(I2>0);
%此处改变算均值的方式
mean_I1=sum(sum(I1))/(length(I1_zero1));
mean_I2=sum(sum(I2))/(length(I2_zero1));
mean_S2=sum(sum(S2))/(length(S2_zero1));
% mean_I1=sum(sum(I1))/(size(I1,1)*size(I1,2));
% mean_I2=sum(sum(I2))/(size(I2,1)*size(I2,2));
dic_number=6;
r=180/dic_number;
patch_size=8;
overlap=7;
A100=A;
B100=B;
for channel=1:3
windows=0;
A=A100(:,:,channel);
B=B100(:,:,channel)
[kuan,chang]=size(B);
F=zeros(kuan,chang);
cntMat=zeros(kuan,chang);
 
gridx = 1:patch_size - overlap : kuan-patch_size+1;
gridy = 1:patch_size - overlap : chang-patch_size+1;
dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
 
 
for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        patch1_is_zeros=0;
        patch2_is_zeros=0;
        windows=windows+1;
        xx = gridx(ii);
        yy = gridy(jj);
        %注意点：为了避免开头注意点2陷阱 现进行预处理 先判断是不是为0
 
        %%
%         ******************处理patch1模块***********************************
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
         %%*******************************求对应patch1突出度模块**************
        patch_I1 = I1(yy:yy+patch_size-1, xx:xx+patch_size-1);
        [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_I1~=0);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A1=(patch_I1-mean_I1)/mean_I1;%和自己比看都大多少
%         [k1,k2]=max(max(A1));
            percent_patch1=sum(sum(A1))/(length(temp_no_zero_hang_zuobiao));%全部转为正数 但是如果全部为负数
%         percent_patch1=sum(sum(A1))/(size(A1,1)*size(A1,2));%全部转为正数 但是如果全部为负数
%%
%**********************************处理patch2模块******************************
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;  
    %%*******************************求对应patch1突出度模块**************
           patch_I2 = I2(yy:yy+patch_size-1, xx:xx+patch_size-1);
           [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_I2~=0);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A2=(patch_I2-mean_I2)/mean_I2;%和自己比看都大多少
%         [k1,k2]=max(max(A1));
        percent_patch2=sum(sum(A2))/(length(temp_no_zero_hang_zuobiao));%全部转为正数 但是如果全部为负数
%         percent_patch2=sum(sum(A2))/(size(A2,1)*size(A2,2));%全部转为正数 但是如果全部为负数
 
%%***********************************end***************************** 
   %%****加权方式一配套****************************
   %如果采用方式二 这里就可以注释了
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
           eval(['cun_fenlei_patch1','=','temp_fenlei_patch2',num2str(channel),';']);
           w2=cun_xishu_patch1(:,windows);
           max_p2=cun_fenlei_patch1(windows);
       end
   end
       %%   
       %乘上字典模块 为了减少运算时间 如果为零的话 就不用那么麻烦了 直接赋值就行
%        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
       if sum(w1)==0
            patch_f_f1=zeros(64,1);
       else   
%           currentFile = sprintf('Dksvd%d.mat',max_p1);
%           load(currentFile);
          eval(['Dksvd','=','Dksvd',num2str(max_p1),';']);
          patch_f_f1=Dksvd*w1;
         
       end
       if sum(w2)==0
           patch_f_f2=zeros(64,1);
       else
%            cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
%            currentFile = sprintf('Dksvd%d.mat',max_p2);
%           load(currentFile);
           eval(['Dksvd','=','Dksvd',num2str(max_p2),';']);
          patch_f_f2=Dksvd*w2;
%           cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
       end
%         cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
      %%
        mean_f=(mean1+mean2)/2;
        sum_percent=abs(percent_patch1)+abs(percent_patch2);
       if percent_patch1 > percent_patch2  
             P1atch_f=zeros(8,8);
              temp_max=max(abs(percent_patch1),abs(percent_patch2));
              patch_f_f1=patch_f_f1+mean1;
               patch_f_f1= reshape(patch_f_f1, [patch_size, patch_size]);
              patch_f_f2=patch_f_f2+mean2;
              patch_f_f2= reshape(patch_f_f2, [patch_size, patch_size]);
              for k_1=1:8
                  for k_2=1:8
%                       if (uint8(patch_I1(k_1,k_2)))>mean_I1
%                           P1atch_f(k_1,k_2)=patch_f_f1(k_1,k_2)+patch_f_f2(k_1,k_2);   
%                           if abs((uint8(patch_f_f2(k_1,k_2))-uint8(P1atch_f(k_1,k_2))))>3%如果加了之后的差过于大了 那就不加了
%                               P1atch_f(k_1,k_2)=patch_f_f2(k_1,k_2);
%                           end
%                       else
                          P1atch_f(k_1,k_2)=patch_f_f2(k_1,k_2); 
%                       end
                  end
              end
                     Patch_f= reshape(P1atch_f, [patch_size, patch_size]);
       end
        if percent_patch1 < percent_patch2
              temp_max=max(abs(percent_patch1),abs(percent_patch2));
              %如果是彩色区域比重大 则全彩显示
%               if percent_patch1<0
                   P1atch_f=patch_f_f2+mean2;
               Patch_f= reshape(P1atch_f, [patch_size, patch_size]);
%                    P1atch_f=patch_f_f2+mean2+patch_f_f1*(1-(temp_max/sum_percent));
%               end
       end
       if percent_patch1 == percent_patch2
            Patch_f=patch_f_f2+mean2;
            Patch_f= reshape(Patch_f, [patch_size, patch_size]);
     end 
       
        
        F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
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
F = F./cntMat;   
Fusion_image(:,:,channel)=F;
end
 
figure;
imshow(uint8(Fusion_image),[]);
imwrite(uint8(Fusion_image),'./fusion_image.jpg');
end
%******************************************end**************************
%%
 


