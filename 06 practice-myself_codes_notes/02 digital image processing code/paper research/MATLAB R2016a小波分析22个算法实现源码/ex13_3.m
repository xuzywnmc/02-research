clear;
load nearbrk;
whos;
figure;
plot(nearbrk);
title('(a) 频率突变信号');
[c,l]=wavedec(nearbrk,3,'haar');
a3=wrcoef('a',c,l,'haar',3);
d3=wrcoef('d',c,l,'haar',3);
d2=wrcoef('d',c,l,'haar',2);
d1=wrcoef('d',c,l,'haar',1);
[c,l]=wavedec(nearbrk,3,'db5');
aa3=wrcoef('a',c,l,'db5',3);
dd3=wrcoef('d',c,l,'db5',3);
dd2=wrcoef('d',c,l,'db5',2);
dd1=wrcoef('d',c,l,'db5',1);
%figure;
%plot(a3);
%title('(a) 近似信号a3');
figure;
plot(d3);
title('(b) 细节信号d3');
figure;
plot(d2);
title('(c) 细节信号d2');
figure;
plot(d1);
title('(d) 细节信号d1');
figure;
plot(aa3);
title('(e) 近似信号a3');
figure;
plot(dd3);
title('(f) 细节信号d3');
figure;
plot(dd2);
title('(g) 细节信号d2');
figure;
plot(dd1);
title('(h) 细节信号d1');
