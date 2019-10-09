function y = pca_function(input1, input2)
im1 = input1;
im2 = input2;
% compute PCA 
C = cov([im1 im2]);
[V, D] = eig(C);
if D(1,1) >= D(2,2)
  pca = V(:,1)./sum(V(:,1));
else  
  pca = V(:,2)./sum(V(:,2));
end

% fusion
imf1 = pca(1)*im1 + pca(2)*im2;
y = imf1;