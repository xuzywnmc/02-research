% �õ�Haar�˲���
[LoD,HiD,LoR,HiR]=wfilters('haar')
% ����Haar�˲���
twoels(1)=struct('type','p','value',laurpoly([0.125 -0.125],0));
twoels(2)=struct('type','p','value',laurpoly([0.125 -0.125],1));
[LoDN,HiDN,LoRN,HiRN]=liftfilt(LoD,HiD,LoR,HiR,twoels);
% �õ�˫����С��bior1.3
[LoDB,HiDB,LoRB,HiRB]=wfilters('bior1.3');
somewavelet=isequal([LoDB,HiDB,LoRB,HiRB],[LoDN,-HiDN,LoRN,HiRN])
