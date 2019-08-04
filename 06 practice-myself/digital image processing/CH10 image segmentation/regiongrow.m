%regiongrowԴ����
function [g,NR,SI,TI]=regiongrow(f,S,T)
%regiongrowִ����������
%[g,NR,SI,TI]=regiongrow(f,S,T).S������һ�����飬����ÿ�����ӵ������Ϊ1.
%SҲ�����ǵ������ӡ�
%���Ƶأ�T������һ�����飬f�е�ÿ��λ�ö�����һ����ֵ��
%TҲ������һ��������������һ��ȫ����ֵ��
%
%������У�g�Ƿָ���ͼ��ÿ������ĳ�Ա�������������
%����NR�ǲ�ͬ�������Ŀ��
%����SI��һ�����������ӵ��ͼ��
%����TI��һ��ͼ�񣬸�ͼ���а����ھ�����ͨ�Դ���ǰͨ����ֵ���Ե����ء�

f=double(f);
%���S�Ǳ��������������ͼ��
if numel(S)==1
    SI=f==S;
    S1=S;
else
    %S��һ�����顣�ų��ظ��������������±��벿��������λ����ϵȥ����ѭ��ִ��������
    SI=bwmorph(3,'shrink',Inf);
    J=find(J);
end

TI=false(size(f));
for K=1:length(S1)
    seedvalue=S1(K);
    S=abs(f-seedvalue)<=T;
    TI=TI|S;
end
%ʹ��SI�ĺ����ع���Ϊ���ͼ��ȥ���������S��ÿ����������ϡ�
%����bwlabel���䲻ͬ������ȥÿ������
[g,NR]=bwlabel(imreconstruct(SI,TI));

