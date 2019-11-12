
%*********************************end***********************************
%%
test_ronghe=1;
shangxian=70;
xiaxian=69;
if test_ronghe==1
    bufen=2;
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
overlap=7;
A100=A;
B100=B;
for channel=1:3
A=A100(:,:,channel);
B=B100(:,:,channel)
[h,w]=size(B);
F=zeros(h,w);
cntMat=zeros(h,w);

gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;
dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
cun_xishu_patch1=zeros(256,length(gridx)*length(gridy));
cun_fenlei_patch1=zeros(length(gridx)*length(gridy),1);
cun_xishu_patch2=zeros(256,length(gridx)*length(gridy));
cun_fenlei_patch2=zeros(length(gridx)*length(gridy),1);
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
%%
%存第一张图像相关系数
       [F1,xishu,max_p1]=USE_DICTIONARY(patch_1,0);
       cun_xishu_patch1(:,windows)=xishu;   
       cun_fenlei_patch1(windows)=max_p1;
    cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');

       currentFile = sprintf('%dzidian_xishu_patch1.mat',channel);
       save(currentFile,'cun_xishu_patch1')
       
        currentFile = sprintf('%dfenlei_patch1.mat',channel);
       save(currentFile,'cun_fenlei_patch1')
       cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
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
   fprintf([num2str(ii), ' rows have been processed\n']);
    if mod(ii,5)==0
        disp(['The channel ', num2str(channel),' was working!']);      
    end
    end
end


%idx是逻辑值 所以知道其如果所在位置逻辑值不为1 则
%不会进行任何操作

end
end


%******************************************end**************************
%%
