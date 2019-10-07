function C=hf_fusion(A,B,r)

A=double(A);
B=double(B);
[M,N]=size(A);

ker=ones(2*r+1,2*r+1)./((2*r+1)*(2*r+1));
diff=imfilter(A.^2,ker,'replicate')-imfilter(B.^2,ker,'replicate');

decisionMap=zeros(M,N);
decisionMap(diff>0)=1;

C=A.*decisionMap+B.*(1-decisionMap);



