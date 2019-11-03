
%%本程序是用于客观评价指标综合程序
function [RMSE,SF,AG]=metric(img1,img2,result)
%% RMSE
    y1=rmse(img1,result);
    y2=rmse(img2,result);
    RMSE=max(y1,y2);
%% 
    %SF 计算空间频率 空间频率反映了一幅图像空间域的总体活跃度
    A=double(result);
    [M,N]=size(A);
    sum1=0;
    sum2=0;
    %计算行频率
    for i=1:M
        for j=2:N
            w=A(i,j)-A(i,j-1);
            sum1=sum1+w^2;
        end
    end
    RF=sqrt(sum1/(M*N));
    %计算列频率
    for j=1:N
        for i=2:M
            w=A(i,j)-A(i-1,j);
            sum2=sum2+w^2;
        end
    end
    CF=sqrt(sum2/(M*N));
    SF=sqrt(RF^2+CF^2)
%%
    %计算平均梯度
    A=double(result);
    [M,N,K]=size(A);
    sum=0;
    for i=1:M-1
        for j=1:N-1
            diffX(i,j)=A(i,j)-A(i+1,j);
            diffY(i,j)=A(i,j)-A(i,j+1);
            w=sqrt(((diffX(i,j))^2+(diffY(i,j))^2)/2);
            sum=sum+w;
        end
    end
    AG=sum/((M-1)*(N-1))
 %%
 %计算互信息
%  MI=mutinf_quality(img1,img2,result)
 %%
end
    function rmse1 = rmse(imgfusion,imgstandard) 
    % 两个参数
    [m n]=size(imgfusion);
    temp=sqrt(sum(sum((imgfusion-imgstandard).^2)));
    rmse1=temp/(m*n);
    end
