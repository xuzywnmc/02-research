clc;clear;
image_input1=double(imread('./3.jpg')); 
img1 = imresize(image_input1, [256,256]);
figure;
imshow(uint8(image_input1),[]);
overlap = 7;                   
epsilon = 0.1; 
load(['Dictionary/D_100000_' num2str(256) '_8_0.mat']); %the first sub-dictionary 'D'
load(['Dictionary/D_100000_' num2str(256) '_8_6.mat']); %other sub-dictionaries 'Dn' and the number is 'dic_number'
%%
%  y = dictionary(image_input1);
%  figure;
% imshow(uint8(y),[]);
% temp=(image_input1-y).^2;
% error=sum(sum(temp));
%%
% if size(img1,3)==1   %for gray images
%     imgf=test_asr_fuse(img1,D,Dn,dic_number,overlap,epsilon);
% else
%     for i=1:1
%         imgf(:,:,i)=test_asr_fuse(img1(:,:,i),D,Dn,dic_number,overlap,epsilon);
for indexk=1:3
    A=img1(:,:,indexk);
r=180/dic_number;
% normalize the dictionary
norm_D = sqrt(sum(D.^2, 1)); 
D = D./repmat(norm_D, size(D, 1), 1);

D_n=cell(dic_number,1);
dict_length=size(Dn,2)/dic_number;
for i=1:dic_number
    D_n{i,1}=Dn(:,(i-1)*dict_length+1:i*dict_length);
    norm_D = sqrt(sum(D_n{i,1}.^2, 1)); 
    D_n{i,1} = D_n{i,1}./repmat(norm_D, size(D_n{i,1}, 1), 1);
end

patch_size = sqrt(size(D, 1));
[h,w]=size(A);
F=zeros(h,w);
cntMat=zeros(h,w);
% gridx gridy 为1x249 double
gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;

%cnt=0;
G=D'*D;
% G=256X64*64X156
G_n=cell(dic_number,1);
for i=1:dic_number
    G_n{i,1}=D_n{i,1}'*D_n{i,1};
end

dx=[-1 0 1;-2 0 2;-1 0 1];
dy=dx';
for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        %cnt = cnt+1;
        xx = gridx(ii);
        yy = gridy(jj);
        
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
%         patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
%         mean2 = mean(patch_2(:));
%         patch2 = patch_2(:) - mean2;
        f1=var(patch_1(:),1);
%         f2=var(patch_2(:),1);
%         if f1>f2
            Dx=imfilter(patch_1,dx);
            Dy=imfilter(patch_1,dy);
%         else
%             Dx=imfilter(patch_2,dx);
%             Dy=imfilter(patch_2,dy);
%         end
        grad_mag=sqrt(Dx.*Dx+Dy.*Dy);
        grad_ori=atan(Dy./Dx)*180/pi;
        idx=(grad_ori<0);
        grad_ori(idx)=grad_ori(idx)+180;
        index=grad_ori./r;
        hist=zeros(dic_number,1);
        for i=1:patch_size

            for j=1:patch_size
%                 index第一列为
%index为方差大的方向梯度矩阵（8X8) 如果小于零 则加上180度
%再将方向梯度矩阵除30度 
% [0.614498294097400;0.0908770331302089;0.0829850973999719;5.91701490260003;5.90912296686979;0;0;5.38550170590260]
                p=ceil(index(i,j));
                if p>=1&&p<=dic_number
                    hist(p,1)=hist(p,1)+grad_mag(i,j);
                end
            end
        end
        [max_v,max_p]=max(hist);
        flag=1;
        if max_v/sum(hist)>(1.5/dic_number)
            w1=omp2(D_n{max_p,1},patch1,G_n{max_p,1},epsilon);
%             w2=omp2(D_n{max_p,1},patch2,G_n{max_p,1},epsilon); 
        else
            w1=omp2(D,patch1,G,epsilon);
%             w2=omp2(D,patch2,G,epsilon);
            flag=0;  
        end
        
        w=w1;
%         if sum(abs(w1))<sum(abs(w2))
%             w=w2;         
%         end
        mean_f=(mean1)/2;
       
        if flag==1
            patch_f=D_n{max_p,1}*w;
        else
            patch_f=D*w;
        end
        Patch_f = reshape(patch_f, [patch_size, patch_size]);
        Patch_f = Patch_f + mean_f;
        
        F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
    end
    %cnt
    if mod(ii,50)==0
        fprintf([num2str(ii), ' rows have been processed\n']);
    end
end
cntMat1=cntMat;
idx = (cntMat < 1);
temp10=A(idx)
F2=F;
% F(idx) = (A(idx)+B(idx))./2;
test_F=F./cntMat;
cntMat(idx) = 1;
imgf(:,:,indexk)= F./cntMat;                             
%     end
end
figure;
imshow(uint8(imgf),[]);