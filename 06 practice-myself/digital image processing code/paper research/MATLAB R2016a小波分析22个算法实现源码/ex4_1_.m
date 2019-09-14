% 利用db3小波对原始信号进行二尺度分解
% 使用小波分解函数dwt
[cA1,cD1]=dwt(s,wname);
figure;plot(cA1);title('(b) 近似系数cA1');
figure;plot(cD1);title('(c) 细节系数cD1');
% 对一尺度上的近似系数再次进行小波分解
[cA2,cD2]=dwt(cA1,wname);
figure;plot(cA2);title('(d) 近似系数cA2');
figure;plot(cD2);title('(e) 细节系数cD2');
