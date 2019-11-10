function FENLEI_IAMGEDATA()
%功能介绍：
%%将TRAINDATA文件夹下所有MRI PET SPECT找出来 然后重新写到CHOOSEDATA_MRI
% CHOOSEDATA_MRI 文件夹下
fileFolder=fullfile('.\TRAINDATA');
 
dirOutput=dir(fullfile(fileFolder));
 
fileNames={dirOutput.name};
image_set=zeros(256,256,28);
%要十分注意 i一定要从3开始
for i=3:1:length(fileNames)
    temp_filename=char(fileNames(1,i));
    fileFolder=fullfile('.\TRAINDATA\',temp_filename);
    dirOutput=dir(fullfile(fileFolder));
    fileNames1={dirOutput.name};
    sf_set_m=zeros(1,300);
    sf_set_p=zeros(1,300);
    temp_image_set=zeros(256,256,100);
    %此处是重新进入一个文件夹 在读取具体文件名情况下
    for j=3:1:length(fileNames1)
        temp=char(fileNames1(1,j));
        temp_name=[fileFolder,'\',temp];
        image=imread(temp_name);
        if temp(1)=='M'
        SF=space_frequency(image)
        sf_set_m(j)=SF;
        end
          
            if temp(1)=='P'
            SF=space_frequency(image)
            sf_set_p(j)=SF;
                 end
        
        
%         temp_image_set(:,:,j)=temp_image;
    end
       sf_m=sf_set_m';
       sf_p=sf_set_p';
      [mm_m,index_m]=max(sf_m);
      [mm_p,index_p]=max(sf_p);
        temp_write=char(fileNames1(1,index_m));
        temp_name_write=[fileFolder,'\',temp_write];
        image=imread(temp_name_write);
        filename=['.\CHOOSE_FOR_TRAIN\CHOOSEDATA_MRI\',temp_filename,'.jpg'];
      imwrite(image,filename);
      if sum(sf_p)~0
              temp_p=char(fileNames1(1,index_p));
        temp_name_p=[fileFolder,'\',temp_p];
        image_p=imread(temp_name_p);
        filename_p=['.\CHOOSE_FOR_TRAIN\CHOOSEDATA_PET\',temp_filename,'.jpg'];
      imwrite(image_p,filename_p);
      end
  
end
end
function SF=space_frequency(X)
% % % % % 一个参数
SF=0;
X=double(X);
[n0,n0,ceng]=size(X);%%%%   X是一个方阵
if ceng==3
    for ceng=1:3
       SF=SF+space_f(X(:,:,ceng)); 
    end
else
    SF=space_f(X); 
end

end
function SF=space_f(X)
X=double(X);                          %空间频率;
RF=0;
CF=0;
[n0,n0]=size(X);%%%%   X是一个方阵
for fi=1:n0
    for fj=2:n0
        RF=RF+(X(fi,fj)-X(fi,fj-1)).^2;
    end
end

RF=RF/(n0*n0);

for fj=1:n0
    for fi=2:n0
        CF=CF+(X(fi,fj)-X(fi-1,fj)).^2;
    end
end

CF=CF/(n0*n0);%%%%可以思考，空间频率是不是只描述一个方阵

SF=sqrt(RF+CF)
end