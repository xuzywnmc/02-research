i=imread('E:\科研\代码\Project\pic0.jpg'); 
I=rgb2gray(i);
figure(1);
imshow(I);title('灰度图像')
%选取分析区域
k = waitforbuttonpress;  %等待鼠标点击获取第一个操作            
point1 = get(gca,'CurrentPoint');    
finalRect = rbbox;                   
point2 = get(gca,'CurrentPoint');    
point1 = point1(1,1:2);              
point2 = point2(1,1:2);
p1 = min(floor(point1),floor(point2));             
p2 = max(floor(point1),floor(point2));
offset = abs(floor(point1)-floor(point2));         
x = [p1(1) p1(1)+offset(1) p1(1)+offset(1) p1(1) p1(1)];
y = [p1(2) p1(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)];
hold on       %hold on 是保存axes内图像用的如果你在新画图像之后不想覆盖原图像就要加上hold on这句话                   
plot(x,y,'r');
%提取指定区域
M = imcrop(I,[x(1),y(1),abs(x(1)-x(3)),abs(y(1)-y(3))]);  
figure(2);
subplot(121);imshow(M);title('待分析区域')
%统计直方图
%subplot(143);imhist(M);title('直方图')
%瑞利分布
zm = im2double(M);
%zm=zm*256;
[x_size,y_size]=size(zm);

buf=reshape(zm,x_size*y_size,1);
%hist(x,10);
x=0:1/256:1;
[x_hist,y_hist]=hist(buf,x);
grid on
subplot(122);title('分布');
hist(buf,x)
axis([0,1,0,300]);
hold on
%极大似然估计
z_ray=mle(buf,'distribution','rayleigh') %极大似然估计 a为均值点  b为标准差 瑞利分布估计
for(i=1:length(buf))
   if buf(i)==0
        buf(i)=buf(i)+0.000001;
    end
end
z_ric=mle(buf,'distribution','rician') %极大似然估计 a为均值点  b为标准差 莱斯分布估计
%x=0:0.5:256;
y_ray=x/z_ray.^2.*exp(-x.^2./(2*z_ray.^2));
y_ric=x/z_ric(1).^2.*exp(-(x.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ray=y_ray*max(x_hist)/max(y_ray);
y_ric=y_ric*max(x_hist)/max(y_ric);%  调节放大比列
hold on
plot(x,y_ray,'r')
plot(x,y_ric,'g')
legend({'直方图','瑞利分布', '莱斯分布'})
%hold off

