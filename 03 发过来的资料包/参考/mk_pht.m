%  Make the scatteres for a simulation and store
%  it in a file for later simulation use

%   Joergen Arendt Jensen, Feb. 26, 1997
mkdir('rf_data');
N=1000;
M=2;
m=0.0555;
n=0.0645;
S=0;
[phantom_positions, phantom_amplitudes] = cyst_pht(N);
for i=1:25
     t(i)=sin(1/25*pi*i)/1000;
     S=S+abs(t(i));
end
 s=S/(1/1000);
for i=1:M
    cmd=['save pht_data/pht_data',num2str(i),'.mat phantom_positions phantom_amplitudes'];
    disp(cmd)
    eval(cmd);
    t=sin(1/25*pi*i)/1000/s;
%     t=phantom_positions(N,1);
%     phantom_positions(:,1)=phantom_positions(:,1)+80/1000/50*(1-(abs(phantom_positions(:,2))/(9/2/1000)).^2);
for j=1:N
    f=phantom_positions(j,3);
    v=phantom_positions(j,3);
    o(j)=80/1000/50*(1-(abs(v-60/1000)/(9/2/1000)).^2);
    if ((phantom_positions(j,3)>m)&&(phantom_positions(j,3)<n))
        phantom_positions(j,1)=phantom_positions(j,1)+80/1000/50*(1-(abs(phantom_positions(j,3)-60/1000)/(9/2/1000)).^2);
        Y(j)=80/1000/50*(1-(abs(phantom_positions(j,3)-60/1000)/(9/2/1000)).^2);
    end
end

for j=1:N
    if(phantom_positions(j,3)<m)
        phantom_positions(j,3)=phantom_positions(j,3)-t;
%         if(phantom_positions(j,3)<0.03)
%             phantom_positions(j,3)=0.03;
%         end
    end
    if (phantom_positions(j,3)>n)
        phantom_positions(j,3)=phantom_positions(j,3)+t;
%         if(phantom_positions(j,3)>0.09)
%             phantom_positions(j,3)=0.09;
%         end
    end
end

m=m-t;
n=n+t;
% %     phantom_positions(1,1)=t;
  for j=1:N
%       m=phantom_positions(j,1);
      if  (phantom_positions(j,1)>0.025)
           phantom_positions(j,1)=phantom_positions(j,1)-0.05;
      end
  end
  
    mkdir(['rf_data\rf_data',num2str(i),'']);
end