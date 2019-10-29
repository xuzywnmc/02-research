%  Make the scatteres for a simulation and store
%  it in a file for later simulation use

%   Joergen Arendt Jensen, Feb. 26, 1997

[phantom_positions, phantom_amplitudes] = cyst_pht(100000);
  %定义血流位移量
  vp=800/1000;
  R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
  dz=R/25
            for i=1:25
                vr(i)=vp*(1-((dz*i)/R)^2);%定义的血流速度 抛物线函数
            end
                vr2=fliplr(vr);%翻转函数 翻转就是[1 2 3]翻转之后就是[3 2 1]
                vr1=[vr2,vr];%将两个抛物线拼起来
                s=[];
            for i=1:50
                t=1/50;
                s(i)=vr1(i)*t;%算出血流的位移量
            end
%  for j=1:50
            for i=1:50%血流的位移量-血流在血管内部散射点向是向X轴变化
        h=find(phantom_positions(:,3)>=(55.5/1000+dz*(i-1)) & phantom_positions(:,3)<=(55.5/1000+dz*i));
        phantom_positions(h,1)=phantom_positions(h,1)+s(i); 
        %此处找出h中 也就是血管内的变量中流出血管的值
        %find(phantom_positions(h,1)>20/1000 )这句已经把其重新排序了
        h1=find(phantom_positions(h,1)>20/1000 );
        h3=h(h1);
        %此处相当于就找出来原来在那里的值所对应的序号
        phantom_positions(h3,1)=-20/1000;
            end
            %%这么些有问题 因为相当于直接将全部都重新开始了 所以要先把血管内的跳出来
      
eval(['save pht_data/pht_data' num2str(1) ' phantom_positions phantom_amplitudes'])
%  end