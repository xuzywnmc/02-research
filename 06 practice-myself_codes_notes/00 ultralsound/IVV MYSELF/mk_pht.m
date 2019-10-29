%  Make the scatteres for a simulation and store
%  it in a file for later simulation use

%   Joergen Arendt Jensen, Feb. 26, 1997

[phantom_positions, phantom_amplitudes] = cyst_pht(100000);
  %����Ѫ��λ����
  vp=800/1000;
  R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
  dz=R/25
            for i=1:25
                vr(i)=vp*(1-((dz*i)/R)^2);%�����Ѫ���ٶ� �����ߺ���
            end
                vr2=fliplr(vr);%��ת���� ��ת����[1 2 3]��ת֮�����[3 2 1]
                vr1=[vr2,vr];%������������ƴ����
                s=[];
            for i=1:50
                t=1/50;
                s(i)=vr1(i)*t;%���Ѫ����λ����
            end
%  for j=1:50
            for i=1:50%Ѫ����λ����-Ѫ����Ѫ���ڲ�ɢ���������X��仯
        h=find(phantom_positions(:,3)>=(55.5/1000+dz*(i-1)) & phantom_positions(:,3)<=(55.5/1000+dz*i));
        phantom_positions(h,1)=phantom_positions(h,1)+s(i); 
        %�˴��ҳ�h�� Ҳ����Ѫ���ڵı���������Ѫ�ܵ�ֵ
        %find(phantom_positions(h,1)>20/1000 )����Ѿ���������������
        h1=find(phantom_positions(h,1)>20/1000 );
        h3=h(h1);
        %�˴��൱�ھ��ҳ���ԭ���������ֵ����Ӧ�����
        phantom_positions(h3,1)=-20/1000;
            end
            %%��ôЩ������ ��Ϊ�൱��ֱ�ӽ�ȫ�������¿�ʼ�� ����Ҫ�Ȱ�Ѫ���ڵ�������
      
eval(['save pht_data/pht_data' num2str(1) ' phantom_positions phantom_amplitudes'])
%  end