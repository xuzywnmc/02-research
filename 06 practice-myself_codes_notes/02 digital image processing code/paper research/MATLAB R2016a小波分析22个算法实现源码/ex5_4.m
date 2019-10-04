%产生白噪声
y=randn(1,1000);  
%生成不同的阈值
thr1=thselect(y,'rigrsure')  
thr2=thselect(y,'sqtwolog')  
thr3=thselect(y,'heursure')  
thr4=thselect(y,'minimaxi')  
