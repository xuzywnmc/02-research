%%
clear;clc;
gengxin_flag=0;
%   Joergen Arendt Jensen, Feb. 26, 1997
  load pht_data_zuzhi/pht_data_zuzhi.mat
%   load pht_data_zuzhi/pht_data_xueliu.mat
%        phantom_positions=phantom_positions_zuzhi;
%      phantom_amplitudes=phantom_amplitudes_zuzhi;  
  %%%%%%%%
% eval(['save pht_data/pht_data' num2str(1) ' phantom_positions phantom_amplitudes'])
  %首先找出血流中血流分量
%  liu_1=find(phantom_positions_xueliu(:,3)>=(55.5/1000) & phantom_positions_xueliu(:,3)<=(64.5/1000));
%    phantom_positions_xueliu=phantom_positions_xueliu([liu_1],:);
%    phantom_amplitudes_xueliu=phantom_amplitudes_xueliu([liu_1],:);
%    phantom_positions_xueliu_copy=phantom_positions_xueliu;
%    phantom_amplitudes_xueliu_copy=phantom_amplitudes_xueliu;
 %首先找出组织中组织分量 本次使用找出血流并删除的方法
         %%
    %%******************************找出组织中哪些属于血流模块并完成拼接和备份****************************** 
    zuzhi_1=find(phantom_positions_zuzhi(:,3)>=(55.5/1000) & phantom_positions_zuzhi(:,3)<=(64.5/1000));
    tiaochu_phantom_positions_xueliu=phantom_positions_zuzhi([zuzhi_1],:);
    tiaochu_phantom_amplitudes_xueliu=phantom_amplitudes_zuzhi([zuzhi_1]);
    tiaochu_copy_phantom_positions_xueliu=tiaochu_phantom_positions_xueliu;
    tiaochu_copy_phantom_positions_xueliu(:,1)=tiaochu_copy_phantom_positions_xueliu(:,1)-50/1000;
%     temp1_phantom_amplitudes_xueliu=phantom_amplitudes_zuzhi([zuzhi_1],:);
    result_phantom_positions_xueliu=[tiaochu_phantom_positions_xueliu;tiaochu_copy_phantom_positions_xueliu];
    result_phantom_amplitudes_xueliu=[tiaochu_phantom_amplitudes_xueliu;tiaochu_phantom_amplitudes_xueliu];
    result_phantom_positions_xueliu_copy=result_phantom_positions_xueliu;
    result_phantom_amplitudes_xueliu_copy=result_phantom_amplitudes_xueliu;
  %%******************************END****************************** 
     %%
             %%
  %%******************************找出组织中哪些属于血管模块并完成拼接和备份****************************** 
    zuzhi_2=find((phantom_positions_zuzhi(:,3)>=(54.5/1000) & phantom_positions_zuzhi(:,3)<(55.5/1000)) | (phantom_positions_zuzhi(:,3)>(64.5/1000) & phantom_positions_zuzhi(:,3)<=(65.5/1000)));
    tiaochu_phantom_positions_xueguan=phantom_positions_zuzhi([zuzhi_2],:);
    tiaochu_phantom_amplitudes_xueguan=phantom_amplitudes_zuzhi([zuzhi_2]);
    tiaochu_copy_phantom_positions_xueguan=tiaochu_phantom_positions_xueguan;
    tiaochu_copy_phantom_positions_xueguan(:,1)=tiaochu_copy_phantom_positions_xueguan(:,1)-50/1000;
%     temp1_phantom_amplitudes_xueliu=phantom_amplitudes_zuzhi([zuzhi_1],:);
    result_phantom_positions_xueguan=[tiaochu_phantom_positions_xueguan;tiaochu_copy_phantom_positions_xueguan];
    result_phantom_amplitudes_xueguan=[tiaochu_phantom_amplitudes_xueguan;tiaochu_phantom_amplitudes_xueguan];
    result_phantom_positions_xueguan_copy=result_phantom_positions_xueguan;
    result_phantom_amplitudes_xueguan_copy=result_phantom_amplitudes_xueguan;
    hk1=find(result_phantom_positions_xueguan(:,1)>=(-25/1000-4.5/1000) & result_phantom_positions_xueguan(:,1)<(25/1000-4.5/1000));
  %%******************************END****************************** 
     %%
                  %%
    result_phantom_positions_zuzhi_copy=phantom_positions_zuzhi;
    result_phantom_amplitudes_zuzhi_copy=phantom_amplitudes_zuzhi;
