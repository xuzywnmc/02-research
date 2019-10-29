
% [phantom_positions, phantom_amplitudes] = cyst_pht(100000);
cmd=['load pht_data_1/pht_data',num2str(1),'.mat'];
          disp(cmd)
          eval(cmd)
%%%%%%%%%%%%%%%%%关于动态血管模型的说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TIPS@1:血流速度不要弄那么大，否则造成效果不明显，根据需要采集图片数目合理设置；

% TIPS@2:制作血流流动模型时，一定要把第一次生成的囊肿参数存储起来，如不采取存储
% 形式，容易造成浪涌形式的血流，不利于观察,而如果采用每次生成新的，
% 由于其是随机的，不可取
phantom_positions_copy=phantom_positions;
phantom_amplitudes_copy=phantom_amplitudes;

%%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %定义血流位移量
  vp=50/1000;%不要把血流速度弄那么大，刚好20帧，打算成像20张图
  %50/1000=vp*a*dt=vp*20*1/20 故vp=50/1000
  R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
  dz=R/25%血管内的血流分成50份，每份的宽度
  L_X=50/1000;%血管总长
  dx=L_X/300;%长度为50的组织分成300份
  vp_1=1/1000;%组织及血管的最大位移
  vr_vessel=zeros(1000,20);%500线 20张图所以有20个状态
  for i=1:20
      k5=abs(i-21);
      w(i)=k5;
  end
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
    %%%%%定义组织及血管的位移%%%%%%%%%%%%%%%%%%%%%%%%%
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
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
 point_up=find(phantom_positions(:,3) <(55.5/1000));
 point_down=find(phantom_positions(:,3)>=64.5/1000);
 for j=2:20%二十张图
              phantom_positions=phantom_positions_copy;
              phantom_amplitudes=phantom_amplitudes_copy;
                          for k=1:1000
                              %找到属于每一份内的值所在位置
                            k1=find(phantom_positions(point_up,1)>=(-25/1000+dx*(k-1)) & phantom_positions(point_up,1)<(-25/1000+dx*k));
                            %再把这一区域内所有的都加上自己的移动幅度 组织上边是减去幅度z
                            %****************遗漏的点 此处也要重新排序****************
                            k2=point_up(k1);
                            %由于此处是保留原始图像 所以需要从j-1
                            phantom_positions(k2,3)=phantom_positions(k2,3)-vr_vessel(k,j-1); 
                            
                            k3=find(phantom_positions(point_down,1)>=(-25/1000+dx*(k-1)) & phantom_positions(point_down,1)<(-25/1000+dx*k));
                            %再把这一区域内所有的都加上自己的移动幅度 组织上边是减去幅度z
                            %****************遗漏的点 此处也要重新排序****************
                            k4=point_down(k3);
                            %由于此处是保留原始图像 所以需要从j-1
                            phantom_positions(k4,3)=phantom_positions(k4,3)+vr_vessel(k,j-1); 
                          end
                    for i=1:50%血流的位移量-血流在血管内部散射点向是向X轴变化
                        h=find(phantom_positions(:,3)>=(55.5/1000+dz*(i-1)) & phantom_positions(:,3)<(55.5/1000+dz*i));
                        phantom_positions(h,1)=phantom_positions(h,1)+j*s(i); 
                        %此处找出h中 也就是血管内的变量中流出血管的值
                        h1=find(phantom_positions(h,1)>25/1000 );
                        h3=h(h1);
                        %此处相当于就找出来原来在那里的值所对应的序号
                        phantom_positions(h3,1)=-25/1000;
                    end
               eval(['save pht_data_1/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])
end
%  end