function a=nstdhaarrec2(x,level,rorc,h)
% nstdhaarrect2 ��ά�Ǳ�׼HaarС����񻯷ֽ��ͼ���ع����򣨶༶��
% ���:x  ����Ķ�άͼ������ֵ
a=double(x);           % ���:a  �ع������ɵ�ͼ��������ֵ���󣬴�С��x��ͬ
level=1;               % �ֽ��ع�����
rorc=0;               % ���б任��1�����б任��2����Ĭ��ֵΪ0�����б任����
h=size(x,2);           % �ع��ľ�����С��Ĭ��Ϊ����x����ı任
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
