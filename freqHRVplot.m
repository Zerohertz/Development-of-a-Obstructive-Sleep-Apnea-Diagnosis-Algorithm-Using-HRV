function [f, P1] = freqHRVplot(hrv, Length, SamplingTime)
y=fft(hrv);
SamplingRate = Length / SamplingTime;
P2 = abs(y/Length);
P1 = P2(1:Length/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = SamplingRate * (0:(Length/2))/Length;
plot(f, P1)
end
