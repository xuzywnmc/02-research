% ��HaarС�����õ���Ӧ����������
lshaar=liftwave('haar');
% ��ʾ�õ�����������
displs(lshaar);
% ��ӵ�ELS����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
displs(lsnew);
