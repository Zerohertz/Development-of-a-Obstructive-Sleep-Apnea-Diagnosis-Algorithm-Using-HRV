function [tab] = apneaFreqPlot(paramName)
cd apnea-ecg-database-1.0.0/
wfdb2mat(paramName);
[tm, data] = rdmat(append(paramName, 'm'));
[~, apn] = rdann(paramName, 'apn');
cd ..

tab = makeLabelofHRV(tm, data, 100, 5, apn);

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(3,1,1)
plot(tab.VLF, 'Color', '#0072BD', 'LineWidth', 1)
hold on
plot(tab.LF, 'Color', '#A2142F', 'LineWidth', 1)
plot(tab.HF, 'Color', '#EDB120', 'LineWidth', 1)
plot(tab.VLF, 'Color', '#0072BD', 'Marker', '+', 'LineWidth', 1)
plot(tab.LF, 'Color', '#A2142F', 'Marker', '*', 'LineWidth', 1)
plot(tab.HF, 'Color', '#EDB120', 'Marker', 'o', 'LineWidth', 1)
legend('VLF', 'LF', 'HF')
xlabel('Time(5min)')
ylabel('Amplitude')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,2)
plot(tab.SpO2,'Color', '#77AC30', 'LineWidth', 1)
plot(tab.SpO2,'Color', '#77AC30', 'Marker', 'o', 'LineWidth', 1)
xlabel('Time(5min)')
ylabel('SpO2')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,3)
plot(tab.apn, 'Color', 'magenta', 'LineWidth', 1)
plot(tab.apn, 'Color', 'magenta', 'Marker', 'o', 'LineWidth', 1)
xlabel('Time(5min)')
ylabel('0(Normal) / 1(Apnea)')
grid on
set(gca, 'fontsize', 15)

cd plot/
saveas(gca, append(paramName, '.bmp'))
cd ..
end

