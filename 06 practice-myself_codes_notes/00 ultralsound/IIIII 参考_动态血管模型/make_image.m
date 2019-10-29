%  Compress the data to show 60 dB of
%  dynamic range for the cyst phantom image
%
%  version 1.3 by Joergen Arendt Jensen, April 1, 1998.
%  version 1.4 by Joergen Arendt Jensen, August 13, 2007.
%          Clibrated 60 dB display made

%  Compress the data to show 60 dB of
%  dynamic range for the cyst phantom image
%
%  version 1.3 by Joergen Arendt Jensen, April 1, 1998.
%  version 1.4 by Joergen Arendt Jensen, August 13, 2007.
%          Clibrated 60 dB display made

f0=3.5e6;                 %  Transducer center frequency [Hz]
fs=100e6;                 %  Sampling frequency [Hz]
c=1540;                   %  Speed of sound [m/s]
no_lines=50;              %  Number of lines in image
image_width=40/1000;      %  Size of image sector
d_x=image_width/no_lines; %  Increment for image

%  Read the data and adjust it in time 
for j=1:4%做50张图
min_sample=0;
for i=1:no_lines

  %  Load the result

  cmd=['load rf_data/rf_ln',num2str(i+no_lines*(j-1)),'.mat'];%保存50个.mat的文件
  disp(cmd)
  eval(cmd)
  
  %  Find the envelope
  
  rf_env=abs(hilbert([zeros(round(tstart*fs-min_sample),1); rf_data]));
  env(1:max(size(rf_env)),i)=rf_env;
  end

%  Do logarithmic compression

D=10;   %  Sampling frequency decimation factor

disp('Finding the envelope')
log_env=env(1:D:max(size(env)),:)/max(max(env));
log_env=20*log10(log_env);
log_env=127/60*(log_env+60);

%  Make an interpolated image

disp('Doing interpolation')
ID=20;
[n,m]=size(log_env);
new_env=zeros(n,m*ID);
for i=1:n
  new_env(i,:)=abs(interp(log_env(i,:),ID));
  end
[n,m]=size(new_env);
  
fn=fs/D;%把50个图像拼起来
clf
image(((1:(ID*no_lines-1))*d_x/ID-no_lines*d_x/2)*1000,((1:n)/fn+min_sample/fs)*1540/2*1000,new_env)
xlabel('Lateral distance [mm]')
ylabel('Axial distance [mm]')
colormap(gray(127))
axis('image')
axis([-20 20 35 90])
set (gcf,'position',[100,30,600,450])%画图时，用来设置图像的大小，
%分别代表x轴长度，y轴长度，图像长度，图像高度
str=['image/f' num2str(j) '.jpg'];
saveas(gcf,str);%创建条形图并将其另存为 JPG 文件
end