f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图');

fe=imerode(f,ones(51,1));
%竖线进行腐蚀
subplot(2,2,2);
imshow(fe,[]);
title('Subplot 1: 原图');

f0=imopen(f,ones(51,1));
%竖线进行腐蚀
subplot(2,2,3);
imshow(f0,[]);
title('Subplot 1: 原图');


fobr=imreconstruct(fe,f);
%竖线进行腐蚀
subplot(2,2,4);
imshow(fobr,[]);
title('Subplot 1: 原图');