f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ');

fe=imerode(f,ones(51,1));
%���߽��и�ʴ
subplot(2,2,2);
imshow(fe,[]);
title('Subplot 1: ԭͼ');

f0=imopen(f,ones(51,1));
%���߽��и�ʴ
subplot(2,2,3);
imshow(f0,[]);
title('Subplot 1: ԭͼ');


fobr=imreconstruct(fe,f);
%���߽��и�ʴ
subplot(2,2,4);
imshow(fobr,[]);
title('Subplot 1: ԭͼ');