function test_varargin(a,b,c,varargin)
reduceDC = 1;

waitBarOn = 1;
%是否显示进度条

C = 1.15;
%可以处理方块最大值
maxBlocksToConsider = 260000;
%方块移动间隔
slidingDis = 1;
bb = 8;
%实际处理方块最大值
maxNumBlocksToTrainOn = 65000;
displayFlag = 1;

disp(['nargin is ' num2str(nargin)]);
for argI = 1:2:length(varargin)
        if (strcmp(varargin{argI}, 'slidingFactor'))
        slidingDis = varargin{argI+1};
        disp(['varargin{' num2str(argI) '} class is ' slidingDis]);
    end
        disp(['varargin{' num2str(argI) '} class is ' argI]);
end