im = imread ('zoneplate.png') ;

colormap(gray);

nlevels = [0,2] ;
pfilter = '9-7';
dfilter = 'pkva';
coeffs = pdfbdec( double(im), pfilter, dfilter, nlevels );

imrec = pdfbrec( coeffs, pfilter, dfilter ) ;

subplot(1,2,1), imagesc( im, [0, 255] ); 
title('Original image' ) ;
axis image off;
subplot(1,2,2), imagesc( imrec, [0, 255] );
title('Reconstructed image' ) ;
axis image off;
