% ʹ��Cohen-Daubechies-FeauveauС��������Ӧ����������
lscdf=liftwave('cdf3.1');
% ��ʾ�õ�����������
displs(lscdf);
% ����������ת��Ϊ˫�����˲���quadruplet
[LoD,HiD,LoR,HiR]=ls2filt(lscdf);
% ��ʾ���ֳ߶Ⱥ�С������
bswfun(LoD,HiD,LoR,HiR,'plot');
