clc;clear;
a=[1,2,3;4,5,6;7,8,9];
a1=a(:);
% % b(:,:,1)=a;
% % b(:,:,2)=a;
% % b(:,:,3)=a;
% % [M,N,Q]=size(b);
% % OUTPUT=zeros(M,N,Q);
% %%
% %测试IHS变换及反变换函数
% image_input1=double(imread('./2.jpg'));
% figure;
% % aa=image_input1(:,:,3);
% % bb=image_input1(:,:,2);
% % cc=bb./aa;
% imshow(uint8(image_input1),[]);
% [OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
% % OUTPUT=IHS2RGB(FORRI)
% figure;
% imshow(uint8(FORRI),[]);
% 
% % if fenliang3==0
% %     flag=1;
% % end
% % [row,col]=find(fenliang3>0);
% % plot(col,-row,'r.')
% % figure;
% % scatter(col,-row);
% fenliang1=uint8(OUTPUT(:,:,1));
% fenliang2=uint8(OUTPUT(:,:,2));
% fenliang3=uint8(OUTPUT(:,:,3));
% figure;
% imshow(fenliang1,[]);
% figure;
% imshow(fenliang2,[]);
% figure;
% imshow(fenliang3,[]);
% error=image_input1-FORRI
% %%
% data_n=zeros(9,5,6);
% temp=data_n(:,:,2)
% temp(:,2)=a;
% data_n(:,:,2)=temp
i=1;
imshow(uint8(F),[]);
%  randomData = rand(n);
%    currentFile = sprintf('myfile%d.mat',i);
%    save(currentFile,'a1')
% data_n(:,:,1)=a;
% temp=data_n(:,:,1);