%psi.m
function p=pkk(x)
if abs(x)<=5 
    p=(2*(pi^(-0.25))/(sqrt(3)))*(1-x.^2).*exp(-(x.^2)/2); %Ð¡²¨Ä¸º¯Êý
else 
    p=0;
end
    
