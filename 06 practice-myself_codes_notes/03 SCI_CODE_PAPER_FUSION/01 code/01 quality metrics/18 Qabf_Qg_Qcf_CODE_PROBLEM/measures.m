
%计算RMSE
%ira是源图像A
%irb是源图像B
%irrt是融合图像

function[G,P,C,QE]=measures(ira,irb,irrt)
G = fusionqp(ira,irb,irrt);w=3;[P,C,QE] = fusionQwbnew(ira,irb,irrt,w);

end

function [QP] = fusionqp(X1,X2,furt)
opsobel=fspecial('sobel'); %Qab/f
sax=imfilter(X1,opsobel,'replicate')+1e-10;say=imfilter(X1,opsobel','replicate')+1e-10;ga=sqrt(sax.^2+say.^2)+1e-10;alpha=atan(say./sax);
sbx=imfilter(X2,opsobel,'replicate')+1e-10;sby=imfilter(X2,opsobel','replicate')+1e-10;gb=sqrt(sbx.^2+sby.^2)+1e-10;alphb=atan(sby./sbx);
scx=imfilter(furt,opsobel,'replicate')+1e-10;scy=imfilter(furt,opsobel','replicate');gc=sqrt(scx.^2+scy.^2)+1e-10;alphc=atan(scy./scx);
Aac=1-abs(alpha-alphc)./(pi./2);Gac=gc./ga;Gacb=ga./gc;
D = ga>gc;Gac=Gac.*D + Gacb.*(~D);
QGac=0.9994./(1+exp(-15.*(Gac-0.5)));QAac=0.9879./(1+exp(-22.*(Aac-0.8)));
Qac=QGac.*QAac;
Abc=1-abs(alphb-alphc)./(pi./2);Gbc=gc./gb;Gbcb=gb./gc;
D = gb>gc;Gbc=Gbc.*D + Gbcb.*(~D);
QGbc=0.9994./(1+exp(-15.*(Gbc-0.5)));QAbc=0.9879./(1+exp(-22.*(Abc-0.8)));
Qbc=QGbc.*QAbc;
QP=sum(sum(Qac.*ga+Qbc.*gb))./sum(sum(ga+gb));
end

function [QP] = fusionQQ(X1,X2)
ax1=mean2(X1);ax2=mean2(X2); % root-mean-square error
a1=X1-ax1;a2=X2-ax2;sg1=mean2(a1.*a1);sg2=mean2(a2.*a2);sg12=mean2(a1.*a2);
QP=sg12.*4.*ax1.*ax2.*sg1.*sg2./(sg1.*sg2.*(ax1.^2+ax2.^2).*(sg1.^2+sg2.^2));
end

function [Q,QW,QE] = fusionQwbnew(X1,X2,furt,w)
[m n]=size(X1);
k=0;
for i=w+1:w:m-w
    for j=w+1:w:n-w
        k=k+1;
        A=X1(i-w:i+w,j-w:j+w);B=X2(i-w:i+w,j-w:j+w);F=furt(i-w:i+w,j-w:j+w);
        sa=var(A(:));sb=var(B(:));na=sa./(sa+sb+1e-10);nb=1-na;c(k)=max(sa,sb);
        sq(k)=na.*fusionQwb0(A,F)+nb.*fusionQwb0(B,F);
    end
end
Q=mean(sq);
QW=sum(c.*sq)./sum(c);
[gx,gy]=gradient(X1);X1=sqrt(gx.^2+gy.^2);X1=X1./max(X1(:));
[gx,gy]=gradient(X2);X2=sqrt(gx.^2+gy.^2);X2=X2./max(X2(:));
[gx,gy]=gradient(furt);furt=sqrt(gx.^2+gy.^2);furt=furt./max(furt(:));
k=0;
for i=w+1:w:m-w
    for j=w+1:w:n-w
        k=k+1;
        A=X1(i-w:i+w,j-w:j+w);B=X2(i-w:i+w,j-w:j+w);F=furt(i-w:i+w,j-w:j+w);
        sa=var(A(:));sb=var(B(:));na=sa./(sa+sb+1e-10);nb=1-na;c(k)=max(sa,sb);
        sq(k)=na.*fusionQwb0(A,F)+nb.*fusionQwb0(B,F);
    end
end
Qe=mean(sq);
QeW=sum(c.*sq)./sum(c);
QE=sqrt(QW).*sqrt(QeW);
end

function [QP] = fusionQwb(X1,furt,w)
[m n]=size(X1);
k=0;sq0=0;
for i=w+1:m-w
    for j=w+1:n-w
        k=k+1;
        A=X1(i-w:i+w,j-w:j+w);B=furt(i-w:i+w,j-w:j+w);
        sq0=fusionQwb0(A,B)
    end
end
QP=sq0./k;
end

function [QP] = fusionQwb0(X1,X2)
X1=X1(:);X2=X2(:);ax1=mean(X1);ax2=mean(X2); % Wang % Bovik
a1=X1-ax1;a2=X2-ax2;sg1=mean(a1.*a1);sg2=mean(a2.*a2);sg12=mean(a1.*a2);
QP=4.*sg12.*ax1.*ax2/((ax1.^2+ax2.^2).*(sg1+sg2)+1e-10);
end


