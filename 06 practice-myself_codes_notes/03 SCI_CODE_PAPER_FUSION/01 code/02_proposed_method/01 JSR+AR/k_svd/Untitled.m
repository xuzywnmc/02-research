function image_Patterns=Choose_Patterns(patchSize,overlap);
[blocks,maps]=Myim2col(A,[patchSize,patchSize],2);%blocks��9*64�ľ���
X=randperm((60-patchSize+1)*(60-patchSize+1));%X��1~100�������
image_Patterns=zeros(patchSize*patchSize,100);
for i=1:100
    image_Patterns(:,i)=blocks(:,X(i));
end

    