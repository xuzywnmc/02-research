[Lo_R,Hi_R]=wfilters(wname,'r');
ss=idwt(cA2,cD2,Lo_R,Hi_R);
sss=idwt(ss,cD1,Lo_R,Hi_R);
% 计算机重构信号与原始信号的误差
err=norm(s-sss)
figure;plot(sss);title('(f) 重构的原始信号');
xlabel(['相对误差=',num2str(err)]);
