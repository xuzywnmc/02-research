clear all;
x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));
plot(x,y,'--rp','LineWidth',2.5,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','b',...
                'MarkerSize',12)
