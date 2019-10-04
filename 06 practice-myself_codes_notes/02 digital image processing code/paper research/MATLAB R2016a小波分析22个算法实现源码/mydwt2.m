function deccoef=mydwt2(X,wavename,N,mode)
% 2-D �༶�Ǳ�׼С���ֽ����
% ���� X      Ҫ�ֽ�Ķ�ά�ź�
% wavename    �������ֽ��С�����ƣ���MATLAB��wavename����һ��
% N           �ֽ⼶��
% ˵���������Ŷ�Ӧ�ֽ⼶��
sX=size(X);
DX=X;
% ����Ĭ�Ϸֽ�ģʽ
mode='sym';
if sX(1)==1
    error=sprintf('%s','������Ϣ���ֽ��ź���Ҫ��ά����')
else
    % ��С�����зֽ�
    for i=1:N
        [deccoef(i).cA,deccoef(i).cHdeccoef(i).cdeccoef(i).cV,deccoef(i).cD]=dwt2(DX,wavename,'mode',mode);
        % cA,cH,cV,cD�ֱ𱣴��Ƶ��ˮƽ��Ƶ����ֱ��Ƶ��б�߸�Ƶ�ֽ�ϵ����ֵ
        deccoef(i).ex_size=size(DX);
        % ���deccoef 3 ���ֽ�ĸ����ֽ�ϵ��
        % ��1x3 struct array with fields:cA,cH,cV,cD,ex_size)
        DX=deccoef(i).cA;
    end
end
