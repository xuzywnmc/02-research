close all%���һ����Ҫ��';'��
%������������ּ�Ȩ��ʽ���ں�ʵ��
clc;clear;
%%
% zhanshi=0;
% if zhanshi==1
% figure;
% imshow(uint8(Fusion_image),[]);
% end
%%
%******************************************���ֵʵ��***************
junzhi=0;
if junzhi==1
    a=-9;b=2;
    c=max(abs(a),abs(2));
A=[1,2,3;4,15,6;7,8,9];
B=[11,12,13;14,15,16;17,18,19];
mean_a=sum(sum(A))/(size(A,1)*size(A,2));
mean_b=sum(sum(B))/(size(B,1)*size(B,2));
A1=(A-mean_a)/mean_a;
[k1,k2]=max(max(A1));
A2=A1+k1;
B1=(B-mean_b)/mean_b;

end
%%***********************************end**************************
%%
%%*********���ֱ���mat�ļ���ʽ�������м�������Ĳ���***%*********
% index=1;
% k='I';
% name=[k,'index.mat'];
%    save(name,index);
%    k='H';
% name=[k,'index.mat'];
%            currentFile = sprintf(name,i+(index-1)*10);
%         save(currentFile,'fen_data','fen_geshu');
%*********%*********%*********%*********%*********%*********
%%
%%**************�ֵ�ָ�ʵ��**************
% image_input1=double(imread('./2.jpg'));
% image_input2=double(imread('./3.jpg'));
% % [OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
% for channel=0:2
% A=OUTPUT(:,:,channel+1);%ȡI����
% % image_input1=A;
% % �Ƚ���С��ģʵ�� ȡ�ķ�֮һ ��С������
% figure;
% imshow(uint8(A),[]);
% [F]=USE_DICTIONARY(A,channel);
% figure;
% imshow(uint8(F),[]);
% end
%******************************
%%
%%
%%
%*********************************I������Ȩƽ��ʵ��***********************
jiaquan=0;
if jiaquan==1
    image_input1=double(imread('./2.jpg'));
image_input2=double(imread('./3.jpg'));
image_input1=imresize(image_input1,[255 255]);
image_input2=imresize(image_input2,[255 255]);
A=image_input1(50:size(image_input1,1)/2+50,50:50+size(image_input1,2)/2);
B=image_input2(50:size(image_input1,1)/2+50,50:50+size(image_input2,2)/2);
figure;
imshow(uint8(A),[]);
figure;
imshow(uint8(B),[]);
mean_a=sum(sum(A))/(size(A,1)*size(A,2));
mean_b=sum(sum(B))/(size(B,1)*size(B,2));
[I1,FORRI,AA,BB]=RGB2IHS(A);
[I2,FORRI,AA,BB]=RGB2IHS(B);
I1=I1(:,:,1);
I2=I2(:,:,1);
r=180/dic_number;
patch_size=8;
overlap=7;
[h,w]=size(B);
F=zeros(h,w);
cntMat=zeros(h,w);
gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;
for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        xx = gridx(ii);
        yy = gridy(jj);
        
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;
    end
end

end
%*********************************end***********************************
%%
%************************************I����Ϊ���� RGB�ں�ʵ��************
test_ronghe=1;
shangxian=70;
xiaxian=69;
    bufen=4;
zhuangzai_xishu=1;%����Ԥ��ѵ���ֵ��ȡϵ��֮�����ں�
   jiaquan=2;%��Ȩ��ʽѡ��
if test_ronghe==1
    if zhuangzai_xishu==1%Ԥ��װ�ؽ�ʡʱ��
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
        windows=windows+1;
        xx = gridx(ii);
        yy = gridy(jj);
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;

 %%*******************************���Ӧ����patch**************
        patch_I1 = I1(yy:yy+patch_size-1, xx:xx+patch_size-1);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A1=(patch_I1-mean_I1)/mean_I1;%���Լ��ȿ��������
%         [k1,k2]=max(max(A1));
        percent_patch1=sum(sum(A1))/(size(A1,1)*size(A1,2));%ȫ��תΪ���� �������ȫ��Ϊ����
        %��϶���ת���������� �������岻��
        
           patch_I2 = I2(yy:yy+patch_size-1, xx:xx+patch_size-1);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A2=(patch_I2-mean_I2)/mean_I2;%���Լ��ȿ��������
%         [k1,k2]=max(max(A1));
        percent_patch2=sum(sum(A2))/(size(A2,1)*size(A2,2));%ȫ��תΪ���� �������ȫ��Ϊ����
%%***********************************end***************************** 
   %%****��Ȩ��ʽһ����****************************
   %������÷�ʽ�� ����Ϳ���ע����
   if jiaquan==1 | 2
       if zhuangzai_xishu==0%��ϵ����ȡ��ʽ ����ͨ������ϵ���ķ�ʽ��ȡ
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
        mean_f=(mean1+mean2)/2;
        sum_percent=abs(percent_patch1)+abs(percent_patch2);
       if percent_patch1 > percent_patch2     
                               %%
                          %*************************��Ȩ��ʽ������******************************
                          if jiaquan==2
%                                if zhuangzai_xishu==0%��ϵ����ȡ��ʽ ����ͨ������ϵ���ķ�ʽ��ȡ
%                                       [F1,xishu,max_p1]=USE_DICTIONARY(patch_1,0);
%                                       w=xishu;
%                                else
%                                        disp('percent_patch1 > percent_patch2 jiaquan=2 zhuangzai_xishu=1');
%                                        eval(['cun_fenlei_patch1','=','temp_fenlei_patch1',num2str(channel),';']);
%                                        max_p1=cun_fenlei_patch1(windows);
%                                        w=cun_xishu_patch1(:,windows);
%                                end
                               w=w1;
                          end
                               %%***************************��Ȩ��ʽһ����**********************
                          else if jiaquan==1
                                   temp_max=max(abs(percent_patch1),abs(percent_patch2));
                                   w=w1*(temp_max/sum_percent)+w2*(1-(temp_max/sum_percent));
                              end
                          
                    %%
                          cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
                          currentFile = sprintf('Dksvd%d.mat',max_p1);
                          load(currentFile);
                          patch_f=Dksvd*w;
                          cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
       end
        if percent_patch1 < percent_patch2
           %%
                               %��ʽ���ײ�
                               if jiaquan==2
%                                     if zhuangzai_xishu==0%��ϵ����ȡ��ʽ ����ͨ������ϵ���ķ�ʽ��ȡ
%                                           [F2,xishu,max_p2]=USE_DICTIONARY(patch_2,0);
%                                           w2=xishu;
%                                     else
%                                            disp('percent_patch1 < percent_patch2 jiaquan=2 zhuangzai_xishu=1');
%                                            eval(['cun_fenlei_patch1','=','temp_fenlei_patch2',num2str(channel),';']);
%                                            max_p2=cun_fenlei_patch1(windows);
%                                            w=cun_xishu_patch1(:,windows);
%                                     end
                                      w=w2;
                                end
                               else if jiaquan==1
                               %%
                               %��ʽһ�ײ�
                               temp_max=max(abs(percent_patch1),abs(percent_patch2));
                               w=w2*(temp_max/sum_percent)+w1*(1-(temp_max/sum_percent));
                                   end      
                               cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
                                currentFile = sprintf('Dksvd%d.mat',max_p2);
                                load(currentFile);
                                 patch_f=Dksvd*w;
                                 cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');

       end
       if percent_patch1 == percent_patch2
                     if zhuangzai_xishu==0%��ϵ����ȡ��ʽ ����ͨ������ϵ���ķ�ʽ��ȡ
                  [F1,xishu,max_p1]=USE_DICTIONARY(patch_1,0);
                  w1=xishu;
                  [F2,xishu,max_p2]=USE_DICTIONARY(patch_2,0);
                  w2=xishu;
               else
                   eval(['cun_fenlei_patch1','=','temp_fenlei_patch1',num2str(channel),';']);
                   max_p1=cun_fenlei_patch1(windows);
                   w1=cun_xishu_patch1(:,windows);

                   eval(['cun_fenlei_patch1','=','temp_fenlei_patch2',num2str(channel),';']);
                   w2=cun_xishu_patch1(:,windows);
                end
            w=(1/2)*(w1+w2);
            cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
            currentFile = sprintf('Dksvd%d.mat',max_p1);
            load(currentFile);
             patch_f=Dksvd*w;
             cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');

     end 
        Patch_f = reshape(patch_f, [patch_size, patch_size]);
        Patch_f = Patch_f + mean_f;
        
        F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
    end
    %cnt
   fprintf([num2str(ii), ' rows have been processed\n']);
    if mod(ii,5)==0
        disp(['The channel ', num2str(channel),' was working!']);      
    end
end

%idx���߼�ֵ ����֪�����������λ���߼�ֵ��Ϊ1 ��
%��������κβ���
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
