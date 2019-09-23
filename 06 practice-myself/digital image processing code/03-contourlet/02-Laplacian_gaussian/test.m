clear all; close all; clc;
img=double(imread('lena512.bmp'));
%%
%²âÊÔ1 ledec pfilter = 'pkva' ; Êä³öµ½µ×Ê²Ã´
%%
    [h, g] = pfilters('pkva');
        % Laplacian decomposition
        [xlo, xhi] = lpdec(img, h, g);
% lpdec Output: 
%   c:      coarse image at half size
%   d:      detail image at full size