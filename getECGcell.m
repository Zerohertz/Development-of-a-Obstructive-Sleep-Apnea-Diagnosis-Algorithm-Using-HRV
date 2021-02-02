function [tab] = getECGcell(DataType, paramName)
if DataType == 1
    cd AEDB %100Hz
    cd apnea-ecg-database-1.0.0/
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, apn] = rdann(paramName, 'apn');
    ecg = data;
    tm = tm(1:tmApn(length(tmApn)));
    ecg = ecg(1:tmApn(length(tmApn)));
    for N = 1:length(ecg)
        lab(N) = apn(fix((N - 1) / 6000 + 1));
    end
        
elseif DataType == 2
    cd MIT %250Hz
    cd mit-bih-polysomnographic-database-1.0.0
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, ~, ~, ~, ~, apn] = rdann(paramName, 'st');
    ecg = data(:,1);
    tm = tm(tmApn(1):tmApn(length(tmApn)) + 7499);
    ecg = ecg(tmApn(1):tmApn(length(tmApn)) + 7499);
    for N = 1:length(ecg)
        lab(N) = apn(fix((N - 1) / 7500 + 1));
    end
end

Win = (tm - tm(1)) ./ 30 + 1;
Win = fix(Win);

for N = 1:Win(length(Win))
    tab(N).time = tm(find(Win == N))';
    tab(N).ECG = ecg(find(Win == N));
    tab(N).lab = apn(N);
end

cd ..
cd ..

%out = table(tm', ecg, lab', 'VariableNames',{'time' 'ecg' 'Label'});
end

