
%%�����������ڿ͹�����ָ���ۺϳ���
function [RMSE,SF,AG]=metric(img1,img2,result)
%% RMSE
    y1=rmse(img1,result);
    y2=rmse(img2,result);
    RMSE=max(y1,y2);
%% 
    %SF ����ռ�Ƶ�� �ռ�Ƶ�ʷ�ӳ��һ��ͼ��ռ���������Ծ��
    A=double(result);
    [M,N]=size(A);
    sum1=0;
    sum2=0;
    %������Ƶ��
    for i=1:M
        for j=2:N
            w=A(i,j)-A(i,j-1);
            sum1=sum1+w^2;
        end
    end
    RF=sqrt(sum1/(M*N));
    %������Ƶ��
    for j=1:N
        for i=2:M
            w=A(i,j)-A(i-1,j);
            sum2=sum2+w^2;
        end
    end
    CF=sqrt(sum2/(M*N));
    SF=sqrt(RF^2+CF^2)
%%
    %����ƽ���ݶ�
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
 %���㻥��Ϣ
%  MI=mutinf_quality(img1,img2,result)
 %%
end
    function rmse1 = rmse(imgfusion,imgstandard) 
    % ��������
    [m n]=size(imgfusion);
    temp=sqrt(sum(sum((imgfusion-imgstandard).^2)));
    rmse1=temp/(m*n);
    end
