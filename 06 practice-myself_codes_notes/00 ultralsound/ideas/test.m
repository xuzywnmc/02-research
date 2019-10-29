a=[11,2,3;14,5,6;7,18,9]
b=size(a)
c=find(a(:,3)>3)
e=find(a(c,1)>9)
ff=c(e)
d=find(e>=4)
CreatVideoFromPic( './image', 'jpg','presentation5.avi');