function X=myidwt2(mode)
% myidwt2 2-D �༶�Ǽ���׼С���ع�����
mode='sym';
reccoef(N+1).RX=deccoef(N).cA;
for j=N:-1:1
    % ����С���ֽ�ϵ���ع�
   reccoef(j).RX=idwt2(reccoef(j+1).RX,deccoef(j).cH,deccoef(j).cV,deccoef(j).cD,deccoef(j).cD,wavename,deccoef(j).ex_size,'mode',mode);
end
X=reccoef(1).RX;
