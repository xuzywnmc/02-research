% 得到Haar滤波器
[LoD,HiD,LoR,HiR]=wfilters('haar')
% 提升Haar滤波器
twoels(1)=struct('type','p','value',laurpoly([0.125 -0.125],0));
twoels(2)=struct('type','p','value',laurpoly([0.125 -0.125],1));
[LoDN,HiDN,LoRN,HiRN]=liftfilt(LoD,HiD,LoR,HiR,twoels);
% 得到双正交小波bior1.3
[LoDB,HiDB,LoRB,HiRB]=wfilters('bior1.3');
somewavelet=isequal([LoDB,HiDB,LoRB,HiRB],[LoDN,-HiDN,LoRN,HiRN])
