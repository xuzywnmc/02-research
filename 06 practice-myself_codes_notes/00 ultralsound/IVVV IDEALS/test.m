a=[11,2,3;14,5,6;7,18,9]
b=size(a)
c=find(a(:,3)>3)
e=find(a(c,1)>9)
ff=c(e)
d=find(e>=4);
% for i=1:5
% for j=1:20
%     str=['./image/f' num2str(j) '.jpg'];
%     temp=imread(str);
%     str=['./image/f' num2str(j+i*20) '.jpg'];
%     imwrite(temp,str,'jpg')
% end
% end
CreatVideoFromPic( './image', 'jpg','presentation6.avi');