try
    i=1;
    s=1;
    while i<=100
        s=s*i;
        i=i+1;
    end
    disp('100的阶乘为：');
    S        %S变量为出错代码
catch
    disp('程序出现错误！')
    disp('');
    disp('错误为：');
    lasterr
end
