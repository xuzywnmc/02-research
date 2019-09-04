[wp,x]=wpfun('db2',7);
for i=1:8
    w=wp(i,:);
    subplot(4,2,i);plot(w);
    ylabel(['W',num2str(i)]);
end
