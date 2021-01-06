function [f, P] = windowHRV(time, ECG, SamplingRate, Winsize)
%Sampling Rate(Hz)
%Window size(Min)
SamplingTime = Winsize * 60;
Win = fix(SamplingRate * SamplingTime);
num = fix(length(ECG) / Win) - 10;

% [~,ll,~]=rrInterval(time, ECG);
% [~,bb]=makeHRV(ll);
% freqHRVplot1(bb, length(bb), length(bb) / 100);

for N = (1:num)
    Time_Arr(:, N) = time(Win * (N - 1) + 1:Win * N);
    ECG_Arr(:, N) = ECG(Win * (N - 1) + 1:Win * N);
end

f = NaN(1000, num);
P = NaN(1000, num);

for N = (1:num)
    [~, lo, ~] = rrInterval(Time_Arr(:, N), ECG_Arr(:, N));
    [~, HRV] = makeHRV(lo);
    [fr, P1] = freqHRV1(HRV, length(HRV), SamplingTime);
    f(1:length(fr), N) = fr;
    P(1:length(P1), N) = P1;
end
end