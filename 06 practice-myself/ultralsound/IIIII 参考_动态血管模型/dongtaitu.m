[phantom_positions, phantom_amplitudes] = cyst_pht(10000);
R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
vp=800/1000;
d=1/1000;
d1=[];
for i=1:30
   t=1/50;%����֡��
    d1(i)=(d*(1/30)*i)*sin(pi*t);%�����Ѫ��λ���� �����Һ�������
end
            %����Ѫ��λ����
            for i=1:15
                vr(i)=vp*(1-((0.3/1000*i)/R).^2);%�����Ѫ���ٶ� �����ߺ���
            end
                vr2=fliplr(vr);%��ת���� ��ת����[1 2 3]��ת֮�����[3 2 1]
                vr1=[vr2,vr];%������������ƴ����
                s=[];
            for i=1:30
                t=1/50;
                s(i)=vr1(i)*t;%���Ѫ����λ����
            end
%֮�������forѭ����ôдҲ��˵��ͨ ������Ϊÿһ��forѭ�����ǽ�phantom_positions
%����һ����Ѫ�ܷ�Χ��λ������
%��λ�����ݱ仯 ���൱��λ�����ݶ�Ӧ��������ݾ��ƶ���
for j=1:25
    for i=1:30%��Ѫ�ܵ�λ�����ֱ�ӵ�ÿһ�ݵ�Ѫ����-Ѫ����Z��仯��
        h=find(phantom_positions(:,3)>=(54.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(54.5+(1/30)*i)/1000);
        %find���������ҵ������з���Ԫ�����ڵ�λ��
        %a(:,3)��ʾȡ������
        %������������Ϊʲô��54.5��ʼ ����ΪѪ���ھ���9 ����
        %Ѫ���ھ�Ӧ�ô�54.5��ʼ
        %�����൱�ھ��ǽ�����λ���������λ��֮����ó���
        %������z = rand (N,1)*z_size��60�� + z_start��30��
        %54.5��55.5֮��
        h1=find(phantom_positions(:,3)>=(64.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(64.5+(1/30)*i)/1000);
        %64.5��65.5֮��
        %
        phantom_positions(h,3)=phantom_positions(h,3)+d1(i); 
        phantom_positions(h1,3)=phantom_positions(h1,3)+d1(i); 
    end
    for i=1:30%Ѫ����λ����-Ѫ����Ѫ���ڲ�ɢ���������X��仯
        h=find(phantom_positions(:,3)>=(55.5+0.3*(i-1))/1000 & phantom_positions(:,3)<=(55.5+0.3*i)/1000);
        phantom_positions(h,1)=phantom_positions(h,1)+s(i); 
        %�˴�phantom_position(h,1)��x�� ��������ǰ��
    %55.5��64.5֮��
    %������ڳ�����չͼƬ
    end
    eval(['save pht_data/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])%��������
end
for j=26:50
        for i=1:30
            h=find(phantom_positions(:,3)>=(54.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(54.5+(1/30)*i)/1000);
            h1=find(phantom_positions(:,3)>=(64.5+(1/30)*(i-1))/1000 & phantom_positions(:,3)<=(64.5+(1/30)*i)/1000);
            phantom_positions(h,3)=phantom_positions(h,3)+d1(i); 
            phantom_positions(h1,3)=phantom_positions(h1,3)+d1(i); 
        end
        for i=1:30
            h=find(phantom_positions(:,3)>=(55.5+0.3*(i-1))/1000 & phantom_positions(:,3)<=(55.5+0.3*i)/1000);
            phantom_positions(h,1)=phantom_positions(h,1)+(40/1000)-s(i); 
        end
    eval(['save pht_data/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])
end


