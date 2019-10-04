% 获得db2小波的提升方案
lsdb2=liftwave('db2');
% 显示提升方案
displs(lsdb2);
% 获得sym2小波的提升方案
lssym2=liftwave('sym2');
% 显示提升方案
displs(lssym2);
% 获得整数变换提升方案
lsdb2=liftwave('db2','Int2Int');
x=[1:10];
lwtx=lwt(x,lsdb2)
