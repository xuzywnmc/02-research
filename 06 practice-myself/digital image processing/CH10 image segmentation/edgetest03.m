f=imread('./image/g3.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ')
%
%����f ������ͼ��T ��һ��ָ������ֵ ��dirָ������Ե����ѡ���򣺡�horizontal������vertical���� ��both��(Ĭ�ϣ�
% g ���ڱ���⵽��Ե��λ�ô�Ϊ 1��������λ��Ϊ0 ���߼���ͼ��
% �������t �ǿ�ѡ�ģ����Ǻ���edge���õ���ֵ
% ��ָ����T��ֵ����t = T ; ������T δ����ֵ ������edge����t �������Զ�ȷ����һ����ֵ��Ȼ�����ڱ�Ե��⡣
% �����������Ҫ����t����Ҫԭ��֮һ��Ϊ�˵õ�һ����ֵ�ĳ�ʼֵ
% ��ʹ���﷨ g = edge(f) �� [g, t] = edge(f) ������edge��Ĭ��ʹ��Sobel �����
%
%֮������ȡ��ֱ�������ǻ��������б��������Ϊб����Ҳ�д�ֱ����
%[g, t] = edge(f, 'soble', T, dir)
%
%���Կ������� ��ʵ���ֱ�Ե�����������Ƭ֮��Ļ��ǲ��ܺܺõķָ�
g = edge(f);
subplot(2,2,2);
imshow(g,[]);
title('Subplot 2: soble ��Ե����� Ĭ������')

g = edge(f,'vertical');
subplot(2,2,3);
imshow(g,[]);
title('Subplot 2: soble ֻ����ֱ����')

g = edge(f,'horizontal');
subplot(2,2,4);
imshow(g,[]);
title('Subplot 2: soble ֻ��ˮƽ����')
