
function plot_hht(x,Ts)
%x为输入信号
%Ts为频率
%调用自定义函数emd
imf=emd(x);
for k=1:length(imf)
    b(k)=sum(imf{k}.*imf{k});
    th=angle(hilbert(imf{k}));
    d{k}=diff(th)/Ts/(2*pi);
end
[u,v]=sort(-b);
b=1-b/max(b);
%绘制时频图
N=length(x);
c=linspace(0,(N-2)*Ts,N-1);
for k=v(1:2)
    figure;
    plot(c,d{k},'r.','Color',b([k k k]),'MarkerSize',3);
    set(gca,'FontSize',8,'XLim',[0 c(end)],'YLim',[0 1/2/Ts]);
    xlabel('时间');ylabel('频率');
end
%绘制IMF图
M=length(imf);
N=length(x);
c=linspace(0,(N-1)*Ts,N);
for k1=0:4:M-1
    figure;
    for k2=1:min(4,M-k1),
        subplot(4,1,k2);
        plot(c,imf{k1+k2});
        set(gca,'FontSize',8,'XLim',[0,c(end)]);
    end
    xlabel('时间');
end
