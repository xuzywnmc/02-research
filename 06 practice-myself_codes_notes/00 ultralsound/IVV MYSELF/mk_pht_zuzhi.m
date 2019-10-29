%  Make the scatteres for a simulation and store
%  it in a file for later simulation use

%   Joergen Arendt Jensen, Feb. 26, 1997

[phantom_positions_zuzhi, phantom_amplitudes_zuzhi] = cyst_pht_zuzhi(100000);
  %定义血流位移量
eval(['save pht_data_zuzhi/pht_data_zuzhi phantom_positions_zuzhi phantom_amplitudes_zuzhi'])
 h=find(phantom_positions_zuzhi(:,1)>=(65.5/1000));
%血流参数 300000个点
% x_size = 150/1000;   %  Width of phantom [mm]
% y_size = 0.2/1000;   %  Transverse width of phantom [mm]
% z_size = 90/1000;   %  Height of phantom [mm]
% z_start = 30/1000;  %  Start of phantom surface [mm];
% x = (rand (N,1)-0.5)*x_size;
% y = (rand (N,1)-0.5)*y_size;
% z = rand (N,1)*z_size + z_start;
% 
% %  Generate the amplitudes with a Gaussian distribution
% 
% amp=randn(N,1);
% r1=9/2/1000;
% y1=0;
% z1=60/1000;
% r=((y-y1).^2+(z-z1).^2).^0.5;
% inside=r<r1;
% %inside = ( ((x-xc).^2 + (z-zc).^2) < r^2);
% %囊肿程序中是x z轴维度的
% amp=amp.*(1-inside)+1*amp.*inside;
%  end

%血流参数 照旧