[Lo_R,Hi_R]=wfilters(wname,'r');
ss=idwt(cA2,cD2,Lo_R,Hi_R);
sss=idwt(ss,cD1,Lo_R,Hi_R);
% ������ع��ź���ԭʼ�źŵ����
err=norm(s-sss)
figure;plot(sss);title('(f) �ع���ԭʼ�ź�');
xlabel(['������=',num2str(err)]);
