% ���db2С������������
lsdb2=liftwave('db2');
% ��ʾ��������
displs(lsdb2);
% ���sym2С������������
lssym2=liftwave('sym2');
% ��ʾ��������
displs(lssym2);
% ��������任��������
lsdb2=liftwave('db2','Int2Int');
x=[1:10];
lwtx=lwt(x,lsdb2)
