 %  Create a computer model of a cyst phantom. The phantom contains
%  fiven point targets and 6, 5, 4, 3, 2 mm diameter waterfilled cysts, 
%  and 6, 5, 4, 3, 2 mm diameter high scattering regions. All scatterers 
%  are situated in a box of (x,y,z)=(50,10,60) mm and the box starts 
%  30 mm from the transducer surface.
%
%  Calling: [positions, amp] = cyst_phantom (N);
%
%  Parameters:  N - Number of scatterers in the phantom
%
%  Output:      positions  - Positions of the scatterers.
%               amp        - amplitude of the scatterers.
%
%  Version 2.2, April 2, 1998 by Joergen Arendt Jensen

function [positions, amp] = cyst_phantom (N)

x_size = 50/1000;   %  Width of phantom [mm]
y_size = 0.2/1000;   %  Transverse width of phantom [mm]
z_size = 90/1000;   %  Height of phantom [mm]
z_start = 30/1000;  %  Start of phantom surface [mm];
%设置矩形框[50,10,60]
%对于图像来说 垂直方向为Zc
%故所面向平面就是Z-X平面
%  Create the general scatterers

x = (rand (N,1)-0.5)*x_size;
y = (rand (N,1)-0.5)*y_size;
z = rand (N,1)*z_size + z_start;

%  Generate the amplitudes with a Gaussian distribution

amp=randn(N,1);
r1=9/2/1000;
y1=0;
z1=60/1000;
r=((y-y1).^2+(z-z1).^2).^0.5;
inside=r<r1;
%inside = ( ((x-xc).^2 + (z-zc).^2) < r^2);
%囊肿程序中是x z轴维度的
amp=amp.*(1-inside)+1*amp.*inside;
%amp = amp .* (1-inside);
%囊肿程序暗囊肿是这样的
r2=11/2/1000;
inside=(r>r1&r<r2);
amp=amp.*(1-inside)+20*amp.*inside;
%amp = amp .* (1-inside) + 10*amp .* inside;
%囊肿程序中这个是亮囊肿
inside=(r>r2);
amp=amp.*(1-inside)+5*amp.*inside;


    
    



%  Place the point scatterers in the phantom


  
%  Return the variables

positions=[x y z];