%     point_up=tiaochu_phantom_positions_chunzuzhi;
%     result_phantom_amplitudes_chunzuzhi_copy=tiaochu_phantom_amplitudes_chunzuzhi;
  %%
%      zuzhi_1=find(phantom_positions_zuzhi(:,3)>=(55.5/1000) & phantom_positions_zuzhi(:,3)<=(64.5/1000));
%     down=find(result_phantom_positions_xueliu(:,1)>=(-30/1000) & result_phantom_positions_xueliu(:,1)<=(20/1000));
%     phantom_positions_zuzhi([zuzhi_1],:)=[];
%     phantom_amplitudes_zuzhi([zuzhi_1],:)=[];
%     phantom_positions_zuzhi_copy=phantom_positions_zuzhi;
%     phantom_amplitudes_zuzhi_copy=phantom_amplitudes_zuzhi;
% [phantom_positions, phantom_amplitudes] = cyst_pht(100000);
  vp=50/1000;%不要把血流速度弄那么大，刚好20帧，打算成像20张图
  R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
  dz=R/25%血管内的血流分成50份，每份的宽度
  L_X=50/1000;%血管总长
  dx=L_X/300;%长度为50的组织分成300份
  vp_1=1/1000;%组织及血管的最大位移
  flag=1;
  
  %%
  %*************************相位差定义*******************
  vr_vessel=zeros(1000,20);%500线 20张图所以有20个状态
  for i=1:20
      k5=abs(i-21);
      w(i)=k5;
  end
  %%
  %************************血管位移定义*******************
  for j=1:20
      if j==1
         xueguan_yidong(j)=flag*3/1000; 
      else
      xueguan_yidong(j)=xueguan_yidong(j-1)+flag*(2.5/1000);
      end
      if mod(j,2)==0%三次变一下
          flag=-flag;
      end
%       xueguan_yidong(6)=0;
%       xueguan_yidong(12)=0;
%       xueguan_yidong(18)=0;
  end
  %%
  %%%%%定义血管内血流的位移%%%%%%%%%%%%%%%%%%%%%%%%%
            for i=1:25
                vr(i)=vp*(1-((dz*i)/R)^2);%定义的血流速度 抛物线函数
            end
                vr2=fliplr(vr);%翻转函数 翻转就是[1 2 3]翻转之后就是[3 2 1]
                vr1=[vr2,vr];%将两个抛物线拼起来
                s=[];
            for i=1:50
                dt=1/20;%20张图 所以每张图1/20秒
                s(i)=vr1(i)*dt;%算出血流的位移量
            end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%&***************************定义相位差
      for j=1:20%二十张图
            for i=1:1000
                %用一个二维数组存储组织300线20个状态下的位移 每线初始相位差为1/300
                %在跑完十张图 每个点回到初始状态
               % vr_vessel(i,j)=vp_1*abs(sin(pi*((i/1000)*10+j/20)));%定义的血流速度 抛物线函数
%                 vr_vessel(i,j)=vp_1*abs(sin(pi*((i/2000)+j/40)));%定义的血流速度 抛物线函数
%             vr_vessel(i,j)=vp_1*abs(sin(pi*((i/1000)+j/20)));%定义的血流速度 抛物线函数
              vr_vessel(i,j)=vp_1*abs(sin(pi*((i/750)+w(j)/20)));%定义的血流速度 抛物线函数
            end
      end
    %%
 
  for j=1:20%%为了便于观察 第一张图不变
      %%
      %%
  %%******************************NEW 拼接血流备份模块1******************************    
       result_phantom_positions_xueliu=result_phantom_positions_xueliu_copy;
       result_phantom_amplitudes_xueliu=result_phantom_amplitudes_xueliu_copy;
  %%******************************end******************************
  %%
   %%******************************NEW 拼接血管备份模块1******************************    
       result_phantom_positions_xueguan=result_phantom_positions_xueguan_copy;
       result_phantom_amplitudes_xueguan=result_phantom_amplitudes_xueguan_copy;
  %%******************************end******************************
  %%
   %%******************************NEW 整体备份模块1******************************    
      phantom_positions_zuzhi=result_phantom_positions_zuzhi_copy;
     phantom_amplitudes_zuzhi=result_phantom_amplitudes_zuzhi_copy;
  %%******************************end******************************
  %%
