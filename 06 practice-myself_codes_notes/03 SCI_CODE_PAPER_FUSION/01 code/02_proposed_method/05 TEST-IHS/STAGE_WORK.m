% function STAGE_WORK()
clc;clear;
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
%%本程序不宜形成函数 因为Load会报错
% currentFile = sprintf('fenlei_data%d.mat',i); 
% load(currentFile);不宜放在函数中被调用
for channel=0:2%
%     channel一定要从0-2
%     一个一个通道进行训练 此处应该不用再更改了
    image_number=0;
    fileFolder=fullfile('.\CHOOSE_FOR_TRAIN');
    dirOutput=dir(fullfile(fileFolder));
    fileNames={dirOutput.name};
    image_set=zeros(256,256,28);
    %要十分注意 i一定要从3开始
    for i=3:1:length(fileNames)
        temp_filename=char(fileNames(1,i));
        fileFolder=fullfile('.\CHOOSE_FOR_TRAIN\',temp_filename);
        dirOutput=dir(fullfile(fileFolder));
        fileNames1={dirOutput.name};
        sf_set_m=zeros(1,300);
        sf_set_p=zeros(1,300);
        temp_image_set=zeros(256,256,100);
        %此处是重新进入一个文件夹 在读取具体文件名情况下
%         for j=3:1:7%先选4张图片
         for j=3:1:length(fileNames1)%先选4张图片
            temp=char(fileNames1(1,j));
            temp_name=[fileFolder,'\',temp];
            image=double(imread(temp_name));
            image=imresize(image,[256,256]);
            [OUTPUT,FORRI,AA,BB]=RGB2IHS(image);
%             imshow(uint8(image),[]);
            image_input1=OUTPUT(:,:,channel+1);
             SINGLE_IMAGE_TIDU_FENLEI(image_input1,channel);
             % channel 0/1/2 分别表示I H S分量
             image_number=image_number+1;
    %         figure;
    %         imshow(uint8(image),[]);
        end
    end
    %%
    %  *********************************将分类好的数据转移到MAT_DATA文件下*********************************
    %本函数功能是将每个通道已经训练好的7个fenlei_data和
    %sum_data index等数据移交到MAT_DATA文件夹下
    for j=1:image_number%图的数量决定了会循环几个7
    for i=channel*1000+(j-1)*10+1:channel*1000+7+(j-1)*10
    filename1=['fenlei_data',num2str(i),'.mat'];
%         currentFile = sprintf('fenlei_dat.mat');
      currentFile = sprintf('fenlei_data%d.mat',i);
     load(currentFile);
        currentFile = sprintf('./MAT_DATA/fenlei_data%d.mat',i);
     save(currentFile,'fen_data','fen_geshu');
    delete(filename1);
    end
end
for i=1:7
        filename1=['sum_data',num2str(i),'.mat'];
%         currentFile = sprintf('fenlei_dat.mat');
      currentFile = sprintf('sum_data%d.mat',i);
     load(currentFile);
        currentFile = sprintf('./MAT_DATA/sum_data%d.mat',i+channel*10);
        %%
%         sum_data=zeros(64,500);
        %%
     save(currentFile,'sum_data','sum_geshu');
    delete(filename1);
end
    filename1=['index','.mat'];
%         currentFile = sprintf('fenlei_dat.mat');
      currentFile = sprintf('index.mat');
     load(currentFile);
        currentFile = sprintf('./MAT_DATA/index%d.mat',channel*10);
     save(currentFile,'index');
    delete(filename1);
    % *********************************end***********************************
    %%

end

%%
    %  *********************************转换为字典程序*********************************
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
for channel=0:2
    
%             filename1=['sum_data',num2str(i),'.mat'];
%         currentFile = sprintf('fenlei_dat.mat');
   for i=1:7
      currentFile = sprintf('sum_data%d.mat',i+channel*10);
     load(currentFile);
     data=sum_data;
%      i=channel;
      TRAIN_DICTIONARY(data,i+channel*10)
   end
end
%%************************************end**********************
%  end