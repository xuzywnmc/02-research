function deccoef=mydwt2(X,wavename,N,mode)
% 2-D 多级非标准小波分解程序
% 输入 X      要分解的二维信号
% wavename    用来作分解的小波名称，与MATLAB的wavename定义一致
% N           分解级数
% 说明：数组标号对应分解级数
sX=size(X);
DX=X;
% 设置默认分解模式
mode='sym';
if sX(1)==1
    error=sprintf('%s','出错信息：分解信号需要二维矩阵')
else
    % 用小波进行分解
    for i=1:N
        [deccoef(i).cA,deccoef(i).cHdeccoef(i).cdeccoef(i).cV,deccoef(i).cD]=dwt2(DX,wavename,'mode',mode);
        % cA,cH,cV,cD分别保存低频、水平高频、垂直高频、斜线高频分解系数数值
        deccoef(i).ex_size=size(DX);
        % 输出deccoef 3 级分解的各级分解系数
        % （1x3 struct array with fields:cA,cH,cV,cD,ex_size)
        DX=deccoef(i).cA;
    end
end
