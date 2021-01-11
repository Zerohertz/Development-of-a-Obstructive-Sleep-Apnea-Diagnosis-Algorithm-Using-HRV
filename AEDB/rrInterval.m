function [qrspeaks, locs, y] = rrInterval(time, ecg)
t = time;
wt = modwt(ecg, 5);
wtrec = zeros(size(wt));
wtrec(4:5, :) = wt(4:5, :);
y = imodwt(wtrec, 'sym4');
y = abs(y).^2;
[qrspeaks, locs] = findpeaks(y, t, 'MinPeakHeight', 0.03, 'MinPeakDistance', 0.450); %timeκ³? y? ??? κ·Έλ?λ₯? ?΄? ? ??Όλ―Έν° κ²°μ 
end

