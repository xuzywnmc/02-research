%����ָ��ƪ
%copyright-yunnan university
% choose =1��2��3
%      if choose ==1
%                 path1=strcat(path,'\MC\CT-009.jpg'),
%                 path2=strcat(path,'\MC\MRI-009.jpg'),
%                 result=strcat(path,'\result\',method,'1.jpg');
%         else if choose ==2
%                 path1=strcat(path,'\MP\PET-009.jpg'),
%                 path2=strcat(path,'\MP\MRI-009.jpg'),
%                 result=strcat(path,'\result\',method,'2.jpg');
%         else if choose==3
%                 path1=strcat(path,'\MS\SPECT-009.jpg'),
%                 path2=strcat(path,'\MS\MRI-009.jpg'),
%                 result=strcat(path,'\result\',method,'3.jpg');
%             end
%         end
%      end
% ����˵����time ��ʾ�ڼ�������
%           choose ��ʾѡ��ڼ�������ͼ���ں�
%           method ��ʾ�õ����ַ���
function main_quality(time,choose,method)
%     quality_result=cell(30,20);
   if time == 1
        quality_result1=cell(20,1);
        quality_result1{1,1}='metrics\methods';
        quality_result1{2,1}='SSIM';
        quality_result1{3,1}='RMSE';
        quality_result1{4,1}='MI';
        quality_result1{5,1}='PNSR';
        quality_result1{6,1}='SF';
        quality_result1{7,1}='Qabf';
        quality_result1{8,1}='Q';
        quality_result1{9,1}='Qw';
        quality_result1{10,1}='QE';
        quality_result1{11,1}='AG';
        quality_result1{12,1}='EI';
        quality_result1{13,1}='EN';
        quality_result1{14,1}='SD';
        quality_result1{15,1}='VIFF';
        quality_result1{16,1}='MS-SSIM';
        quality_result1{17,1}='IFC';
        quality_result1{18,1}='MSE';
        quality_result=[quality_result1];
       save './main_quality.mat'  quality_result
   end
   load main_quality.mat
%     quality_result1{1,i}=method;
    [img1,img2,result]=read_image(choose,method);
%     figure;
%     imshow(uint8(img1),[]);
%     figure;
%     imshow(uint8(img2),[]);
%     figure;
%     imshow(uint8(result),[]);
    [SSIM1,RMSE,MI,PSNR,SF]=quality(img1,img2,result);
    %SSIM�����������ͼ����ں�ͼ���� Ȼ��ȡ��ֵ
    [mssim, ssim_map] = ssim(img1, result)
    [mssim1, ssim_map] = ssim(img2, result)
    SSIM=(mssim+mssim1)/2;
    [Qabf,Q,Qw,QE]=measures(img1,img2,result);
    [AG]=avg_gradient(result);
    [EI]= edge_intensity(result);
    [EN]=entropy(result);
    [SD]=StandardDeviation(result);
    [MSSSIM(1)]=msssim(img1,result);
    [MSSSIM(2)]=msssim(img2,result);
    MSSSIM=mean(MSSSIM);
    [r c k] = size(img2);
    for i=1:k
    %����Ҫ�������ǲ�ɫ�� �����������ǻ�ɫ�� ���Ҷ�����һά��
    [VIFF(i)]=vifvec(img2(:,:,i),result(:,:,i));
    end
     VIFF=mean(VIFF);
        for i=1:k
    %����Ҫ�������ǲ�ɫ�� �����������ǻ�ɫ�� ���Ҷ�����һά��
    [IFC(i)]=ifcvec(img2(:,:,i),result(:,:,i));
        end
    IFC=mean(IFC);
    [psnr, mse1] = psnr_mse(img1, result);
    [psnr, mse2] = psnr_mse(img2, result);
    MSE=(mean(mse1)+mean(mse2))/2
    quality_result2=cell(20,1);
    quality_result2{1,1}=method;
    quality_result2{2,1}=SSIM;
    quality_result2{3,1}=RMSE;
    quality_result2{4,1}=MI;
    quality_result2{5,1}=PSNR;
    quality_result2{6,1}=SF;
    quality_result2{7,1}=Qabf;
    quality_result2{8,1}=Q;
    quality_result2{9,1}=Qw;
    quality_result2{10,1}=QE;
    quality_result2{11,1}=AG;
    quality_result2{12,1}=EI;
    quality_result2{13,1}=EN;
    quality_result2{14,1}=SD;
    quality_result2{15,1}=VIFF;
    quality_result2{16,1}=MSSSIM;
    quality_result2{17,1}=IFC;
    quality_result2{18,1}=MSE;
    quality_result=[quality_result quality_result2];
    save './main_quality.mat'  quality_result
end