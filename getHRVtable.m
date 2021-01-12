function out = getHRVtable(DataType, paramName)
if DataType == 1
    cd AEDB %100Hz
    cd apnea-ecg-database-1.0.0/
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, apn] = rdann(paramName, 'apn');
    ecg = data;
    tm = tm(1:tmApn(length(tmApn)));
    ecg = ecg(1:tmApn(length(tmApn)));
        
elseif DataType == 2
    cd MIT %250Hz
    cd mit-bih-polysomnographic-database-1.0.0
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, ~, ~, ~, ~, apn] = rdann(paramName, 'st');
    ecg = data(:,1);
    tm = tm(tmApn(1):tmApn(length(tmApn)));
    ecg = ecg(tmApn(1):tmApn(length(tmApn)));
end

cd ..
cd ..

[qr, lo, y] = rrInterval(tm, ecg);
[time, hrv] = makeHRV(lo);

if DataType == 1
    locat = time ./ 60 + 1;
    locat = fix(locat);
elseif DataType == 2
    locat = time ./ 30 + 1;
    locat = fix(locat);
end

for N = 1:length(locat)
    lab(N) = apn(locat(N));
end

out = table(time', hrv', lab', 'VariableNames',{'time' 'HRV' 'Label'});

end

