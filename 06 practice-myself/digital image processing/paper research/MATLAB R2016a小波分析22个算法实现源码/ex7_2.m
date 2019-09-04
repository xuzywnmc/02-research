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
title('(a) �߶�Ϊ1ʱ�ĵ�Ƶͼ��');
figure(2)
image(wcodemat(H1,nbcol));colormap(map);
title('(b) �߶�Ϊ1ʱ��ˮƽ��Ƶͼ��');
figure(3)
image(wcodemat(V1*90,nbcol));colormap(map);
title('(c) �߶�Ϊ1ʱ�Ĵ�ֱ��Ƶͼ��');
figure(4)
image(wcodemat(D1*89,nbcol));colormap(map);
title('(d) �߶�Ϊ1ʱ�ĶԽǸ�Ƶͼ��');

figure(5)
image(wcodemat(A2,nbcol));colormap(map);
title('(e) �߶�Ϊ2ʱ�ĵ�Ƶͼ��');
figure(6)
image(wcodemat(H2,nbcol));colormap(map);
title('(f) �߶�Ϊ2ʱ��ˮƽ��Ƶͼ��');
figure(7)
image(wcodemat(V2,nbcol));colormap(map);
title('(g) �߶�Ϊ2ʱ�Ĵ�ֱ��Ƶͼ��');
figure(8)
image(wcodemat(D2,nbcol));colormap(map);
title('(h) �߶�Ϊ2ʱ�ĶԽǸ�Ƶͼ��');

figure(9)
image(wcodemat(A3,nbcol));colormap(map);
title('(i) �߶�Ϊ3ʱ�ĵ�Ƶͼ��');
figure(10)
image(wcodemat(H3,nbcol));colormap(map);
title('(j) �߶�Ϊ3ʱ��ˮƽ��Ƶͼ��');
figure(11)
image(wcodemat(V3,nbcol));colormap(map);
title('(k) �߶�Ϊ3ʱ�Ĵ�ֱ��Ƶͼ��');
figure(12)
image(wcodemat(D3,nbcol));colormap(map);
title('(l) �߶�Ϊ3ʱ�ĶԽǸ�Ƶͼ��');
