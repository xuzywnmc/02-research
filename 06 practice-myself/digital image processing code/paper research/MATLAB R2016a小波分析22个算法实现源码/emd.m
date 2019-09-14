function imf=emd(x)
%经验模态函数
%调用自定义的findpeaks函数
x=transpose(x(:));
imf=[];
while ~ismonotonic(x)   %自定义函数
    x1=x;
    sd=Inf;
    while(sd>0.1)|isimf(x1)  %isimf为自定义函数
        s1=getspline(x1);    %getspline为自定义函数
        s2=-getspline(-x1);
        x2=x1-(s1+s2)/2;
        sd=sum((x1-x2).^2)/sum(x2.^2);
        x1=x2;
    end
    imf{end+1}=x1;
    x=x-x1;
end
imf{end+1}=x;
