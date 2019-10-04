function edpoint=nmsupress(cor)

%%do the non-maxium supression%%%%%%%%%
%%cor-- 1-D signal, the input correlation%%%%%%%

n=length(cor);
edpoint=zeros(1,n);

for i=2:n-1
   if (cor(i)>cor(i-1))&(cor(i)>cor(i+1))
      edpoint(i)=1;
   elseif (cor(i)<cor(i-1))&(cor(i)<cor(i+1))
      edpoint(i)=1;
   end
end

return