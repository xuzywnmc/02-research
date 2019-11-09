function F=test_asr_fuse(A,B,D,Dn,dic_number,overlap,epsilon)
%This is the MATLAB implementation of the image fusion algorithm described in the following paper: 
%Y. Liu and Z. Wang, "Simultaneous image fusion and denoising with adaptive sparse representation", 
%IET Image Processing,vol.9,no.5,pp.347-357,2015

% Usage of this code is free for research purposes only. 
% Please refer to the above publication if you use this code.
% 
% Please refer to the README.txt for more information.

%    Input:
%    A - input image A
%    B - input image B
%    D  - The first sub-dictionary 
%    Dn  - Other sub-dictionaries
%    dic_number - the number of sub-dictionaries in Dn
%    overlap - the overlapped pixels between two neighbor patches
%    epsilon - sparse reconstuction error
%    Output:
%    F  - fused image   
%
%    The code is edited by Yu Liu, 09-Nov-2015

r=180/dic_number;
% normalize the dictionary
norm_D = sqrt(sum(D.^2, 1)); 
D = D./repmat(norm_D, size(D, 1), 1);

D_n=cell(dic_number,1);
dict_length=size(Dn,2)/dic_number;
%dict_length=256;
%dic_number=6;
%%
%相当于把Dn64X1536分成6份 每份64X256
for i=1:dic_number
    D_n{i,1}=Dn(:,(i-1)*dict_length+1:i*dict_length);
    norm_D = sqrt(sum(D_n{i,1}.^2, 1)); 
    D_n{i,1} = D_n{i,1}./repmat(norm_D, size(D_n{i,1}, 1), 1);
end
%%
patch_size = sqrt(size(D, 1));
%patch_size=8
[h,w]=size(A);
F=zeros(h,w);
cntMat=zeros(h,w);

gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;

%cnt=0;
G=D'*D;
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
%求方差
        f1=var(patch_1(:),1);
%         f2=var(patch_2(:),1);
        %如果方差越大 则选其作为求梯度
%         if f1>f2
            Dx=imfilter(patch_1,dx);
            Dy=imfilter(patch_1,dy);
%         else
%             Dx=imfilter(patch_2,dx);
%             Dy=imfilter(patch_2,dy);
%         end
%         Dx为8X8  Dy也为8X8
        grad_mag=sqrt(Dx.*Dx+Dy.*Dy);
        grad_ori=atan(Dy./Dx)*180/pi;
        %%
        %如果梯度方向小于0 则加上180度
        idx=(grad_ori<0);
        grad_ori(idx)=grad_ori(idx)+180;
        %%
        index=grad_ori./r;
%         r=（180/dic_number）=30;
        hist=zeros(dic_number,1);
%         patch_size = sqrt(size(D, 1))=16;
        for i=1:patch_size
            for j=1:patch_size
%                 Y = ceil(X) 将 X 的每个元素四舍五入到大于或等于该元素的最接近整数
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
%idx是逻辑值 所以知道其如果所在位置逻辑值不为1 则
%不会进行任何操作
idx = (cntMat < 1);
F(idx) = (A(idx)+B(idx))./2;
cntMat(idx) = 1;
F = F./cntMat;                             