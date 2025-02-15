function [mask,probability] = RWOptimize(im,seeds,labels,beta,p,gma,n)
%Function [mask,probabilities] = random_walker(img,seeds,labels,beta) uses the 
%random walker segmentation algorithm to produce a segmentation given a 2D 
%image, input seeds and seed labels.
%
%Inputs: img - The image to be segmented
%        seeds - The input seed locations (given as image indices, i.e., 
%           as produced by sub2ind)
%        labels - Integer object labels for each seed.  The labels 
%           vector should be the same size as the seeds vector.
%        beta - Optional weighting parameter (Default beta = 90)
%
%Output: mask - A labeling of each pixel with values 1-K, indicating the
%           object membership of each pixel
%        probabilities - Pixel (i,j) belongs to label 'k' with probability
%           equal to probabilities(i,j,k)
%
%
%10/31/05 - Leo Grady
%Based on the paper:
%Leo Grady, "Random Walks for Image Segmentation", IEEE Trans. on Pattern 
%Analysis and Machine Intelligence, Vol. 28, No. 11, pp. 1768-1783, 
%Nov., 2006.
%
%Available at: http://www.cns.bu.edu/~lgrady/grady2006random.pdf
%
%Note: Requires installation of the Graph Analysis Toolbox available at:
%http://eslab.bu.edu/software/graphanalysis/

% PCA decomposition
[r,c,b]=size(p);
bands=size(im,2);
im=reshape(im,[r,c,bands]);
x=reshape(im,[r*c bands]);
x=compute_mapping(x,'PCA',1);
x = mat2gray(x);
x =reshape(x,[r,c,1]);
% x=adapthisteq(x);
GDimg=x;
p=reshape(p,[r*c b]);

%%%%Find image size
imgs=im2double(GDimg);
[X Y Z]=size(imgs);

%Error catches
exitFlag=0;
if((Z~=1) && (Z~=3)) %Check number of image channels
    disp('ERROR: Image must have one (grayscale) or three (color) channels.')
    exitFlag=1;
end 
if(sum(isnan(im(:))) || sum(isinf(im(:)))) %Check for NaN/Inf image values
    disp('ERROR: Image contains NaN or Inf values - Do not know how to handle.')
    exitFlag=1;
end
%Check seed locations argument
if(sum(seeds<1) || sum(seeds>size(im,1)*size(im,2)) || (sum(isnan(seeds)))) 
    disp('ERROR: All seed locations must be within image.')
    disp('The location is the index of the seed, as if the image is a matrix.')
    disp('i.e., 1 <= seeds <= size(img,1)*size(img,2)')
    exitFlag=1;
end
%if(sum(diff(sort(seeds))==0)) %Check for duplicate seeds
   % disp('ERROR: Duplicate seeds detected.')
    %disp('Include only one entry per seed in the "seeds" and "labels" inputs.')
    %exitFlag=1;
%end
TolInt=0.01*sqrt(eps);
if(length(labels) - sum(abs(labels-round(labels)) < TolInt)) %Check seed labels argument
    disp('ERROR: Labels must be integer valued.');
    exitFlag=1;
end
if(length(beta)~=1) %Check beta argument
    disp('ERROR: The "beta" argument should contain only one value.');
    exitFlag=1;
end
if(exitFlag)
    disp('Exiting...')
    [mask,probability]=deal([]);
    return
end

%Build graph
[points edges]=lattice(X,Y,n);

%Generate weights and Laplacian matrix
if(Z > 1) %Color images
    tmp=imgs(:,:,1);
    imgVals=tmp(:);
    tmp=imgs(:,:,2);
    imgVals(:,2)=tmp(:);
    tmp=imgs(:,:,3);
    imgVals(:,3)=tmp(:);
else
    imgVals=imgs(:);
end
weights=makeweights(edges,imgVals,beta);     %comput weights
L=laplacian(edges,weights);                  %construct Laplician matrix              

%Determine which label values have been used
label_adjust=min(labels); labels=labels-label_adjust+1;  %Adjust labels to be > 0
labels_record(labels)=1;
labels_present=find(labels_record);
number_labels=length(labels_present);

%Set up Dirichlet problem
boundary=zeros(length(seeds),number_labels);             
for k=1:number_labels
    boundary(:,k)=(labels(:)==labels_present(k));
end

%Solve for random walker probabilities by solving combinatorial Dirichlet
%problem
probabilities=dirichletboundary_new(L,seeds(:),boundary,p,gma); %solve��L+gma*DIAG(L)��u(x)=prob+B��*u(l)
%problem
% probabilities=dirichletboundary_meixiu(L,seeds(:),boundary,p,gma);
%Generate mask
[dummy mask]=max(probabilities,[],2);                       %
mask=labels_present(mask)+label_adjust-1;                   %Assign original labels to mask
probability=reshape(probabilities,[X*Y number_labels]);
probability=normalize(probability);
probability=reshape(probabilities,[X Y number_labels]);     %normalization  