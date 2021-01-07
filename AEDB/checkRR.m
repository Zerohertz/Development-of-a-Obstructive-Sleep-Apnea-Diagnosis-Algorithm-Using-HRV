function [] = checkRR(paramName, size, param)
cd apnea-ecg-database-1.0.0/
wfdb2mat(paramName);
[tm, data] = rdmat(append(paramName, 'm'));
cd ..

ecg = data(:, 1);
tm = tm(1:(length(tm)/10));
ecg = ecg(1:(length(ecg)/10));
ra = fix(rand() * length(tm) / 200);

[qr, lo, y] = rrIntervalparam(tm, ecg, param);
[tt, hh] = makeHRV(lo);

i = 1;

for N = lo
    num = find(tm == N);
    rPeak(i) = ecg(num);
    i = i + 1;
end

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(3,1,1)
plot(tm, ecg, 'LineWidth', 1)
hold on
plot(lo, rPeak, 'ro')
axis([ra ra + size -1 3])
xlabel('Time(sec)')
ylabel('ECG(mV)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,2)
plot(tm, y, 'LineWidth', 1)
hold on
plot(lo, qr, 'ro')
axis([ra ra + size 0 0.9])
xlabel('Time(sec)')
ylabel('Amplitude')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,3)
bar(tt, hh, 0.01)
hold on
plot(tt, hh, 'ro')
axis([ra ra + size 0 2000])
xlabel('Time(sec)')
ylabel('HRV(msec)')
grid on
set(gca, 'fontsize', 15)

cd RR/
saveas(gca, append(append(paramName, 'checkRR', string(param)), '.bmp'))
cd ..
end

