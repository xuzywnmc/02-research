%psi.m
function p=psi(t)
if abs(x)<=5 
    p=(2*(pi^(-0.25))/(sqrt(3)))*(1-t.^2).*exp(-(t.^2)/2); %С��ĸ����
else 
    p=0;
end
    
