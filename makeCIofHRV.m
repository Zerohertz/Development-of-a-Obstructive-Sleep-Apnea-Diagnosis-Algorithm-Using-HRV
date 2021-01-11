function [out] = makeCIofHRV(DataType, paramName)
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

[qr, lo, y] = rrInterval(tm, ecg);
[time, hrv] = makeHRV(lo);

if DataType == 1
    locat = time ./ 60 + 1;
    locat = fix(locat);
    mul = 5;
    win = 1;
elseif DataType == 2
    locat = time ./ 30 + 1;
    locat = fix(locat);
    mul = 10;
    win = 0.5;
end

Win = time ./ 300 + 1;
Win = fix(Win);

for N = 1:Win(length(Win))
    seqHRV = hrv(find(Win == N));
    [f, p] = freqHRV(seqHRV);
    [vlf, lf, hf] = freqHRVanalysis(f, p);
    v(N) = vlf;
    l(N) = lf;
    h(N) = hf;
end

for N = 1:locat(length(locat))
    lab(N) = apn(N);
    VLF(N) = v(fix((N - 1) / mul + 1));
    LF(N) = l(fix((N - 1) / mul + 1));
    HF(N) = h(fix((N - 1) / mul + 1));
    Min(N) = (N - 1) * win;
end

out = table(Min', VLF', LF', HF', lab', 'VariableNames',{'time' 'VLF' 'LF', 'HF', 'Label'});
end

