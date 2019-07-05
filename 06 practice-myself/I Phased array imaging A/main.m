% Example of use of the new Field II program running under Matlab
%
% This example shows how a phased array B-mode system scans an image
%
% This script assumes that the field_init procedure has been called
%
% Example by Joergen Arendt Jensen, Nov. 28, 1995.
% Generate the transducer apertures for send and receive
f0=3e6; % Transducer center frequency [Hz]
fs=100e6; % Sampling frequency [Hz]
c=1540; % Speed of sound [m/s]
lambda=c/f0; % Wavelength
element_height=5/1000; % Height of element [m]
kerf=0.1/1000; % Kerf [m]
focus=[0 0 70]/1000; % Fixed focal point [m]
% Generate aperture for emission
emit_aperture = xdc_linear_array (128, lambda/2, element_height, kerf, 1, 1,focus);
% Set the impulse response and excitation of the emit aperture
impulse_response=sin(2*pi*f0*(0:1/fs:2/f0));
impulse_response=impulse_response.*hanning(max(size(impulse_response)))';
xdc_impulse (emit_aperture, impulse_response);
excitation=sin(2*pi*f0*(0:1/fs:2/f0));
xdc_excitation (emit_aperture, excitation);
% Generate aperture for reception
receive_aperture = xdc_linear_array (128, lambda/2, element_height, kerf, 1, 1,focus);
% Set the impulse response for the receive aperture
xdc_impulse (receive_aperture, impulse_response);
% Do phased array imaging
point_position=[0 0 70]/1000; % Position of the point to be imaged
no_lines=50; % Number of A-lines in image
sector=20 * pi/180; % Size of image sector
d_theta=sector/no_lines; % Increment in angle for 90 deg. image
% Pre-allocate some storage
image_data=zeros(800,no_lines);
theta= -sector/2;
for i=1:no_lines
    % Set the focus for this direction
    xdc_focus (emit_aperture, 0, [70*sin(theta) 0 70*cos(theta)]/1000);
    xdc_focus (receive_aperture, 0, [70*sin(theta) 0 70*cos(theta)]/1000);
    % Calculate the received response
    [v, t1]=calc_scat(emit_aperture, receive_aperture, point_position, 1);
    % Store the result
    image_data(1:max(size(v)),i)=v';
    times(i) = t1;
    % Steer in another angle
    theta = theta + d_theta;
end
% Here the display of the data is inserted
plot(image_data)