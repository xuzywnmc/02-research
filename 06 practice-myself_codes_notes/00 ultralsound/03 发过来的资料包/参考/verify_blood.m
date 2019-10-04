% for i=1:2
%     
%     picname=['photo\',num2str(i) '.fig'];
% 
%     open(picname)
% 
%     frame=getframe(gcf);  
% 
%     im=frame2im(frame);%制作gif文件，图像必须是index索引图像  
% 
%     II(:,:,i)=rgb2gray(im);   
%     close all
% end
p=597;%上边界
q=807;%下边界
u=480;%左边界
%  p上边界  q下边界  u左边界 
% u=1;
%  Y=II(:,:,1);  %370-1200
% imshow(Y,[])
% figure
%  Z=II(:,:,2);
% imshow(Z,[])

p=370;
for i=1:435
    j=1;
    u=480; 
    A= [p:p+33,u:u+66,1];   %  p上边界  q下边界  u左边界 
    for u=480:480+42
        B=II(p:p+33,u:u+66,2);
        r=corrcoef(A,B);
        R(i,j)=r(1,2); 
        j=j+1;
    end
    p=p+2;
end

% [i1,j1]=find(R==max(max(R)))

[max_R,max_j]=max(R,[],2);
y=40/1000/1000*(max_j-1);
plot(y)
axis([150 250 0 0.002])

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
