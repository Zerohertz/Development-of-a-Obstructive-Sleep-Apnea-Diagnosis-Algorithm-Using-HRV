function [qrspeaks, locs, y] = rrInterval(time, ecg)
t = time;
wt = modwt(ecg, 5);
wtrec = zeros(size(wt));
wtrec(4:5, :) = wt(4:5, :);
y = imodwt(wtrec, 'sym4');
y = abs(y).^2;
[qrspeaks, locs] = findpeaks(y, t, 'MinPeakHeight', 0.1, 'MinPeakDistance', 0.450); %time과 y에 대한 그래프를 해석 후 파라미터 결정
end

