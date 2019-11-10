% function ALL_IMAGE_TIDU_FENLEI()

fileFolder=fullfile('.\CHOOSE_FOR_TRAIN');
 
dirOutput=dir(fullfile(fileFolder));
 
fileNames={dirOutput.name};

%要十分注意 i一定要从3开始
for i=3:1:length(fileNames)
    temp_filename=char(fileNames(1,i));
    fileFolder=fullfile('.\CHOOSE_FOR_TRAIN\',temp_filename);
    dirOutput=dir(fullfile(fileFolder));
    fileNames1={dirOutput.name};
    %此处是重新进入一个文件夹 在读取具体文件名情况下
    for j=3:1:4
        temp=char(fileNames1(1,j));
        temp_name=[fileFolder,'\',temp];
        image=double(imread(temp_name));
        image = imresize(image, [256,256]);
%         figure;
%         imshow(uint8(image),[]);
       SINGLE_IMAGE_TIDU_FENLEI(image);
    end
end
% end