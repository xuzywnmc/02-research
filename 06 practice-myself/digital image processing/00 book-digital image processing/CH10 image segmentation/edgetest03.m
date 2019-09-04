f=imread('./image/g3.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图')
%
%其中f 是输入图像，T 是一个指定的阈值 ，dir指定检测边缘的首选方向：‘horizontal’、’vertical’、 或’both’(默认）
% g 是在被检测到边缘的位置处为 1而在其他位置为0 的逻辑类图像
% 输出参数t 是可选的，它是函数edge所用的阈值
% 若指定了T的值，则t = T ; 否则，若T 未被赋值 ，则函数edge会令t 等于它自动确定的一个阈值，然后用于边缘检测。
% 在输出参量中要包括t的主要原因之一是为了得到一个阈值的初始值
% 若使用语法 g = edge(f) 或 [g, t] = edge(f) ，则函数edge会默认使用Sobel 检测器
%
%之所以提取垂直分量还是会出现屋檐斜坡那是因为斜分量也有垂直分量
%[g, t] = edge(f, 'soble', T, dir)
%
%可以看出的是 其实这种边缘检测器对于瓦片之类的还是不能很好的分割
g = edge(f);
subplot(2,2,2);
imshow(g,[]);
title('Subplot 2: soble 边缘检测器 默认设置')

g = edge(f,'vertical');
subplot(2,2,3);
imshow(g,[]);
title('Subplot 2: soble 只含垂直分量')

g = edge(f,'horizontal');
subplot(2,2,4);
imshow(g,[]);
title('Subplot 2: soble 只含水平分量')
