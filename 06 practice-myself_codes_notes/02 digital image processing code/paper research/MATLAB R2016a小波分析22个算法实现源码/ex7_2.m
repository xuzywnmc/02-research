gray=imread('cameraman.tif');
[X,map]=gray2ind(gray);
nbcol=size(map,1);
figure(14);
image(X);colormap(map);
[c,s]=wavedec2(X,3,'sym8');
A1=wrcoef2('a',c,s,'sym8',1);
H1=wrcoef2('h',c,s,'sym8',1);
V1=wrcoef2('v',c,s,'sym8',1);
D1=wrcoef2('d',c,s,'sym8',1);
A2=wrcoef2('a',c,s,'sym8',2);
H2=wrcoef2('h',c,s,'sym8',2);
V2=wrcoef2('v',c,s,'sym8',2);
D2=wrcoef2('d',c,s,'sym8',2);
A3=wrcoef2('a',c,s,'sym8',3);
H3=wrcoef2('h',c,s,'sym8',3);
V3=wrcoef2('v',c,s,'sym8',3);
D3=wrcoef2('d',c,s,'sym8',3);

figure(1)
image(wcodemat(A1,nbcol));colormap(map); 
title('(a) 尺度为1时的低频图像');
figure(2)
image(wcodemat(H1,nbcol));colormap(map);
title('(b) 尺度为1时的水平高频图像');
figure(3)
image(wcodemat(V1*90,nbcol));colormap(map);
title('(c) 尺度为1时的垂直高频图像');
figure(4)
image(wcodemat(D1*89,nbcol));colormap(map);
title('(d) 尺度为1时的对角高频图像');

figure(5)
image(wcodemat(A2,nbcol));colormap(map);
title('(e) 尺度为2时的低频图像');
figure(6)
image(wcodemat(H2,nbcol));colormap(map);
title('(f) 尺度为2时的水平高频图像');
figure(7)
image(wcodemat(V2,nbcol));colormap(map);
title('(g) 尺度为2时的垂直高频图像');
figure(8)
image(wcodemat(D2,nbcol));colormap(map);
title('(h) 尺度为2时的对角高频图像');

figure(9)
image(wcodemat(A3,nbcol));colormap(map);
title('(i) 尺度为3时的低频图像');
figure(10)
image(wcodemat(H3,nbcol));colormap(map);
title('(j) 尺度为3时的水平高频图像');
figure(11)
image(wcodemat(V3,nbcol));colormap(map);
title('(k) 尺度为3时的垂直高频图像');
figure(12)
image(wcodemat(D3,nbcol));colormap(map);
title('(l) 尺度为3时的对角高频图像');
