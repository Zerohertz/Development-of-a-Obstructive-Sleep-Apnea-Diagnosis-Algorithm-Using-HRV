function [f, P1] = freqHRV(hrv, Length, SamplingTime)
y=fft(hrv);
SamplingRate = Length / SamplingTime;
P2 = abs(y/Length);
P1 = P2(1:fix(Length/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = SamplingRate * (0:(Length/2))/Length;
end

