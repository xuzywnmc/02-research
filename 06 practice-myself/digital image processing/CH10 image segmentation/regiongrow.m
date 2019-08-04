%regiongrow源程序
function [g,NR,SI,TI]=regiongrow(f,S,T)
%regiongrow执行区域生长
%[g,NR,SI,TI]=regiongrow(f,S,T).S可以是一个数组，它在每个种子点的坐标为1.
%S也可以是单个种子。
%相似地，T可以是一个数组，f中的每个位置都包含一个阈值。
%T也可以是一个标量，它定义一个全局阈值。
%
%在输出中，g是分割后的图像，每个区域的成员都用整数标出。
%参数NR是不同区域的数目。
%参数SI是一幅包含有种子点的图像。
%参数TI是一幅图像，该图像中包含在经过连通性处理前通过阈值测试的像素。

f=double(f);
%如果S是标量，则包含种子图像。
if numel(S)==1
    SI=f==S;
    S1=S;
else
    %S是一个数组。排除重复，它包含在以下编码部分与种子位置联系去减少循环执行数量。
    SI=bwmorph(3,'shrink',Inf);
    J=find(J);
end

TI=false(size(f));
for K=1:length(S1)
    seedvalue=S1(K);
    S=abs(f-seedvalue)<=T;
    TI=TI|S;
end
%使用SI的函数重构作为标记图像去获得区域与S中每个种子相符合。
%函数bwlabel分配不同的整数去每个区域。
[g,NR]=bwlabel(imreconstruct(SI,TI));

