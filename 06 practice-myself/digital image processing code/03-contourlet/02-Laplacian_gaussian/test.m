clear all; close all; clc;
img=double(imread('lena512.bmp'));
%%
%����1 ledec pfilter = 'pkva' ; �������ʲô
%%
    [h, g] = pfilters('pkva');
        % Laplacian decomposition
        [xlo, xhi] = lpdec(img, h, g);
% lpdec Output: 
%   c:      coarse image at half size
%   d:      detail image at full size