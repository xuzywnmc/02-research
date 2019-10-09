img1 =double(imread('labA.jpg'));
img2= double(imread('labB.jpg'));
img3= double(imread('result_lab.jpg'));
[G,P,C,QE]=measures(img1,img2,img3)