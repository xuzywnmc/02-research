t=linspace(-1,1,512);
 s=1-abs(t); c=cwt(s,1:32,'cgau4'); 
 c=cwt(s,[64 32 16:-2:2],'morl');
 c=cwt(s,[3 18 12.9 7 1.5],'db2');
 c=cwt(s,1:64, 'sym4','abslvl',[100:400]);
