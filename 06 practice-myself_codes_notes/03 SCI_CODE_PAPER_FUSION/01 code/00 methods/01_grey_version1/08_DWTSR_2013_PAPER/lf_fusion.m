function F=lf_fusion(A,B,D,level,overlap,epsilon)

global X;
global Y;

% normalize the dictionary
norm_D = sqrt(sum(D.^2, 1)); 
D = D./repmat(norm_D, size(D, 1), 1);
patch_size = sqrt(size(D, 1));
[h,w]=size(A);
F=zeros(h,w);
cntMat=zeros(h,w);

gridx = 1:patch_size - overlap : w-patch_size+1;
gridy = 1:patch_size - overlap : h-patch_size+1;

%cnt=0;
G=D'*D;
for ii = 1:length(gridx)
    for jj = 1:length(gridy)
        %cnt = cnt+1;
        xx = gridx(ii);
        yy = gridy(jj);
        
        patch_1 = A(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean1 = mean(patch_1(:));
        patch1 = patch_1(:) - mean1;
        patch_2 = B(yy:yy+patch_size-1, xx:xx+patch_size-1);
        mean2 = mean(patch_2(:));
        patch2 = patch_2(:) - mean2;
        
        patchLH1=X{level,2}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        patchHL1=X{level,3}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        patchHH1=X{level,4}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        patchLH2=Y{level,2}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        patchHL2=Y{level,3}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        patchHH2=Y{level,4}(yy:yy+patch_size-1, xx:xx+patch_size-1);
        
        w1=omp2(D,patch1,G,epsilon);
        w2=omp2(D,patch2,G,epsilon);   
        s1=sum(sum(patchLH1.^2))+sum(sum(patchHL1.^2))+sum(sum(patchHH1.^2));
        s2=sum(sum(patchLH2.^2))+sum(sum(patchHL2.^2))+sum(sum(patchHH2.^2));
        f1=sum(abs(w1))*s1;
        f2=sum(abs(w2))*s2;
        w=w1;
        if f1<f2
            w=w2;
        end
     
        patch_f=D*w;
        Patch_f = reshape(patch_f, [patch_size, patch_size]);
        Patch_f = Patch_f + mean1;
        
        F(yy:yy+patch_size-1, xx:xx+patch_size-1) = F(yy:yy+patch_size-1, xx:xx+patch_size-1) + Patch_f;
        cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) = cntMat(yy:yy+patch_size-1, xx:xx+patch_size-1) + 1;
        
    end
    %cnt
end

idx = (cntMat < 1);
F(idx) = (A(idx)+B(idx))./2;
cntMat(idx) = 1;

F = F./cntMat;
