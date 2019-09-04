function X=myidwt2(mode)
% myidwt2 2-D 多级非级标准小波重构程序
mode='sym';
reccoef(N+1).RX=deccoef(N).cA;
for j=N:-1:1
    % 利用小波分解系数重构
   reccoef(j).RX=idwt2(reccoef(j+1).RX,deccoef(j).cH,deccoef(j).cV,deccoef(j).cD,deccoef(j).cD,wavename,deccoef(j).ex_size,'mode',mode);
end
X=reccoef(1).RX;
