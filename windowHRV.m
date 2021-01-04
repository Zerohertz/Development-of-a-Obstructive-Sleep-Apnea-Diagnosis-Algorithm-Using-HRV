function [f, P] = windowHRV(time, ECG, SamplingRate, Winsize)
%Sampling Rate(Hz)
%Window size(Min)
%Time_Arr = [];
%ECG_Arr = [];
Win = fix(SamplingRate * Winsize * 60);
SamplingTime = Winsize * 60;
num = fix(length(ECG) / Win);

for N = (1:num)
    Time_Arr(:, N) = time(Win * (N - 1) + 1:Win * N);
    ECG_Arr(:, N) = ECG(Win * (N - 1) + 1:Win * N);
end

for N = (1:num)
    [qrs(:, N), locs(:, N), y(:, N)] = rr_interval(Time_Arr(:, N), ECG_Arr(:, N));
    [ti(:, N), HRV(:, N)] = MakeHRV(locs(:, N));
    [f(:, N), P(:, N)] = freqHRV(HRV(:, N), length(HRV), SamplingTime);
end
end