path='.\Dataset\';
data = 'IndiaP';
location_data = [path,data];
load (location_data);
no_train=400;
no_classes=16;
GroundT=GroundT';
indexes=train_test_random_new(GroundT(2,:),fix(no_train/no_classes),no_train);
train_SL = GroundT(:,indexes);
test_SL = GroundT;
test_SL(:,indexes) = [];
% estimate the size of the input image
[no_lines, no_rows, no_bands] = size(img);

% construct traing and test dataset
if ~exist('IIDFimg')
no_bands_new=32;
size_subset=4;
IIDFimg=reshape(img,[no_lines*no_rows no_bands]);
IIDFimg=imresize(IIDFimg,[no_lines*no_rows no_bands_new]);
[IIDFimg] = scale_new(IIDFimg);
IIDFimg=reshape(IIDFimg,[no_lines no_rows no_bands_new]);
[IIDFimg unused]=Intrinsicfeature(IIDFimg,size_subset);
% [IIDFimg unused]=Intrinsicfeature_parll(IIDFimg,size_subset);
else
end
%%% SVM classification
IIDFimg_2 = ToVector(IIDFimg);
IIDFimg_2 = IIDFimg_2';
IIDFimg_2=double(IIDFimg_2);

%%%
% get the training-test samples and labels
train_samples = IIDFimg_2(:,train_SL(1,:))';
train_labels= train_SL(2,:)';
test_samples = IIDFimg_2(:,test_SL(1,:))';
test_labels = test_SL(2,:)';
% Normalizing Training and original img 
[train_samples,M,m] = scale_func(train_samples);
[IIDFimg_2] = scale_func(IIDFimg_2',M,m);
% Selecting the paramter for SVM
[Ccv Gcv cv cv_t]=cross_validation_svm(train_labels,train_samples);
% Training using a Gaussian RBF kernel
parameter=sprintf('-c %f -g %f -m 500 -t 2 -q',Ccv,Gcv);
model=svmtrain(train_labels,train_samples,parameter);
% Testing
IIDFresult = svmpredict(ones(no_lines*no_rows,1),IIDFimg_2,model); 
% Evaluation
GroudTest = double(test_labels(:,1));
IIDFresultTest = IIDFresult(test_SL(1,:),:);
[IIDFOA,IIDFAA,IIDFkappa,IIDFCA]=confusion(GroudTest,IIDFresultTest)
IIDFresult = reshape(IIDFresult,no_lines,no_rows);
% IIDFresult_set(:,:,i)=IIDFresult;
IIDFmap=label2color(IIDFresult,'india');
figure,imshow(IIDFmap);