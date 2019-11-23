%本程序用来算HSV变换V分量和H分量和S分量突出度 及对于改变图像帮助度
close all
clc;clear;
patch_I1 = [1,2,3,4;1,2,0,3;1,2,3,4;1,2,0,3];
TEMP_patch_I1=zeros(4,4);
[temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_I1~=0);
TEMP_patch_I1(temp_no_zero_hang_zuobiao,temp_no_zero_liebiao)=patch_I1(temp_no_zero_hang_zuobiao,temp_no_zero_liebiao);
% A1=(patch_I1-mean_I1)/mean_I1;%和自己比看都大多少
% percent_patch1=sum(sum(A1))/(length(temp_no_zero_hang_zuobiao))
Fusion_image=double(imread('jiaquan28.jpg'));
 figure;
 imshow(uint8(Fusion_image),[]);
 [H_1,S_1,V_1]=RGB2HBV(Fusion_image);
  figure;
  imagesc(H_1);
    figure;
  imagesc(S_1);
    figure;
  imagesc(V_1);
    [max_H_1_value,b1]=max(max(H_1));
  [min_H_1_value,b6]=min(min(H_1)); 
  [max_S_1_value,b1]=max(max(S_1));
  [min_S_1_value,b6]=min(min(S_1));
  [max_V_1_value,b1]=max(max(V_1));
  [min_V_1_value,b6]=min(min(V_1));
%  figure;
%  imshow(uint8(OUTPUT_H),[]);
%  figure;
%  imshow(uint8(OUTPUT_S),[]);
[H2_zero1,H2_zero2]=find(H_1>0);
[S2_zero1,S2_zero2]=find(S_1>0);
[V2_zero1,S2_zero2]=find(V_1>0);
%此处改变算均值的方式
mean_H=sum(sum(H_1))/(length(H2_zero1));
mean_S=sum(sum(S_1))/(length(S2_zero1));
mean_V=sum(sum(V_1))/(length(V2_zero1));
[h,w]=size(H_1);

patch_size=8;
overlap=7;
gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;
mean_H_value=zeros(length(gridx),length(gridy));
mean_S_value=zeros(length(gridx),length(gridy));
mean_V_value=zeros(length(gridx),length(gridy));
% for channel=1:3
[kuan,chang]=size(H_1);
%%
%%%方差及HSV变换H和S分量,V分量
F=zeros(kuan,chang);
cntMat=zeros(kuan,chang);
 F_percent_patch1=zeros(kuan,chang);
 cntMat_percent_patch1=zeros(kuan,chang);
  F_percent_patch2=zeros(kuan,chang);
 cntMat_percent_patch2=zeros(kuan,chang);
 %%
 %%

 %%
 for ii = 1:length(gridx)
                for jj = 1:length(gridy)
                    xx = gridx(ii);
                    yy = gridy(jj);

                    %%*******************************求H分量突出度模块**************
                    patch_H1 = H_1(yy:yy+patch_size-1, xx:xx+patch_size-1);
                    [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_H1~=0);
                    if length(temp_no_zero_hang_zuobiao)==0
                        percent_patch1=0;
                    else
