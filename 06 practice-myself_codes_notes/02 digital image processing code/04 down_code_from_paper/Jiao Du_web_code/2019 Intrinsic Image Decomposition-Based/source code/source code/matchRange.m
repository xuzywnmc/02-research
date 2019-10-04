function outImg = matchRange( inputImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxValue = max(max(max(inputImg)));
minValue = min(min(min(inputImg)));
a = 255 / (maxValue - minValue);
b = (255 * minValue) / (minValue - maxValue);
outImg = a .* inputImg + b ;

end

