function [x] = waterfallFreqHRV(paramName, Winsize)
cd mit-bih-polysomnographic-database-1.0.0
wfdb2mat(paramName);
[tm, data] = rdmat(append(paramName, 'm'));
[tmApn, apn] = rdann(paramName, 'apn');
cd ..

init = tmApn(1);
tm = tm(init:length(tm));
data = data(init:length(data));

x = [tm; data'];

[f, p] = windowHRV(tm, data, 100, Winsize);

tim = (1:length(f(1, :)))*Winsize;

fig = figure;
set(fig, 'Position', [0 0 1920 1080])
waterfall(p)
% waterfall(tim, f, p)
% legend('VLF', 'Normal', 'Apnea')
% xlabel('Time(min)')
% ylabel('Amplitude(msec)')
set(gca, 'fontsize', 15)

cd waterfall/
saveas(gca, append(paramName, '.bmp'))
cd ..
end

