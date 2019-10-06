% Laplacian Filtering 
%   - public Matlab implementation for reproducibility
%   - about 30x slower than our single-thread C++ version
%
% This script implements the core image processing algorithm 
% described in Paris, Hasinoff, and Kautz, "Local Laplacian Filters:
% Edge-aware Image Processing with a Laplacian Pyramid", ACM 
% Transactions on Graphics (Proc. SIGGRAPH 2011), 30(4), 2011.
%
% Processes an input image using a general pointwise remapping function 
% r(I,g0) in a pyramid-based way. Its running time is O(N log N), where 
% N is the number of pixels.
%
% Most of the code is bookkeeping to isolate the subpyramid contributing 
% to a particular Laplacian coefficient. See below for a 14-line naive 
% O(N^2) implementation that gives identical results.
%
% Arguments:
%   image 'I'
%   pixel-wise remapping function 'r', expects arguments r(I,g0)
%
% sam.hasinoff@gmail.com, March 2011
%

function R = lapfilter_core(I1, I2, r,level)

G = gaussian_pyramid(I1,level);  % compute input Gaussian pyramid
L = laplacian_pyramid(zeros(size(I1)),level);
% build up the result, one Laplacian coefficient at a time

L1 = laplacian_pyramid(zeros(size(I1)),level);  % allocate space for result
tic;
for lev0 = 1:level-1
    hw = 3*2^lev0 - 2;  % half-width of full-res footprint (conservative)
    fprintf('level %d (%dx%d), footprint %dx%d ...   0%',lev0,size(G{lev0},1),size(G{lev0},2),min(2*hw+1,size(I1,1)),min(2*hw+1,size(I1,2)));
    for y0 = 1:size(G{lev0},1)
        for x0 = 1:size(G{lev0},2)
            % coords in full-res image corresponding to (lev0,y0,x0)
            yf = (y0-1)*2^(lev0-1) + 1;
            xf = (x0-1)*2^(lev0-1) + 1;
            % subwindow in full-res image needed to evaluate (lev0,y0,x0) in result
            yrng = [max(1,yf-hw) min(size(I1,1),yf+hw)];
            xrng = [max(1,xf-hw) min(size(I1,2),xf+hw)];
            Isub = I1(yrng(1):yrng(2),xrng(1):xrng(2),:);
            
            % use the corresponding Gaussian pyramid coefficient to remap
            % the full-res subwindow
            g0 = G{lev0}(y0,x0,:);
            Iremap = r(Isub,g0);
            % compute Laplacian pyramid for remapped subwindow
            Lremap = laplacian_pyramid(Iremap,lev0+1,[yrng xrng]);
            
            % bookkeeping to compute index of (lev0,y0,x0) within the
            % subwindow, at full-res and at current pyramid level
            yfc = yf - yrng(1) + 1;
            xfc = xf - xrng(1) + 1;
            yfclev0 = floor((yfc-1)/2^(lev0-1)) + 1;
            xfclev0 = floor((xfc-1)/2^(lev0-1)) + 1;
            
            % set coefficient in result based on the corresponding
            % coefficient in the remapped pyramid
            L1{lev0}(y0,x0,:) = Lremap{lev0}(yfclev0,xfclev0,:);            
        end
        fprintf('\b\b\b\b%3d%%',floor(y0/size(G{lev0},1)*100));
    end
    fprintf('\n');
end

L1{level} = G{level};  % residual not affected

% % % 

G = gaussian_pyramid(I2,level);  % compute input Gaussian pyramid

% build up the result, one Laplacian coefficient at a time

L2 = laplacian_pyramid(zeros(size(I2)),level);  % allocate space for result

for lev0 = 1:level-1
    hw = 3*2^lev0 - 2;  % half-width of full-res footprint (conservative)
    fprintf('level %d (%dx%d), footprint %dx%d ...   0%',lev0,size(G{lev0},1),size(G{lev0},2),min(2*hw+1,size(I2,1)),min(2*hw+1,size(I2,2)));
    for y0 = 1:size(G{lev0},1)
        for x0 = 1:size(G{lev0},2)
            % coords in full-res image corresponding to (lev0,y0,x0)
            yf = (y0-1)*2^(lev0-1) + 1;
            xf = (x0-1)*2^(lev0-1) + 1;
            % subwindow in full-res image needed to evaluate (lev0,y0,x0) in result
            yrng = [max(1,yf-hw) min(size(I2,1),yf+hw)];
            xrng = [max(1,xf-hw) min(size(I2,2),xf+hw)];
            Isub = I2(yrng(1):yrng(2),xrng(1):xrng(2),:);
            
            % use the corresponding Gaussian pyramid coefficient to remap
            % the full-res subwindow
            g0 = G{lev0}(y0,x0,:);
            Iremap = r(Isub,g0);
            % compute Laplacian pyramid for remapped subwindow
            Lremap = laplacian_pyramid(Iremap,lev0+1,[yrng xrng]);
            
            % bookkeeping to compute index of (lev0,y0,x0) within the
            % subwindow, at full-res and at current pyramid level
            yfc = yf - yrng(1) + 1;
            xfc = xf - xrng(1) + 1;
            yfclev0 = floor((yfc-1)/2^(lev0-1)) + 1;
            xfclev0 = floor((xfc-1)/2^(lev0-1)) + 1;
            
            % set coefficient in result based on the corresponding
            % coefficient in the remapped pyramid
            L2{lev0}(y0,x0,:) = Lremap{lev0}(yfclev0,xfclev0,:);            
        end
        fprintf('\b\b\b\b%3d%%',floor(y0/size(G{lev0},1)*100));
    end
    fprintf('\n');
end

L2{level} = G{level};  % residual not affected
% % % 
for i =1:level-1
%    ******** the proposed image fusion rule for residual images(highpass) by
%    Weisheng Li, Jiao Du, and Bin Xiao;*******
    L{i} = fusionrule_highpass(L1{i} , L2{i});
end
%*******     the proposed image fusion rule for approximate images(lowpass) by
%Weisheng Li, Jiao Du, and Bin Xiao;********
L{level} = fusionrule_lowpass(L1{level} , L2{level});

% figure,imshow(uint8(L{end}));
R = reconstruct_laplacian_pyramid(L);  % collapse result Laplacian pyramid


end

%% naive O(N^2) version for reference
%
% G = gaussian_pyramid(I);
% L = laplacian_pyramid(zeros(size(I))); 
% for lev0 = 1:length(L)-1
%     for y0 = 1:size(G{lev0},1)
%         for x0 = 1:size(G{lev0},2)
%             g0 = G{lev0}(y0,x0,:);
%             Iremap = r(I,g0);
%             Lremap = laplacian_pyramid(Iremap,lev0+1);
%             L{lev0}(y0,x0,:) = Lremap{lev0}(y0,x0,:);            
%         end
%     end
% end
% L{end} = G{end};
% R = reconstruct_laplacian_pyramid(L);
