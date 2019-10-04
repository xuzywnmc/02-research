[phantom_positions, phantom_amplitudes] = cyst_pht(10000);
R=4.5/1000;
vp=800/1000;
d=1/1000;
d1=[];
for i=1:30
   t=1/50;%定义帧数
    d1(i)=(d*(1/30)*i)*sin(pi*t);%定义的血管位移量 以正弦函数波动
end
for i=1:15
    vr(i)=vp*(1-((0.3/1000*i)/R).^2);%定义的血流速度 抛物线函数
end
vr2=fliplr(vr);%翻转函数 
vr1=[vr2,vr];%将两个抛物线拼起来
s=[];
for i=1:30
t=1/50;
s(i)=vr1(i)*t;%算出血流的位移量
end

for j=1:25
  for i=1:30%把血官的位移量分别加到每一份的血管上
    h=find(phantom_positions(:,3)>=(54.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(54.5+(1/30)*i)/1000);
    h1=find(phantom_positions(:,3)>=(64.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(64.5+(1/30)*i)/1000);
    phantom_positions(h,3)=phantom_positions(h,3)+d1(i); 
    phantom_positions(h1,3)=phantom_positions(h1,3)+d1(i); 
end
for i=1:30%血流的位移量
    h=find(phantom_positions(:,3)>=(55.5+0.3*(i-1))/1000 & phantom_positions(:,3)<=(55.5+0.3*i)/1000);
    phantom_positions(h,1)=phantom_positions(h,1)+s(i); 
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


