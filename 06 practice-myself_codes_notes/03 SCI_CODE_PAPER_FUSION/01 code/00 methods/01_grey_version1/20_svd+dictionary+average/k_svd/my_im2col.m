function [blocks,idx] = my_im2col(I,blkSize,slidingDis);
if (slidingDis==1)
    blocks = im2col(I,blkSize,'sliding');
    idx = [1:size(blocks,2)];%inxΪ1��size(blocks,2)��block��������������
    return
end

idxMat = zeros(size(I)-blkSize+1);%����һ��m1��m2�ľ����0���� m1ΪI��������ȥblksize�ĵ�һ���ټ�1 ����ͬ��
idxMat([[1:slidingDis:end-1],end],[[1:slidingDis:end-1],end]) = 1; % ��indmat������д�1ÿ��slidingDisֱ��end-1�����һ��Ԫ�ظ�ֵΪ1 ͬ����Ҳ����� take blocks in distances of 'slidingDix', but always take the first and last one (in each row and column).
idx = find(idxMat);%�ҳ������Ԫ���ھ����е�λ��
[rows,cols] = ind2sub(size(idxMat),idx);%��inx����Ŷ�Ӧ��idxMat�е���Ŵ����rows�͵�cols��
blocks = zeros(prod(blkSize),length(idx));%����һ��blkSize(1)��blkSize(2)Ϊ�� inxΪ�������
for i = 1:length(idx)
    currBlock = I(rows(i):rows(i)+blkSize(1)-1,cols(i):cols(i)+blkSize(2)-1);%��image�е�rows�ĵ�i�е���i��+blkSize(1)-1�� cols�ĵ�i�е�cols+blkSize(2)-1�и���currBlock 
    blocks(:,i) = currBlock(:);%currBlockת��Ϊ��������blocks
end
%�Ѿ����
