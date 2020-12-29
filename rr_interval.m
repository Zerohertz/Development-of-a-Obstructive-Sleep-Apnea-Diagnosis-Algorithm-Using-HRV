function [qrspeaks,locs] = rr_interval(time,ecg)
t = time;
wt = modwt(ecg, 5);
wtrec = zeros(size(wt));
wtrec(4:5, :) = wt(4:5, :);
y = imodwt(wtrec , 'sym4');
y = abs(y).^2
[qrspeaks, locs] = findpeaks(y, t, 'MinPeakHeight', 0.35, 'MinPeakDistance', 0.150);
end

