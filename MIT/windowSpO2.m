function [SpO2] = windowSpO2(data, SamplingRate, Winsize)
SamplingTime = Winsize * 60;
Win = fix(SamplingRate * SamplingTime);
num = fix(length(data) / Win) - 10;

for N = (1:num)
    SpO2_Arr(:, N) = data(Win * (N - 1) + 1:Win * N);
end

for N = (1:num)
    SpO2(N) = mean(SpO2_Arr(:, N));
end
end

