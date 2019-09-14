function a=nstdhaarrec2(x,level,rorc,h)
% nstdhaarrect2 二维非标准Haar小波规格化分解后图像重构程序（多级）
% 输出:x  载入的二维图像像素值
a=double(x);           % 输出:a  重构后生成的图像像素数值矩阵，大小与x相同
level=1;               % 分解重构层数
rorc=0;               % 作行变换（1）或列变换（2），默认值为0，行列变换都做
h=size(x,2);           % 重构的矩阵块大小，默认为整个x矩阵的变换
h1=h;
h2=h*(2^(level-1));
while h1<=h2
    if rorc==1;
        for j=1:h1
            tempcol=a(1:h1,j)';
            a(1:h1,j)=haarrec(tempcol,h1)';
        end
    else
        if rorc==2
            for i=1:h1
                temprow=a(i,1:h1);
                a(i,1:h1)=haarrec(temprow,h1);
            end
        else
            for i=1:h1
                 temprow=a(i,1:h1);
                a(i,1:h1)=haarrec(temprow,h1);
            end
            for j=1:h1
              tempcol=a(1:h1,j)';
              a(1:h1,j)=haarrec(tempcol,h1)';
            end
        end
    end
    h1=h1*2;
end
