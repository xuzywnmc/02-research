clc;clear;
% a=[1,2,3;2,3,4];
% b=[12,14,15;2,3,4];
% c=[a,b];
% for i=1:3
% %        fenlei_geshu(i)=geshu(i);
% %        eval(['data',num2str(i),'=','a',';']); 
%             cd('.\MAT_DATA');
%        currentFile = sprintf('sum_data%d.mat',i);
%        load(currentFile)
%        cd('..');
% %        data=sum_data;
% %         TRAIN_DICTIONARY(data,i)
% end
image_input1=double(imread('./2.jpg'));
[OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
A=OUTPUT(:,:,1);%取I分量
% image_input1=A;
% 先进行小规模实验 取四分之一 减小计算量
figure;
imshow(uint8(A),[]);
[F]=TEST_DICTIONARY(A);
figure;
imshow(uint8(F),[]);
% % temp=cell(1,4);
% % temp(3)=num2cell(a);
% for i=1:7
%     kk=11;
% disp(['the ',num2str(i-1),' image was finished,please waiting...']);
%     
% end
% temp1=temp{1};
% a1=a(:);
% FENLEI_IAMGEDATA();
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
% i=1;
% imshow(uint8(F),[]);
%  randomData = rand(n);
%    currentFile = sprintf('myfile%d.mat',i);
%    save(currentFile,'a1')
% data_n(:,:,1)=a;
% temp=data_n(:,:,1);
% image_input1=double(imread('./2.jpg'));
% % [OUTPUT,FORRI,AA,BB]=RGB2IHS(image_input1);
% % A=OUTPUT(:,:,1);%取I分量
% IMAGE_TIDU_FENLEI(image_input1);
