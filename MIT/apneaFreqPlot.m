function [tab] = apneaFreqPlot(paramName, Winsize)
cd mit-bih-polysomnographic-database-1.0.0
wfdb2mat(paramName);
[tm, data] = rdmat(append(paramName, 'm'));
[tmApn, apn] = rdann(paramName, 'apn');
cd ..

tab = makeLabelofHRV(tm, data, 100, Winsize, tmApn, apn);

tim = (1:height(tab))*Winsize;


fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(3,1,1)
plot(tim, tab.HF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tim(tab.apn == 0), tab.HF(tab.apn == 0), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 2, 'LineStyle', 'none')
plot(tim(tab.apn > 0), tab.HF(tab.apn > 0), 'Color', 'red', 'Marker', '*', 'LineWidth', 2, 'LineStyle', 'none')
legend('HF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,2)
plot(tim, tab.LF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tim(tab.apn == 0), tab.LF(tab.apn == 0), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 2, 'LineStyle', 'none')
plot(tim(tab.apn > 0), tab.LF(tab.apn > 0), 'Color', 'red', 'Marker', '*', 'LineWidth', 2, 'LineStyle', 'none')
legend('LF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,3)
plot(tim, tab.VLF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tim(tab.apn == 0), tab.VLF(tab.apn == 0), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 2, 'LineStyle', 'none')
plot(tim(tab.apn > 0), tab.VLF(tab.apn > 0), 'Color', 'red', 'Marker', '*', 'LineWidth', 2, 'LineStyle', 'none')
legend('VLF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

cd plot/
saveas(gca, append(paramName, '.bmp'))
cd ..
end

