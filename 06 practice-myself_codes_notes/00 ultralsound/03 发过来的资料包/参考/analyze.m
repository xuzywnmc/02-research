clear all
picname = 'photo_11.1\1.fig';
open(picname);
obj = get(gca,'children');%��ȡ�Ӷ���ľ��

% imshow(pic)
title('ԭʼͼ��')
pic=get(obj,'cdata');%��ʾ���ɫ��

%ѡȡ��������
h=imrect;%�����ʮ�֣�����ѡȡ����Ȥ����
pos=getPosition(h);

%����ѡȡͼƬ
imCp = imcrop( pic, pos );%imcrop �ü�ͼ��
figure(2) %���ƴ��ڵ�����
imshow(imCp);%��ʾͼ��
title('ѡȡ������')%title��ѡȡ��ͼ��ȡ����

% ���ƻҶ�ͼ
grayImage = imCp;
figure(3);
imshow(grayImage);
title('�Ҷ�ͼ');

%��һ��
originalMinValue = double(min(min(grayImage)'));%min����С double�����ݱ�Ϊ˫���� 
originalMaxValue = double(max(max(grayImage)')); 
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
dblImageS1 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure;
imshow(dblImageS1);
title('��һ��')

%ת��Ϊһά����                                
[height,width,d]=size(dblImageS1);  %height��59,width��62,d��1 size��ʾ��С�ֱ𷵻���λ����ʽ
len=height*width;  %len=3658
buf=double(zeros(1,len));  %bufΪһ��3658�е������
r=1;
for i=1:1:height
    for j=1:1:width
    buf(r)=dblImageS1(i,j); %һά����
    r=r+1;
    end
end

%ֱ��ͼ
A = 0:1/255:1;   
[x_hist,y_hist]=hist(buf,A);%������ʽΪ [a,b]=hist(x,n) ����x��һά���������������ǽ�x�е���С�����ֵ֮�������ȷ�n�ݣ���������xֵ���������Ǹ�ֵ�ĸ��������ص�a�����ڸ������ڵĸ�����b�Ǹ������������λ������
hist(buf,A);   %����ѡȡ����ͼ���RGBֵ�Ĺ�һ�����ֱ��ͼ
axis([0,1,0,10]);%���õ�ǰ����������Ʒ�Χ xmin xmax ymin ymax
hold on%����ͼ�α���

%��������ֲ�ģ��(��Ҫ�󷽲�)
z_ray=mle(buf,'distribution','rayleigh'); %������Ȼ����
y_ray=A/z_ray.^2.*exp(-A.^2./(2*z_ray.^2));
y_ray=y_ray*max(x_hist)/max(y_ray);  %���ڷŴ����
plot(A,y_ray,'r')
hold on

%��˹
%A = 0:1/255:1;   
%z_ric=mle(A,'distribution','rician');
%y_ric=A/z_ric(1).^2.*exp(-(A.^2+z_ric(2).^2)./(2*z_ric(1).^2));
%y_ric=y_ric*max(x_hist)/max(y_ric);  % ���ڷŴ����
%plot(A,y_ric,'y')
z_ric=mle(buf,'distribution','rician'); %������Ȼ����
y_ric=A/z_ric(1).^2.*exp(-(A.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ric=y_z_ric*max(x_hist)/max(y_z_ric);  %���ڷŴ����
plot(A,y_ric,'r')
hold on