%           phantom_positions_zuzhi=phantom_positions_zuzhi_copy;
%           phantom_amplitudes_zuzhi=phantom_amplitudes_zuzhi_copy;
%           phantom_positions_xueliu=phantom_positions_xueliu_copy;
%           phantom_amplitudes_xueliu=phantom_amplitudes_xueliu_copy;
%             for i=1:50%血流的位移量-血流在血管内部散射点向是向X轴变化
%                 h=find(phantom_positions_xueliu(:,3)>=(55.5/1000+dz*(i-1)) & phantom_positions_xueliu(:,3)<=(55.5/1000+dz*i));
%                 phantom_positions_xueliu(h,1)=phantom_positions_xueliu(h,1)+j*s(i); 
%                 %此处找出h中 也就是血管内的变量中流出血管的值
% %                 %find(phantom_positions(h,1)>20/1000 )这句已经把其重新排序了
% %                 h1=find(phantom_positions(h,1)>20/1000 );
% %                 h3=h(h1);
% %                 %此处相当于就找出来原来在那里的值所对应的序号
% %                 phantom_positions(h3,1)=-20/1000;
%             end
%             %找出那些是属于在选定范围内的
%%********************************traditional 模块一：血流位移**************************************
%                     for i=1:50%血流的位移量-血流在血管内部散射点向是向X轴变化
%                         h=find(result_phantom_positions_xueliu(:,3)>=(55.5/1000+dz*(i-1)) & result_phantom_positions_xueliu(:,3)<(55.5/1000+dz*i));
%                         result_phantom_positions_xueliu(h,1)=result_phantom_positions_xueliu(h,1)+(j-1)*5*s(i);                  
%                     end
%%**************************************end**************************************
%                     for i=1:50%血流的位移量-血流在血管内部散射点向是向X轴变化
%                         h=find(result_phantom_positions_xueliu(:,3)>=(55.5/1000+dz*(i-1)) & result_phantom_positions_xueliu(:,3)<(55.5/1000+dz*i));
%                         result_phantom_positions_xueliu(:,1)=result_phantom_positions_xueliu(:,1)+5/1000;                  
%                     end
   %找到属于-25/1000到25/1000之间的点
   %%
%%******************************NEW 血流流动模块1******************************
%%result_phantom_positions_xueliu是拼接之后的血流
%%result_phantom_amplitudes_xueliu是拼接之后的血流对应幅度
%%choose_phantom_positions_xueliu是待更新的血流段
%%zuzhi_1是全部组织中血流部分序号
   sum=0;
   choose_phantom_amplitudes_xueliu=[];
   choose_phantom_positions_xueliu=[];
   for i=1:50
       %找出其中一线的所有点
         h=find(result_phantom_positions_xueliu(:,3)>=(55.5/1000+dz*(i-1)) & result_phantom_positions_xueliu(:,3)<(55.5/1000+dz*i));
         %找到其中索要截取的点
         h2=find(result_phantom_positions_xueliu(h,1)>=((-25/1000)-(j-1)*s(i)) & result_phantom_positions_xueliu(h,1)<((25/1000)-(j-1)*s(i)));
         %转换为原始向量中的点
         h3=h(h2);
%             h1=find(result_phantom_positions_xueliu(:,1)>=(-25/1000-5/1000) & result_phantom_positions_xueliu(:,1)<=(25/1000-5/1000));
            temp_choose_phantom_positions_xueliu=result_phantom_positions_xueliu([h3],:);
            temp_choose_phantom_positions_xueliu(:,1)=temp_choose_phantom_positions_xueliu(:,1)+(j-1)*s(i);
            temp_choose_phantom_amplitudes_xueliu=result_phantom_amplitudes_xueliu([h3],:);
            choose_phantom_positions_xueliu=[choose_phantom_positions_xueliu;temp_choose_phantom_positions_xueliu];
            choose_phantom_amplitudes_xueliu=[choose_phantom_amplitudes_xueliu;temp_choose_phantom_amplitudes_xueliu];
        sum=sum+length(h3(:));
   end
             phantom_positions_zuzhi([zuzhi_1],:)=choose_phantom_positions_xueliu;
             phantom_amplitudes_zuzhi([zuzhi_1],:)=choose_phantom_amplitudes_xueliu;
             %%
