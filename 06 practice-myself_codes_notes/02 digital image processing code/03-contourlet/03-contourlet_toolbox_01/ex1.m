im = imread ('zoneplate.png');

nlevels = [0,2] ;
pfilter = '9-7';
dfilter = 'pkva';
coeffs = pdfbdec( double(im), pfilter, dfilter, nlevels );

imcoeff = showpdfb( coeffs ) ;
title('Contourlet coefficients');



