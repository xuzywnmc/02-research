x=rand(1,200);% ����һ����ʼ������ź�
% �����ź�x��shannon��
e1=wentropy(x,'shannon')
% �����ź�x�Ķ���������
e2=wentropy(x,'log energy')
% �����ź�x����ֵ�أ���ֵ����0.2
e3=wentropy(x,'threshold',0.2)
% �����ź�x��SURE�أ���ֵ����3
e4=wentropy(x,'sure',3)
% �����ź�x�ķ����أ�����ָ������1.1
e5=wentropy(x,'norm',1.1)
