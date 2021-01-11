function out = getECGtable(DataType, paramName)
if DataType == 1
    cd AEDB %100Hz
    cd apnea-ecg-database-1.0.0/
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, apn] = rdann(paramName, 'apn');
    ecg = data;
    tm = tm(tmApn(1):tmApn(length(tmApn)) + 5999);
    ecg = ecg(tmApn(1):tmApn(length(tmApn)) + 5999);
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
    for N = 1:length(ecg)
        lab(N) = apn(fix((N - 1) / 7500 + 1));
    end
end

cd ..
cd ..

out = table(tm', ecg, lab', 'VariableNames',{'time' 'ecg' 'Label'});
end

