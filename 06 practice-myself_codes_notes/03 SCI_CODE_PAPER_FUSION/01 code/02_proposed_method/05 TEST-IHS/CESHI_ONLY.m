%************************************I����Ϊ���� RGB�ں�ʵ��************
%ע���1 ����ı����ֵ��ʽ��ʱ�� ��Ҫ�ı�percent_patch2�ط�����ֵ��ʽ
%ע���2 �˴����ָ��ܴ��bug �Ǿ�������percent��������ʱ ���a=0 ��ô�������жϴ����㻹��С���� ���ǲ�����
% �����
% a=0/0;
% % a=1;
% if a>-0.2
%     k=3;
% end
% ע���3 load������ʵ�ܷ�ʱ��
close all
%�������ǵ����ּ�Ȩ�������ں�ʵ��
clc;clear;
test_ronghe=1;
shangxian=1;
xiaxian=0;
    bufen=1;
zhuangzai_xishu=1;%����Ԥ��ѵ���ֵ��ȡϵ��֮�����ں�
   jiaquan=1;%��Ȩ��ʽѡ��
if test_ronghe==1
          for ii=1:7
        %     cd('.\MAT_DATA');%�˴�������� ����ý��ֵ��ļ����Ƶ�����ķ��� װ����ʵ�ܷ�ʱ��
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
           currentFile = sprintf('Dksvd%d.mat',ii);
           load(currentFile);
            eval(['Dksvd',num2str(ii),'=','Dksvd',';']);
        cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
        %
        end
    if zhuangzai_xishu==1%Ԥ��װ�ؽ�ʡʱ��
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
%�˴��ı����ֵ�ķ�ʽ
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
        %ע��㣺Ϊ�˱��⿪ͷע���2���� �ֽ���Ԥ���� ���ж��ǲ���Ϊ0
 
        %%
%         ******************����patch1ģ��***********************************
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
         %%*******************************���Ӧpatch1ͻ����ģ��**************
        patch_I1 = I1(yy:yy+patch_size-1, xx:xx+patch_size-1);
        [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_I1~=0);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A1=(patch_I1-mean_I1)/mean_I1;%���Լ��ȿ��������
%         [k1,k2]=max(max(A1));
            percent_patch1=sum(sum(A1))/(length(temp_no_zero_hang_zuobiao));%ȫ��תΪ���� �������ȫ��Ϊ����
%         percent_patch1=sum(sum(A1))/(size(A1,1)*size(A1,2));%ȫ��תΪ���� �������ȫ��Ϊ����
%%
%**********************************����patch2ģ��******************************
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;  
    %%*******************************���Ӧpatch1ͻ����ģ��**************
           patch_I2 = I2(yy:yy+patch_size-1, xx:xx+patch_size-1);
           [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_I2~=0);
%         mean_patch_I1=sum(sum(patch_I1))/(size(patch_I1,1)*size(patch_I1,2));
%         mean_b=sum(sum(B))/(size(B,1)*size(B,2));
        A2=(patch_I2-mean_I2)/mean_I2;%���Լ��ȿ��������
%         [k1,k2]=max(max(A1));
        percent_patch2=sum(sum(A2))/(length(temp_no_zero_hang_zuobiao));%ȫ��תΪ���� �������ȫ��Ϊ����
%         percent_patch2=sum(sum(A2))/(size(A2,1)*size(A2,2));%ȫ��תΪ���� �������ȫ��Ϊ����
 
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
       %�����ֵ�ģ�� Ϊ�˼�������ʱ�� ���Ϊ��Ļ� �Ͳ�����ô�鷳�� ֱ�Ӹ�ֵ����
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
%                           if abs((uint8(patch_f_f2(k_1,k_2))-uint8(P1atch_f(k_1,k_2))))>3%�������֮��Ĳ���ڴ��� �ǾͲ�����
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
              %����ǲ�ɫ������ش� ��ȫ����ʾ
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
 


