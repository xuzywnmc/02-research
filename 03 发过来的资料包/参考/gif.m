
for i=1:M

    picname=['photo\',num2str(i) '.fig'];

    open(picname)

%     set(gcf,'outerposition',get(0,'screensize'));% matlab�������

    frame=getframe(gcf);  

    im=frame2im(frame);%����gif�ļ���ͼ�������index����ͼ��  

    [I,map]=rgb2ind(im,127);          

    if i==1

        imwrite(I,map,'photo/movie1.gif','gif', 'Loopcount',inf,'DelayTime',1/50);%��һ�α��봴����

    elseif i==M

        imwrite(I,map,'photo/movie1.gif','gif','WriteMode','append','DelayTime',1/50);

    else

        imwrite(I,map,'photo/movie1.gif','gif','WriteMode','append','DelayTime',1/50);

    end;  

    close all

end