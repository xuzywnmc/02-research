function [a,lt]=nstdhaardec2(x,level,rorc,h)
% ��άHaarС���Ǳ�׼��񻯷ֽ���򣨶༶�ֽ⣩
% ���ã�ʹ��HaarС����ÿһ�к�ÿһ������ֵ����С���任
% ����:x   ����Ķ�άͼ������ֵ��
a=double(x);           % ���:a  �ֽ����ֵ���󣬴�С��x��ͬ
t=1;                   % ��¼ʵ�ʷֽ����
sX=size(x);
level=1;              % С���ֽ�Σ��������趨ֵ������趨ֵ������߿ɷֽ��
                       % ��������߷ֽ�����ֽ⣩
h=sX(2);               % �ֽ�ľ�����С��Ĭ��Ϊ����x����ı任
rorc=0;               % ���б任��1�����б任��2����Ĭ��ֵΪ0
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
