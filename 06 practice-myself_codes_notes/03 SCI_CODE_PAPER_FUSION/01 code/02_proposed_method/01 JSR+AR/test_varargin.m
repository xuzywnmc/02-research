function test_varargin(a,b,c,varargin)
reduceDC = 1;

waitBarOn = 1;
%�Ƿ���ʾ������

C = 1.15;
%���Դ��������ֵ
maxBlocksToConsider = 260000;
%�����ƶ����
slidingDis = 1;
bb = 8;
%ʵ�ʴ��������ֵ
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