%%******************************END******************************
%%***************血管来回移动模块**********************************
        %hk=find(result_phantom_positions_xueguan(:,1)>(-25.5/1000-xueguan_yidong(j)) & result_phantom_positions_xueguan(:,1)<(25.5/1000-xueguan_yidong(j)));
         %转换为原始向量中的点
         hk1=find(result_phantom_positions_xueguan(:,1)>=(-25/1000-xueguan_yidong(j)) & result_phantom_positions_xueguan(:,1)<(25/1000-xueguan_yidong(j)));
         temp_result_phantom_positions_xueguan=result_phantom_positions_xueguan(hk1,:);
         temp_result_phantom_positions_xueguan(:,1)=temp_result_phantom_positions_xueguan(:,1)+xueguan_yidong(j);
         phantom_positions_zuzhi([zuzhi_2],:)=temp_result_phantom_positions_xueguan;
         phantom_amplitudes_zuzhi([zuzhi_2],:)=result_phantom_amplitudes_xueguan(hk1,:)
         %%这里有很大问题就是当更新血管部分的时候 剩下的组织移动部分不同步
%%******************************END*************************
  %%******更新组织中需要上下移动点位置(其实更新不更新无所谓 因为测试值temp_point_flag=0)****************************** 
    point_up=find(phantom_positions_zuzhi(:,3)<(55.5/1000));
    point_down=find(phantom_positions_zuzhi(:,3)>(64.5/1000));
    if j==1
       temp_point_up=point_up;
    end
    if temp_point_up ~= point_up
        gengxin_flag=+1;
    end
     temp_point_up=point_up;
    %%
    %测试发现其实血管的点根本不在其中 后来发现是由于其取的位置原因
    pinjie=[point_up;point_down];
    [tf, index] = ismember(zuzhi_2,pinjie);
    %%
%     tiaochu_phantom_positions_chunzuzhi=phantom_positions_zuzhi([zuzhi_3],:);
%     tiaochu_phantom_amplitudes_chunzuzhi=phantom_amplitudes_zuzhi([zuzhi_3]);
% %     tiaochu_copy_phantom_positions_chuanzuzhi=tiaochu_phantom_positions_chuanzuzhi;
% %     tiaochu_copy_phantom_positions_chuanzuzhi(:,1)=tiaochu_copy_phantom_positions_chuanzuzhi(:,1)-50/1000;
% % %     temp1_phantom_amplitudes_xueliu=phantom_amplitudes_zuzhi([zuzhi_1],:);
% %     result_phantom_positions_xueguan=[tiaochu_phantom_positions_xueguan;tiaochu_copy_phantom_positions_xueguan];
% %     result_phantom_amplitudes_xueguan=[tiaochu_phantom_amplitudes_xueguan;tiaochu_phantom_amplitudes_xueguan];
  %%******************************END****************************** 
%%
%%*********************************定义组织移动***********************************
                        for k=1:1000
                              %找到属于每一份内的值所在位置
                            k1=find(phantom_positions_zuzhi(point_up,1)>=(-25/1000+dx*(k-1)) & phantom_positions_zuzhi(point_up,1)<(-25/1000+dx*k));
                            %再把这一区域内所有的都加上自己的移动幅度 组织上边是减去幅度z
                            %****************遗漏的点 此处也要重新排序****************
                            k2=point_up(k1);
                            %由于此处是保留原始图像 所以需要从j-1
                            phantom_positions_zuzhi(k2,3)=phantom_positions_zuzhi(k2,3)-vr_vessel(k,j); 
                            
                            k3=find(phantom_positions_zuzhi(point_down,1)>=(-25/1000+dx*(k-1)) & phantom_positions_zuzhi(point_down,1)<(-25/1000+dx*k));
                            %再把这一区域内所有的都加上自己的移动幅度 组织上边是减去幅度z
                            %****************遗漏的点 此处也要重新排序****************
                            k4=point_down(k3);
                            %由于此处是保留原始图像 所以需要从j-1
                            phantom_positions_zuzhi(k4,3)=phantom_positions_zuzhi(k4,3)+vr_vessel(k,j); 
                          end
%%
%              phantom_positions=phantom_positions_zuzhi;
%              phantom_amplitudes=phantom_amplitudes_zuzhi;     
%             choose_phantom_amplitudes_xueliu=phantom_amplitudes_xueliu([h1],:);
%             phantom_amplitudes=[phantom_amplitudes_zuzhi;choose_phantom_amplitudes_xueliu]
            %%这么些有问题 因为相当于直接将全部都重新开始了 所以要先把血管内的跳出来
            
%  %%%%%测试如果没有血流的样子
     phantom_positions=phantom_positions_zuzhi;
     phantom_amplitudes=phantom_amplitudes_zuzhi;  
%   %%%%%%%%
  eval(['save pht_data/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])
 end