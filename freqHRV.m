function [f, P1] = freqHRV(hrv)
y=fft(hrv);
SamplingRate = length(hrv) / 300;
P2 = abs(y/length(hrv));
P1 = P2(1:fix(length(hrv)/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = SamplingRate * (0:(fix(length(hrv)/2)))/length(hrv);
end

