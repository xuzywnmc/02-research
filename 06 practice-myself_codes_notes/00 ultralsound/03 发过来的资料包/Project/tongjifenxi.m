clear all
%pic = 'image\1.fig';
%open(pic);
%title('ԭʼͼ');

%a=imrect;
%pos=getPosition(a);
%h=imrect(a,position);
%caijian=imcrop(h,pos);
caijian=imread('f1.jpg');
hh=imcrop(caijian);
%imshow(caijian);
%title('ԭʼͼ');

%imshow('hh')
figure(2);
%inshow('caijian');
title('�ü�ͼ');

% ���ƻҶ�ͼ
%grayImage = hh;
grayImage = rgb2gray(hh);
figure(3);
imshow(grayImage);
title('�Ҷ�ͼ');

%��һ��
gg=ctranspose(grayImage);
originalMinValue = double(min(min(grayImage)));%min����С double�����ݱ�Ϊ˫���� 
originalMaxValue = double(max(max(grayImage))); 
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 255;
desiredRange = desiredMax - desiredMin;
dblImageS1 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure(4);
imshow(dblImageS1);
title('��һ��');

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
%ͳ��ֱ��ͼ
hist(buf);

hold on;

%�����ֲ�
phat=mle(buf);

%������Ȼ����
phat=mle(buf);













