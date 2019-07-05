picname ='E:\科研\代码\Project\pic1.fig';
open(picname);
obj = get(gca,'children');

% imshow(pic)
title('原始图像')
I=get(obj,'cdata');
close
picname = 'D:\学习\医学超声\Project\pic\2.fig';
open(picname);
obj = get(gca,'children');

% imshow(pic)
title('原始图像')
II=get(obj,'cdata');
close
p=590;%上边界
q=800;%下边界
u=480;%左边界

% u=1;
%  Y=II(:,:,1);  %370-1200
%  imshow(I,[])
%  figure
%  Z=II(:,:,2);
%  imshow(II,[])
p=391;%round((30/108)*1406);  上边界     
for i=1:781 %round((60/108)*1406)
    j=1;
    u=480;
    A=I(p:p+33,u:u+66); 
    for u=480:480+42 
        B=II(p:p+33,u:u+66);
        r=corrcoef(A,B);
        R(i,j)=r(1,2);
        j=j+1;
    end
    p=p+1;
end
% [i1,j1]=find(R==max(max(R)))
[max_R,max_j]=max(R,[],2);
y=40/1000/1000*(max_j-1);
hengzuobiao1=0.0768*((1:781)-1)+30;
plot(hengzuobiao1+0.63,y)
 axis([50 70 0 0.002])
hold on
% for i=1:370
%     L(i)=0;
% end
j=1;
 for i=0.03:0.0000768:0.09%60/1000/781%0.0000745
 if(i>0.0555&&i<0.0645)
 L(j)=80/1000/50*(1-(abs(i-60/1000)/(9/2/1000)).^2);
 else
     L(j)=0;
 end
 j=j+1;
 end
 hengzuobiao2=0.0768*((1:782)-1)+30;
plot(hengzuobiao2,L)  
legend({'实测速度曲线','理论速度曲线'})

% length=30;
% width=60;
% p=370;
% j=1;
% for i=1:475
%     u=480;
%     A=II(p:p+length,u:u+length,1); 
%     e=1;
%     for k=p-length:p+length
%         g=1;
%         for u=480:480+width
%         B=II(k:k+length,u:u+length,2);
%         r=corrcoef(A,B);
%         K(e,g)=r(1,2);
%         g=g+1;
%         end
%         e=e+1;
%     end
%     [i1,j1]=find(K==max(max(K)))
% %     [max_K,max_Kg]=max(K,[],2);
%     R(i,j)=K(i1,j1);
%     d(i)=sqrt((i1-1-30).^2+(j1-1).^2);
%     j=j+1;
%     p=p+2;
% end
% % [i1,j1]=find(R==max(max(R)))
% % [max_R,max_j]=max(R,[],2);
% y=50/1000/1000*d;
% plot(y)
