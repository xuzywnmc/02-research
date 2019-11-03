[img1,img2 ,result]=oral(3,'JSR-AR')
image = imresize(img1, [256,256]);
% % % % % % % % % 
input = image(:,:,1);
bb=8; % block size
RR=4; % redundancy factor
K=RR*bb^2; % number of atoms in the dictionary
sigma = 25; 
IMin0 = input;
if (length(size(IMin0))>2)
    IMin0 = rgb2gray(IMin0);
end
if (max(IMin0(:))<2)
    IMin0 = IMin0*255;
end

IMin=IMin0+sigma*randn(size(IMin0));
% PSNRIn = 20*log10(255/sqrt(mean((IMin(:)-IMin0(:)).^2)));
% [IoutAdaptive,output] = denoiseImageKSVD(IMin, sigma,K);
path='C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\00 methods\03_proposed\metrics measures\image\'

                path1=strcat(path,'SPECT-009.jpg'),
                path2=strcat(path,'MRI-009.jpg'),
                result=strcat(path,'NSST+PAPCNN3.jpg');

     img1 =double(imread(path1));
    img2=double(imread(path2));
    result=double(imread(result));
[SSIM2,RMSE2,MI2,PSNR2,SF2]=quality(img1,img2,result);
% y = IoutAdaptive;

