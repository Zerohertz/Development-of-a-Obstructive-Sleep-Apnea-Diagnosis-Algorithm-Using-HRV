function [out] = makeCIofHRV(DataType, paramName, par)
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

[qr, lo, y] = rrIntervalparam(tm, ecg, par);
[time, hrv] = makeHRV(lo);

if DataType == 1
    locat = (time - time(1)) ./ 60 + 1;
    locat = fix(locat);
    mul = 5;
    win = 1;
elseif DataType == 2
    locat = (time - time(1)) ./ 30 + 1;
    locat = fix(locat);
    mul = 10;
    win = 0.5;
end

Win = (time - time(1)) ./ 300 + 1;
Win = fix(Win);

for N = 1:Win(length(Win))
    seqHRV = hrv(find(Win == N));
    [f, p] = freqHRV(seqHRV);
    [vlf, lf, hf] = freqHRVanalysis(f, p);
    v(N) = vlf;
    l(N) = lf;
    h(N) = hf;
    sdsd(N) = HRV.SDSD(seqHRV);
    sdnn(N) = HRV.SDNN(seqHRV);
    sdone(N) = sqrt(1/2 * sdsd(N) ^ 2);
    sdtwo(N) = sqrt(2 * sdnn(N) ^ 2 - 1 / 2 * sdsd(N) ^ 2);
    ratio(N) = sdone(N) / sdtwo(N);
    s(N) = pi * sdone(N) * sdtwo(N);
end

for N = 1:locat(length(locat))
    Min(N) = (N - 1) * win;
    VLF(N) = v(fix((N - 1) / mul + 1));
    LF(N) = l(fix((N - 1) / mul + 1));
    HF(N) = h(fix((N - 1) / mul + 1));
    SDSD(N) = sdsd(fix((N - 1) / mul + 1));
    SDNN(N) = sdnn(fix((N - 1) / mul + 1));
    SDone(N) = sdone(fix((N - 1) / mul + 1));
    SDtwo(N) = sdtwo(fix((N - 1) / mul + 1));
    Ratio(N) = ratio(fix((N - 1) / mul + 1));
    S(N) = s(fix((N - 1) / mul + 1));
    lab(N) = apn(N);
end

out = table(Min', VLF', LF', HF', SDSD', SDNN', SDone', SDtwo', Ratio', S', lab', 'VariableNames',{'time' 'VLF' 'LF', 'HF', 'SDSD', 'SDNN', 'SDone', 'SDtwo', 'Ratio', 'S', 'Label'});
end

