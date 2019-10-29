
% [phantom_positions, phantom_amplitudes] = cyst_pht(100000);
cmd=['load pht_data_1/pht_data',num2str(1),'.mat'];
          disp(cmd)
          eval(cmd)
%%%%%%%%%%%%%%%%%���ڶ�̬Ѫ��ģ�͵�˵��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TIPS@1:Ѫ���ٶȲ�ҪŪ��ô�󣬷������Ч�������ԣ�������Ҫ�ɼ�ͼƬ��Ŀ�������ã�

% TIPS@2:����Ѫ������ģ��ʱ��һ��Ҫ�ѵ�һ�����ɵ����ײ����洢�������粻��ȡ�洢
% ��ʽ�����������ӿ��ʽ��Ѫ���������ڹ۲�,���������ÿ�������µģ�
% ������������ģ�����ȡ
phantom_positions_copy=phantom_positions;
phantom_amplitudes_copy=phantom_amplitudes;

%%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %����Ѫ��λ����
  vp=50/1000;%��Ҫ��Ѫ���ٶ�Ū��ô�󣬸պ�20֡���������20��ͼ
  %50/1000=vp*a*dt=vp*20*1/20 ��vp=50/1000
  R=4.5/1000;%cyst_pht.m--r1=9/2/1000;
  dz=R/25%Ѫ���ڵ�Ѫ���ֳ�50�ݣ�ÿ�ݵĿ��
  L_X=50/1000;%Ѫ���ܳ�
  dx=L_X/300;%����Ϊ50����֯�ֳ�300��
  vp_1=1/1000;%��֯��Ѫ�ܵ����λ��
  vr_vessel=zeros(1000,20);%500�� 20��ͼ������20��״̬
  for i=1:20
      k5=abs(i-21);
      w(i)=k5;
  end
  %%%%%����Ѫ����Ѫ����λ��%%%%%%%%%%%%%%%%%%%%%%%%%
            for i=1:25
                vr(i)=vp*(1-((dz*i)/R)^2);%�����Ѫ���ٶ� �����ߺ���
            end
                vr2=fliplr(vr);%��ת���� ��ת����[1 2 3]��ת֮�����[3 2 1]
                vr1=[vr2,vr];%������������ƴ����
                s=[];
            for i=1:50
                dt=1/20;%20��ͼ ����ÿ��ͼ1/20��
                s(i)=vr1(i)*dt;%���Ѫ����λ����
            end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%������֯��Ѫ�ܵ�λ��%%%%%%%%%%%%%%%%%%%%%%%%%
    for j=1:20%��ʮ��ͼ
            for i=1:1000
                %��һ����ά����洢��֯300��20��״̬�µ�λ�� ÿ�߳�ʼ��λ��Ϊ1/300
                %������ʮ��ͼ ÿ����ص���ʼ״̬
               % vr_vessel(i,j)=vp_1*abs(sin(pi*((i/1000)*10+j/20)));%�����Ѫ���ٶ� �����ߺ���
%                 vr_vessel(i,j)=vp_1*abs(sin(pi*((i/2000)+j/40)));%�����Ѫ���ٶ� �����ߺ���
%             vr_vessel(i,j)=vp_1*abs(sin(pi*((i/1000)+j/20)));%�����Ѫ���ٶ� �����ߺ���
              vr_vessel(i,j)=vp_1*abs(sin(pi*((i/750)+w(j)/20)));%�����Ѫ���ٶ� �����ߺ���
            end
    end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
 point_up=find(phantom_positions(:,3) <(55.5/1000));
 point_down=find(phantom_positions(:,3)>=64.5/1000);
 for j=2:20%��ʮ��ͼ
              phantom_positions=phantom_positions_copy;
              phantom_amplitudes=phantom_amplitudes_copy;
                          for k=1:1000
                              %�ҵ�����ÿһ���ڵ�ֵ����λ��
                            k1=find(phantom_positions(point_up,1)>=(-25/1000+dx*(k-1)) & phantom_positions(point_up,1)<(-25/1000+dx*k));
                            %�ٰ���һ���������еĶ������Լ����ƶ����� ��֯�ϱ��Ǽ�ȥ����z
                            %****************��©�ĵ� �˴�ҲҪ��������****************
                            k2=point_up(k1);
                            %���ڴ˴��Ǳ���ԭʼͼ�� ������Ҫ��j-1
                            phantom_positions(k2,3)=phantom_positions(k2,3)-vr_vessel(k,j-1); 
                            
                            k3=find(phantom_positions(point_down,1)>=(-25/1000+dx*(k-1)) & phantom_positions(point_down,1)<(-25/1000+dx*k));
                            %�ٰ���һ���������еĶ������Լ����ƶ����� ��֯�ϱ��Ǽ�ȥ����z
                            %****************��©�ĵ� �˴�ҲҪ��������****************
                            k4=point_down(k3);
                            %���ڴ˴��Ǳ���ԭʼͼ�� ������Ҫ��j-1
                            phantom_positions(k4,3)=phantom_positions(k4,3)+vr_vessel(k,j-1); 
                          end
                    for i=1:50%Ѫ����λ����-Ѫ����Ѫ���ڲ�ɢ���������X��仯
                        h=find(phantom_positions(:,3)>=(55.5/1000+dz*(i-1)) & phantom_positions(:,3)<(55.5/1000+dz*i));
                        phantom_positions(h,1)=phantom_positions(h,1)+j*s(i); 
                        %�˴��ҳ�h�� Ҳ����Ѫ���ڵı���������Ѫ�ܵ�ֵ
                        h1=find(phantom_positions(h,1)>25/1000 );
                        h3=h(h1);
                        %�˴��൱�ھ��ҳ���ԭ���������ֵ����Ӧ�����
                        phantom_positions(h3,1)=-25/1000;
                    end
               eval(['save pht_data_1/pht_data' num2str(j) ' phantom_positions phantom_amplitudes'])
end
%  end