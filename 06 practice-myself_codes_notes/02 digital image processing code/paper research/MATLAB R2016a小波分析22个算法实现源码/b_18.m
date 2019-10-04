clear all;
theta=-pi:0.01:pi;
r=[sin(5*theta).^2;cos(8*theta).^2;sin(theta).^3;cos(5*theta).^3];
for k=1:4
    subplot(2,2,k)
    polar(theta,r(k,:))
end
