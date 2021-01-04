function [f, P1] = freqHRVplot1(hrv, Length, SamplingTime)
SamplingRate = Length / SamplingTime;
NFFT = 2^(ceil(log2(length(hrv))));
Y = fft(hrv, NFFT) / Length;
f = SamplingRate / 2 * linspace(0, 1, NFFT / 2 + 1);
P1 = 2*abs(Y(1:NFFT/2+1));
plot(f, P1)
end

