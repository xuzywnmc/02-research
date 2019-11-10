function TRAIN_DICTIONARY(data,i)
%%��ʼ���ֵ� ����˵������ķ�ʽ
% bb=8;
% Pn=ceil(sqrt(256));
% DCT=zeros(bb,Pn);
% for k=2:2:2,
%     V=cos([0:1:bb-1]'*k*pi/Pn);
%     if k>0, V=V-mean(V); end;
%     DCT(:,k+1)=V/norm(V);
% end;
% DCT=kron(DCT,DCT);
%%
% % ����https://blog.csdn.net/dugudaibo/article/details/78418318����Ϊ��ȷ�ĵ�����DCT��ʽ
MM = 8; NN = 16;      % ����MM��DCT�ֵ��������NN��DCT�ֵ侭����Ƶ�����������
V = sqrt(2 / MM)*cos((0:MM-1)'*(0:NN-1)*pi/MM/2); 
V(1,:) = V(1,:) / sqrt(2);
DCT=kron(V,V); 
for k=1:size(DCT,1)
V1=DCT(:,k)-mean(DCT(:,k));
DCT(:,k)=V1/norm(V1);
end
% for i=1:7
%     eval(['params.data','=','data',num2str(i),';']);
params.data = data;
params.Edata = 0.01;
params.dictsize = 256;
params.initdict=DCT(:,1:256);
params.iternum = 30;
%�����㷨ģʽ ��ѡ��highʱ ��˵����OMP�㷨ѵ��ʱ
%��ҪG=D'*D and DtX=D'*X
params.memusage = 'high';
params.codemode='error';
[Dksvd,g,err] = ksvd(params,'');
%  eval(['Dksvd',num2str(i),'=','Dksvd',';']);
 cd('.\MAT_DATA');
    currentFile = sprintf('.\MAT_DATA\Dksvd%d.mat',i);
   save(currentFile,'Dksvd')
    cd('..');
%  eval([save,'DKSVD.data','Dksvd',num2str(i),';']); 
% end
end
