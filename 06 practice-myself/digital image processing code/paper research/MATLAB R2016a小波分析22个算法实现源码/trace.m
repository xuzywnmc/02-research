function trace(vm,vd);
zm=i;% �˵�λ��
zd=8+5i; % ����λ��
% vm=3; % �˵��ٶ�
% vd=3.5; % �����ٶ�
dt=0.02; % ʱ����
A=0; % �������˶��ķ���
pm=plot(zm,'ko'); % �����˵�λ��
hold on;
pd=plot(zd,'k');% ���ƹ��˶��Ĺ켣
while abs(zm(end)-zd(end))>0.01; % ѭ�����㹷���˶��켣
    At=angle(zm-zd(end)); % ���㹷��ǰ�˶��ķ���
    zd=[zd,zd(end)+exp(i*At)*vd*dt]; % ���㹷����һʱ�̵�λ��
    zm=zm+exp(i*A)*vm*dt; % ������һʱ���˵�λ��
    set(pm,'xdata',real(zm),'ydata',imag(zm)); % �����˵�λ��
    set(pd,'xdata',real(zd),'ydata',imag(zd)); % ���¹����˶��켣
    pause(0.2); % ��ͣ0.2������ʾ����Ч��
end
axis([0,max(real(zd)),0,5]); % ���������᷶Χ
