function imf=emd(x)
%����ģ̬����
%�����Զ����findpeaks����
x=transpose(x(:));
imf=[];
while ~ismonotonic(x)   %�Զ��庯��
    x1=x;
    sd=Inf;
    while(sd>0.1)|isimf(x1)  %isimfΪ�Զ��庯��
        s1=getspline(x1);    %getsplineΪ�Զ��庯��
        s2=-getspline(-x1);
        x2=x1-(s1+s2)/2;
        sd=sum((x1-x2).^2)/sum(x2.^2);
        x1=x2;
    end
    imf{end+1}=x1;
    x=x-x1;
end
imf{end+1}=x;
