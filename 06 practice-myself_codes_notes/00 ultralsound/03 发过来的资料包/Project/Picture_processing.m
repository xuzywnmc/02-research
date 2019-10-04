clear all
img1=imread('D:\ѧϰ\ҽѧ����\Project\pic0.jpg');
figure(1),imshow(img1);
title('ԭͼ');

img1_cut=imcrop(img1);
figure(2);
subplot(121),imshow(img1_cut);
title('�ü�ͼ');

grayImage=rgb2gray(img1_cut)
subplot(122),imshow(grayImage);
title('�Ҷ�ͼ');

%��һ������
originalMinValue = double(min(min(grayImage)));
originalMaxValue = double(max(max(grayImage)));
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
img_norm = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure(3);
subplot(121),imshow(img_norm);
title('��һ������ͼ');

%ת��Ϊһά����
%[height,width,d]=size(img_norm);
%subplot(1,2,1);
%len=height*width;
%buf=uint8(zeros(1,len));
%r=1;
%for i=1:1:height
%  for j=1:1:width
%  buf(r)=img_norm(i,j);
%  r=r+1;
%  end
%end
%img_array=uint8(zeros(height,width));
%r=1;
%for i=1:1:height
%  for j=1:1:width
%  img_array(i,j)=buf(r);
%  r=r+1;
%  end
% end
%subplot(1,2,2);
%imshow(img_array) 
A = 0:1/255:1;
[height,width,d]=size(img_norm);  %height��59,width��62,d��1 size��ʾ��С�ֱ𷵻���λ����ʽ
len=height*width;  %len=3658
x=width;
y=height;
buf=double(zeros(1,len));  %bufΪһ��3658�е������
r=1;
for i=1:1:height
    for j=1:1:width
    buf(r)=img_norm(i,j); %һά����
    r=r+1;
    end
end
%ͳ��ֱ��ͼ
subplot(122),hist(buf);
title('ͳ��ֱ��ͼ')

x=0:1/128:2;
[x_hist,y_hist]=hist(buf,x);
hist(buf,x)

hold on;
z_ray=mle(buf,'distribution','rayleigh') %������Ȼ���� aΪ��ֵ��  bΪ��׼�� �����ֲ�����
for(i=1:length(buf))
   if buf(i)==0
        buf(i)=buf(i)+0.000001;
    end
end
z_ric=mle(buf,'distribution','rician') %������Ȼ���� aΪ��ֵ��  bΪ��׼�� ��˹�ֲ�����
%x=0:0.5:256;
y_ray=x/z_ray.^2.*exp(-x.^2./(2*z_ray.^2));
y_ric=x/z_ric(1).^2.*exp(-(x.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ray=y_ray*max(x_hist)/max(y_ray);
y_ric=y_ric*max(x_hist)/max(y_ric);%  ���ڷŴ����
hold on
plot(x,y_ray,'r')
plot(x,y_ric,'g')
legend({'ֱ��ͼ','�����ֲ�', '��˹�ֲ�'})
%hold offz_ray=mle(buf,'distribution','rayleigh') %������Ȼ���� aΪ��ֵ��  bΪ��׼�� �����ֲ�����
for(i=1:length(buf))
   if buf(i)==0
        buf(i)=buf(i)+0.000001;
    end
end
z_ric=mle(buf,'distribution','rician') %������Ȼ���� aΪ��ֵ��  bΪ��׼�� ��˹�ֲ�����
%x=0:0.5:256;
y_ray=x/z_ray.^2.*exp(-x.^2./(2*z_ray.^2));
y_ric=x/z_ric(1).^2.*exp(-(x.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ray=y_ray*max(x_hist)/max(y_ray);
y_ric=y_ric*max(x_hist)/max(y_ric);%  ���ڷŴ����
hold on
plot(x,y_ray,'r')
plot(x,y_ric,'g')
legend({'ֱ��ͼ','�����ֲ�', '��˹�ֲ�'})
%hold off