% a=[1,2,3;4,5,6;7,8,9;7,8,9];
% n=find(a(1,:));
clc;clear;
image_input1=double(imread('./1.tif')); 
figure;
imshow(uint8(image_input1),[]);
% figure;
% imshow(out_image,[]);
% for ceng=1
image=image_input1;;
Image = imresize(image, [256,256]);
K=256;
%���������ζ�Ų���ȥ��ʲô��ֵ
reduceDC = 1;
[NN1,NN2] = size(Image);
waitBarOn = 1;
numIterOfKsvd = 5;
C = 1.15;
maxBlocksToConsider = 260000;
slidingDis = 1;
bb = 8;
maxNumBlocksToTrainOn = 65000;
displayFlag = 1;
errT=25;

% first, train a dictionary on blocks from the noisy image

    blkMatrix = im2col(Image,[bb,bb],'sliding');
blkMatrix_copy=blkMatrix;

param.K = K;
param.numIteration = numIterOfKsvd ;

param.errorFlag = 1; % decompose signals until a certain error is reached. do not use fix number of coefficients.
 %������ ������õ�̫С �ͻᵼ�³ٳ��ֵ�ѵ��������
param.errorGoal = 25;
kk=25^2*64;
param.preserveDCAtom = 0;
%%
%����DCT�ֵ�
Pn=ceil(sqrt(K));
DCT=zeros(bb,Pn);
for k=0:1:Pn-1,
    V=cos([0:1:bb-1]'*k*pi/Pn);
    if k>0, V=V-mean(V); end;
    DCT(:,k+1)=V/norm(V);
end;
DCT=kron(DCT,DCT);
%%
param.initialDictionary = DCT(:,1:param.K );
param.InitializationMethod =  'GivenMatrix';

if (reduceDC)
    vecOfMeans = mean(blkMatrix);
    blkMatrix = blkMatrix-ones(size(blkMatrix,1),1)*vecOfMeans;
end

if (waitBarOn)
    counterForWaitBar = param.numIteration+1;
    h = waitbar(0,'Denoising In Process ...');
    param.waitBarHandle = h;
    param.counterForWaitBar = counterForWaitBar;
end


param.displayProgress = displayFlag;
[Dictionary,output] = KSVD(blkMatrix,param);
[blocks,idx] = my_im2col(Image,[bb,bb],slidingDis);
% idx=[1 2 3 4 5.....62001]
%%
%�ж��Ƿ����
if blocks==blkMatrix_copy
    biaozhi=1;
end
%%
%  blocks = im2col(I,blkSize,'sliding');
%     idx = [1:size(blocks,2)];%inxΪ1��size(blocks,2)��block��������������

if (waitBarOn)
    newCounterForWaitBar = (param.numIteration+1)*size(blocks,2);
end

% ceshi=0;
for jj = 1:30000:size(blocks,2)
    %%
    %�˴�˵�����ѭ����������� ��Ϊ����ֵΪ4 jj�ֱ�ȡֵΪ1 30001 60001
%     ceshi=ceshi+1;
%     ceshi1(ceshi)=jj;
    %%
%     if (waitBarOn)
%         waitbar(((param.numIteration*size(blocks,2))+jj)/newCounterForWaitBar);
%     end
    jumpSize = min(jj+30000-1,size(blocks,2));
    if (reduceDC)
% jumpSize �ֱ�Ϊ30000 60000 62001 jj�ֱ�ȡֵΪ1 30001 60001 �൱�ڷֳ�������
        vecOfMeans = mean(blocks(:,jj:jumpSize));
%  B=repmat( [1 2;3 4],2,3) �൱�ھ��Ǹ��ƹ���
% B = 
% 
% 1      2      1     2    1    2
% 
% 3      4      3     4    3    4
% 
% 1     2     1     2     1     2
% 
% 3     4     3     4     3     4
% repmat(vecOfMeans,size(blocks,1),1);Ҳ�൱�ھ��ǰѾ�ֵ�����һ����
        blocks(:,jj:jumpSize) = blocks(:,jj:jumpSize) - repmat(vecOfMeans,size(blocks,1),1);
    end
%     
%     %Coefs = mexOMPerrIterative(blocks(:,jj:jumpSize),Dictionary,errT);
    Coefs = OMPerr(Dictionary,blocks(:,jj:jumpSize),errT);
    if (reduceDC)
        blocks(:,jj:jumpSize)= Dictionary*Coefs + ones(size(blocks,1),1) * vecOfMeans;
    else
        blocks(:,jj:jumpSize)= Dictionary*Coefs ;
    end
end
% 
count = 1;
Weight = zeros(NN1,NN2);
IMout = zeros(NN1,NN2);
test_ind2sub=size(Image)-bb+1;
%�˾���˼���ǽ�[249,249]�� idx��1 2 3 62001�� ת��Ϊ
%ʵ������ cols(1  1 1 1 1 1 1 1 1...1)һ��249λ rows����
% (1 2 3 4 5 6 7 ...);
[rows,cols] = ind2sub(size(Image)-bb+1,idx);
for i  = 1:length(cols)
    col = cols(i); row = rows(i);   
%     �൱�ھ��Ǹ�ȡһ��
    block =reshape(blocks(:,count),[bb,bb]);
    %��ÿ��ȡ���� reshapeһ��
    IMout(row:row+bb-1,col:col+bb-1)=IMout(row:row+bb-1,col:col+bb-1)+block;
    Weight(row:row+bb-1,col:col+bb-1)=Weight(row:row+bb-1,col:col+bb-1)+ones(bb);
    count = count+1;
end;
% 
if (waitBarOn)
    close(h);
end
%%0.034*25=0.85��
% IOut = (Image+0.034*0.85)./(1+0.034*0.85);

IOut = (Image+0.85*IMout)./(1+0.85*Weight);
% out_put=IMout./Weight;
% out_image(:,:,ceng)=out_put;
% end
figure;
imshow(IOut,[]);
% errors=Image-IOut;
% [a1,a2]=max(errors);

