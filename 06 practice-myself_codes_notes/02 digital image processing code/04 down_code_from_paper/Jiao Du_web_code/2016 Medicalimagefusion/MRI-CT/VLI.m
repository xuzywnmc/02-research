function y = VLI(F)
r = F(:,:,1);
g = F(:,:,2);
b = F(:,:,3);
I=(r+g+b)./3;%亮度特征

% 一个参数
img = double(I); 
% Get rows and colums of img 
[r c] = size(img); 
     
% Mean value 
img_mean = mean(mean(img)); 
 
% Variance 
img_var = sqrt(sum(sum((img - img_mean).^2)) / (r * c ));
% % % 
y = img_var; 
end
