% 由Haar小波，得到相应的提升方案
lshaar=liftwave('haar');
% 显示得到的提升方案
displs(lshaar);
% 添加到ELS到提升方案
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
displs(lsnew);
