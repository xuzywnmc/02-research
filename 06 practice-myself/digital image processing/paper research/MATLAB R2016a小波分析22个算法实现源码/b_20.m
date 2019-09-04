clear all;
Z = peaks(100);
figure; 
set (gcf,'position',[400,100,600,600], 'color','w')
subplot(2,2,1); 
cl = [-7:1:10];         % Define contour levels for all plots
contour(Z, cl)
axis([0 100 0 100]); colormap autumn;
set(gca,'Xtick',[0 100],'Ytick',[0 100]);
title('Peaks Surface (underlying data)')
ZN = Z + rand(100) - .5;
subplot (2,2,2)
contour(ZN, cl)
axis([0 100 0 100]);
set(gca,'Xtick',[0 100],'Ytick',[0 100]);
title('Peaks Surface (noise added)')
F = [.05 .1 .05; .1 .4 .1; .05 .1 .05];
ZC = conv2(ZN,F,'same');
subplot (2,2,3)
contour(ZC, cl)
axis([0 100 0 100]);
set(gca,'Xtick',[0 100],'Ytick',[0 100]);
title('Noisy Surface (smoothed once)')
ZC2 = conv2(ZC,F,'same');
subplot (2,2,4)
contour(ZC2, cl)
axis([0 100 0 100]);
set(gca,'Xtick',[0 100],'Ytick',[0 100]);
title('Noisy Surface (smoothed twice)')
