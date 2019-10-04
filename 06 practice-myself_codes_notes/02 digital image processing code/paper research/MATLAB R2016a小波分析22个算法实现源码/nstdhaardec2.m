function [a,lt]=nstdhaardec2(x,level,rorc,h)
% 二维Haar小波非标准规格化分解程序（多级分解）
% 作用：使用Haar小波对每一行和每一列像素值进行小波变换
% 输入:x   载入的二维图像像素值；
a=double(x);           % 输出:a  分解后数值矩阵，大小与x相同
t=1;                   % 记录实际分解次数
sX=size(x);
level=1;              % 小波分解次（级）数设定值（如果设定值超过最高可分解次
                       % 数，按最高分解次数分解）
h=sX(2);               % 分解的矩阵块大小，默认为整个x矩阵的变换
rorc=0;               % 作行变换（1）或列变换（2），默认值为0
lt=level;
while and(h>1,t<=level)
    if rorc==1;
        for row=1:h
            a(row,:)=haardec(a(row,:):h);
        end
    else
        if rorc==2
            for col=1:h
                temp=haardec(a(:,col)',h);
                a(:,col)=temp';
            end
        else
            for row=1:h
                a(row,:)=haardec(a(row,:),h);
            end
            for col=1:h
                temp=haardec(a(:,col)',h);
                a(:,col)=temp';
            end
        end
    end
    h=h/2;
    t=t+1;
end
if and(h<=1,lt~=t-1)
    lt=t-1;
end
