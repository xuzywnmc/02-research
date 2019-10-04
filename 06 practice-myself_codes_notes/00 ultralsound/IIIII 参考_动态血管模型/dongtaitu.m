[phantom_positions, phantom_amplitudes] = cyst_pht(10000);
R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
vp=800/1000;
d=1/1000;
d1=[];
for i=1:30
   t=1/50;%定义帧数
    d1(i)=(d*(1/30)*i)*sin(pi*t);%定义的血管位移量 以正弦函数波动
end
            %定义血流位移量
            for i=1:15
                vr(i)=vp*(1-((0.3/1000*i)/R).^2);%定义的血流速度 抛物线函数
            end
                vr2=fliplr(vr);%翻转函数 翻转就是[1 2 3]翻转之后就是[3 2 1]
                vr1=[vr2,vr];%将两个抛物线拼起来
                s=[];
            for i=1:30
                t=1/50;
                s(i)=vr1(i)*t;%算出血流的位移量
            end
%之所以这个for循环这么写也能说得通 就是因为每一个for循环都是将phantom_positions
%更新一次在血管范围内位置数据
%而位置数据变化 则相当于位置数据对应点幅度数据就移动了
for j=1:25
    for i=1:30%把血管的位移量分别加到每一份的血管上-血管是Z轴变化的
        h=find(phantom_positions(:,3)>=(54.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(54.5+(1/30)*i)/1000);
        %find函数就是找到数组中非零元素所在的位置
        %a(:,3)表示取第三列
        %至于这里数据为什么是54.5开始 是因为血管内径是9 所以
        %血管内径应该从54.5开始
        %这里相当于就是将囊肿位置中在这个位置之间的拿出来
        %囊肿是z = rand (N,1)*z_size（60） + z_start（30）
        %54.5到55.5之间
        h1=find(phantom_positions(:,3)>=(64.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(64.5+(1/30)*i)/1000);
        %64.5到65.5之间
        %
        phantom_positions(h,3)=phantom_positions(h,3)+d1(i); 
        phantom_positions(h1,3)=phantom_positions(h1,3)+d1(i); 
    end
    for i=1:30%血流的位移量-血流在血管内部散射点向是向X轴变化
        h=find(phantom_positions(:,3)>=(55.5+0.3*(i-1))/1000 & phantom_positions(:,3)<=(55.5+0.3*i)/1000);
        phantom_positions(h,1)=phantom_positions(h,1)+s(i); 
        %此处phantom_position(h,1)是x轴 所以是向前流
    %55.5到64.5之间
    %详情见于超声进展图片
    end
    eval(['save pht_data/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])%保存数据
end
for j=26:50
        for i=1:30
            h=find(phantom_positions(:,3)>=(54.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(54.5+(1/30)*i)/1000);
            h1=find(phantom_positions(:,3)>=(64.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(64.5+(1/30)*i)/1000);
            phantom_positions(h,3)=phantom_positions(h,3)+d1(i); 
            phantom_positions(h1,3)=phantom_positions(h1,3)+d1(i); 
        end
        for i=1:30
            h=find(phantom_positions(:,3)>=(55.5+0.3*(i-1))/1000 & phantom_positions(:,3)<=(55.5+0.3*i)/1000);
            phantom_positions(h,1)=phantom_positions(h,1)+(40/1000)-s(i); 
        end
    eval(['save pht_data/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])
end


