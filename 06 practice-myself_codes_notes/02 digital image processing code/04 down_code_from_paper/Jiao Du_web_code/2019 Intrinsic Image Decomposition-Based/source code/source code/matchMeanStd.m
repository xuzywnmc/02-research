function out = matchMeanStd( A,B )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Amean = mean(mean(mean(A)));
Astd = std2(A);
Bmean = mean(mean(mean(B)));
Bstd = std2(B);

k1 = Bstd / Astd;
k2 = Bmean - (k1 * Amean);
out = A * k1 + k2;
end

