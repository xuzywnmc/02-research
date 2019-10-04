%psi.m
%psi与系统内置函数名冲突 导致容易报错 报错形式为x为非负数 更改
%小波函数名即可
function p=pkk(t)
if abs(t)<=5 
    p=(2*(pi^(-0.25))/(sqrt(3)))*(1-t.^2).*exp(-(t.^2)/2); %小波母函数
    %用的是Mexican Hat小波
else 
    p=0;
end
    
