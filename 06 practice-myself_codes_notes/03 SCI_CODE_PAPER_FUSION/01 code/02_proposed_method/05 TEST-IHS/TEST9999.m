close all
clc;clear;
Fusion_image=double(imread('jiaquan28.jpg'));
[H,S,V]=RGB2HBV(Fusion_image);
 [max_cntMat_mean_S_value,b1]=max(max(V));
  [min_cntMat_mean_S_value,b6]=min(min(V));