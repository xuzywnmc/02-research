y = double(imread('MRI-009.jpg'));
image = imresize(y, [256,256]);
input = image(:,:,1);
output = dictionary(input);

% % % % % % % % % % 
y1 = double(imread('CT-009.jpg'));
image1 = imresize(y1, [256,256]);
input1 = image1(:,:,1);
output1 = dictionary(input1);
% % % % % fuse
mm = (abs(output)) > (abs(output1));
Y  = (mm.*output) + ((~mm).*output1);
figure, imshow(Y, []);