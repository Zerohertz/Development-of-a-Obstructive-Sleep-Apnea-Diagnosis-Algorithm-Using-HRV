function [qrspeaks, locs, y] = rrIntervalparam(time, ecg, param)
t = time;
wt = modwt(ecg, 5);
wtrec = zeros(size(wt));
wtrec(4:5, :) = wt(4:5, :);
y = imodwt(wtrec, 'sym4');
y = abs(y).^2;
[qrspeaks, locs] = findpeaks(y, t, 'MinPeakHeight', param, 'MinPeakDistance', 0.450); %time과 y에 대한 그래프를 해석 후 파라미터 결정
end

