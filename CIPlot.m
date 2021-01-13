function [] = CIPlot(tab)
fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(3,1,1)
plot(tab.time, tab.HF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.HF(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.HF(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('HF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,2)
plot(tab.time, tab.LF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.LF(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.LF(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('LF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,3)
plot(tab.time, tab.VLF, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.VLF(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.VLF(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('VLF', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Amplitude(msec)')
grid on
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(2,1,1)
plot(tab.time, tab.SDSD, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.SDSD(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.SDSD(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('SDSD', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('SDSD')
grid on
set(gca, 'fontsize', 15)

subplot(2,1,2)
plot(tab.time, tab.SDNN, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.SDNN(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.SDNN(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('SDNN', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('SDNN')
grid on
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(2,1,1)
plot(tab.time, tab.SDone, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.SDone(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.SDone(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('SDone', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('SDone')
grid on
set(gca, 'fontsize', 15)

subplot(2,1,2)
plot(tab.time, tab.SDtwo, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.SDtwo(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.SDtwo(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('SDtwo', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('SDtwo')
grid on
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(2,1,1)
plot(tab.time, tab.Ratio, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.Ratio(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.Ratio(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('Ratio', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('Ratio')
grid on
set(gca, 'fontsize', 15)

subplot(2,1,2)
plot(tab.time, tab.S, 'Color', 'black', 'LineWidth', 1.2)
hold on
plot(tab.time(tab.Label == 'N'), tab.S(tab.Label == 'N'), 'Color', 'blue', 'Marker', 'o', 'LineWidth', 1, 'LineStyle', 'none')
plot(tab.time(tab.Label == 'A'), tab.S(tab.Label == 'A'), 'Color', 'red', 'Marker', '*', 'LineWidth', 1, 'LineStyle', 'none')
legend('S', 'Normal', 'Apnea')
xlabel('Time(min)')
ylabel('S')
grid on
set(gca, 'fontsize', 15)
end