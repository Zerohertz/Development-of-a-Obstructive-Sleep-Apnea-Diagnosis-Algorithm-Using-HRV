function [] = checkRR(DataType, paramName, startTime, size, param)
if DataType == 1
    cd AEDB %100Hz
    cd apnea-ecg-database-1.0.0/
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, apn] = rdann(paramName, 'apn');
    ecg = data;
    tm = tm(tmApn(1):tmApn(length(tmApn)) + 5999);
    ecg = ecg(tmApn(1):tmApn(length(tmApn)) + 5999);
        
elseif DataType == 2
    cd MIT %250Hz
    cd mit-bih-polysomnographic-database-1.0.0
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, ~, ~, ~, ~, apn] = rdann(paramName, 'st');
    ecg = data(:,1);
end

cd ..
cd ..

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
axis([startTime startTime + size -1 3])
xlabel('Time(sec)')
ylabel('ECG(mV)')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,2)
plot(tm, y, 'LineWidth', 1)
hold on
plot(lo, qr, 'ro')
axis([startTime startTime + size 0 0.9])
xlabel('Time(sec)')
ylabel('Amplitude')
grid on
set(gca, 'fontsize', 15)

subplot(3,1,3)
bar(tt, hh, 0.01)
hold on
plot(tt, hh, 'ro')
axis([startTime startTime + size 0 2000])
xlabel('Time(sec)')
ylabel('HRV(msec)')
grid on
set(gca, 'fontsize', 15)

cd RR/
saveas(gca, append(append(paramName, 'checkRR', string(param)), '.bmp'))
cd ..
end

