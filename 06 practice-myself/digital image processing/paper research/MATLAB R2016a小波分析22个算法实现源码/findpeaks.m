function n=findpeaks(x)
%�ҵ���ֵ��
n=find(diff(diff(x)>0)<0);
u=find(x(n+1)>x(n));
n(u)=n(u)+1;
