close all
clc;
clear all;
%�˳���Ϊ��ʾ�ֵ����
%�����ֵ�
for ii=1:7
%     cd('.\MAT_DATA');%�˴�������� ����ý��ֵ��ļ����Ƶ�����ķ���
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');
   currentFile = sprintf('Dksvd%d.mat',ii+channel*10);
   load(currentFile);

   eval(['D','=','Dksvd',';']);
   G=D'*D;
   eval(['G',num2str(ii),'=','G',';']);
%           cd('..');
cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS');
% D=Dksvd;
bb=8; % block size
RR=4; % redundancy factor
K=RR*bb^2; % number of atoms in the dictionary

figure;
I = displayDictionaryElementsAsImage(D, floor(sqrt(K)), floor(size(D,2)/floor(sqrt(K))),bb,bb);

end
% cd('C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\02_proposed_method\05 TEST-IHS\MAT_DATA');

