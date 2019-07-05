clc;clear;
img12=imread('D:\学习\医学超声\Project\m12.jpg');
for i=1:11
img{i}=imread(['D:\学习\医学超声\Project\m',num2str(i),'.jpg']);
r(i)=corr2(img{i}(1:6,1:6),img12(1:6,1:6));
r(i)
end