%                     A1=(patch_I1-mean_I1)/mean_I1;%和自己比看都大多少
                    percent_patch1=sum(sum(patch_I1))/(length(temp_no_zero_hang_zuobiao));%全部转为正数 但是如果全部为负数
                    percent_patch1=(percent_patch1-mean_H)/mean_H;
                    end
                    mean_H_value(yy,xx)=percent_patch1;
                     F_percent_patch1(yy:yy+patch_size-1, xx:xx+patch_size-1) = F_percent_patch1(yy:yy+patch_size-1, xx:xx+patch_size-1) + percent_patch1;
                     cntMat_percent_patch1(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat_percent_patch1(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                    %%
                    %%*******************************求对应S分量突出度模块**************
                     patch_S2 = S_1(yy:yy+patch_size-1, xx:xx+patch_size-1);
                    [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_S2~=0);
%                     A2=(patch_I2-mean_I2)/mean_I2;%和自己比看都大多少
                    if length(temp_no_zero_hang_zuobiao)==0
                             percent_patch2=0;
                     else
                    percent_patch2=sum(sum(patch_S2))/(length(temp_no_zero_hang_zuobiao));%全部转为正数 但是如果全部为负数
                    percent_patch2=(percent_patch2-mean_S)/mean_S;
                    end
%                     mean_S_value(yy,xx)=percent_patch2;
                     F_percent_patch2(yy:yy+patch_size-1, xx:xx+patch_size-1) = F_percent_patch2(yy:yy+patch_size-1, xx:xx+patch_size-1) + percent_patch2;
                     cntMat_percent_patch2(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat_percent_patch2(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
                    %%***********************求V分量突出度***************
                      patch_V2 = V_1(yy:yy+patch_size-1, xx:xx+patch_size-1);
                    [temp_no_zero_hang_zuobiao,temp_no_zero_liebiao]=find(patch_V2~=0);
%                     A2=(patch_I2-mean_I2)/mean_I2;%和自己比看都大多少
                    if length(temp_no_zero_hang_zuobiao)==0
                             percent_patch2=0;
                     else
                    percent_patch2=sum(sum(patch_V2))/(length(temp_no_zero_hang_zuobiao));%全部转为正数 但是如果全部为负数
                    percent_patch2=(percent_patch2-mean_V)/mean_V;
                    end
%                     mean_V_value(yy,xx)=percent_patch2;

          F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + percent_patch2;
         cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
         
         
  
               fprintf([num2str(ii), ' rows have been processed\n']);
               fprintf([num2str(jj), ' cols have been processed\n']);
                if mod(ii,5)==0
%                     disp(['The channel ', num2str(channel),' was working!']);      
                end
               end
 end
% end
%  [max_mean_I_value,b1]=max(max(mean_I_value));
%  [max_mean_S_value,b2]=max(max(mean_S_value));
%   [min_mean_I_value,b3]=min(min(mean_I_value));
%  [min_mean_S_value,b4]=min(min(mean_S_value));
%  [max_var_image_value,b5]=max(max(var_image_value));
%   [min_var_image_value,b6]=min(min(var_image_value));
  

%     F_percent_patch1 = F_percent_patch1./cntMat_percent_patch1; 
%   [max_cntMat_mean_H_value,b1]=max(max(F_percent_patch1));
%   [min_cntMat_mean_H_value,b6]=min(min(F_percent_patch1));
%     figure;
%   imagesc(F_percent_patch1);
%     F_percent_patch2 = F_percent_patch2./cntMat_percent_patch2; 
%   [max_cntMat_mean_S_value,b1]=max(max(F_percent_patch2));
%   [min_cntMat_mean_S_value,b6]=min(min(F_percent_patch2));
% %     figure;
% %   imagesc(F_percent_patch2);
%     F = F./cntMat; 
%   [max_var_F_value,b1]=max(max(F));
%   [min_var_F_value,b6]=min(min(F));
%   figure;
%   imagesc(F);
%   OUTPUT_I1=zeros(256,256);
%     OUTPUT_H1=zeros(256,256);
%     OUTPUT_S1=zeros(256,256);
%   kkk=OUTPUT_I(241,103);
%   OUTPUT_I1(241,103)=kkk;
%     OUTPUT_I= OUTPUT_I*2;
H=0;
S=0;
V=0;
  for k_1=1:256
      for k_2=1:256
          H=(H_1(k_1,k_2)-min_H_1_value)/(max_H_1_value-min_H_1_value);
          S=(S_1(k_1,k_2)-min_S_1_value)/(max_S_1_value-min_S_1_value);
          V=(V_1(k_1,k_2)-min_V_1_value)/(max_V_1_value-min_V_1_value);
%           OUTPUT_I1(k_1,k_2)=(OUTPUT_I(k_1,k_2))*(1+(1-V)*1/(S+H));
%           OUTPUT_H1(k_1,k_2)=(Fusion_image(k_1,k_2,3)-(1/sqrt(3))*OUTPUT_I1(k_1,k_2))*(-sqrt(6)/2);
%           OUTPUT_S1(k_1,k_2)=(Fusion_image(k_1,k_2,1)-(1/sqrt(3))*OUTPUT_I1(k_1,k_2)-(1/sqrt(6))*OUTPUT_H1(k_1,k_2))*(sqrt(2));
%           S_1(k_1,k_2)=0.21;
           S_1(k_1,k_2)=S_1(k_1,k_2)*(1+1/(V+log(1+S/H)));
           V_1(k_1,k_2)=V_1(k_1,k_2)*2/(1+1/(V+log(1+S/H)));
%           OUTPUT_H1(k_1,k_2)=(OUTPUT_H(k_1,k_2))*(1+1/(S));
%              OUTPUT_H1(k_1,k_2)=(OUTPUT_H(k_1,k_2))*(1+1/V*(H)*(1/S));
%           OUTPUT_S1(k_1,k_2)=(OUTPUT_S(k_1,k_2))*(1+1/V*(H)*(1/S));
 
 
      end
  end
%   if OUTPUT_I1==OUTPUT_I
%       kk=44;
%   end
%  OUTPUT(:,:,1)=OUTPUT_I1;
%  OUTPUT(:,:,2)=OUTPUT_H1;
%  OUTPUT(:,:,3)=OUTPUT_S1;
%   OUTPUT1=IHS2RGB(OUTPUT);
%    figure;
%  imshow(uint8(OUTPUT1));
%   [med] = PAL(OUTPUT1)
%   output=zeros(size(OUTPUT_I1,1),size(OUTPUT_I1,2),3);
% for channel=1:3
%     output(:,:,channel)=med(1:size(med,1),(size(OUTPUT_I1,2)*(channel-1))+1:(size(OUTPUT_I1,2)*channel))
% end
img=HBV2RGB(H_1,S_1,V_1);
 figure;
 imshow(img);
