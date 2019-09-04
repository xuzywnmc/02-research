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
    %numel函数用于计算数组中满足指定条件的元素个数
    SI=f==S;
    S1=S;
else
    %S是一个数组。排除重复，它包含在以下编码部分与种子位置联系去减少循环执行数量。
    SI=bwmorph(3,'shrink',Inf);
    % BW2 = bwmorph(BW,operation,n)对二值图像进行n次指定的形态学处理
    %  'shrink' n = Inf时，将目标缩成一个点。没有孔洞的目标缩成一个点，有孔洞的目标缩成一个连通环
    J=find(J);
    %b=find(a),a是一个矩阵,查询非零元素的位置
    %b=find(a,2),找出a中最先出现的2个不为零的数,a是你所要找的矩阵,2参数是指数量
end

TI=false(size(f));
% false(n)：该函数创建n*n的方阵，该方阵的所有元素为逻辑假，即0
for K=1:length(S1)
    seedvalue=S1(K);
    S=abs(f-seedvalue)<=T;
    TI=TI|S;
end
%使用SI的函数重构作为标记图像去获得区域与S中每个种子相符合。
%函数bwlabel分配不同的整数去每个区域。
[g,NR]=bwlabel(imreconstruct(SI,TI));
%imreconstruct图像的形态学重构
% 运算涉及两张图和一个结构元素. 其中一张图是标记图像(marker), 
%标记了那些开始形态学变换的点; 
%另一张是掩模图像(mask), 约束参与形态学变换的区域
%这个涉及到第九章9.5形态学重构

