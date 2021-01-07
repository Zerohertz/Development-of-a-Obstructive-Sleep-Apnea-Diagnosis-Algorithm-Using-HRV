function [tab] = makeTrainData(paramName, Winsize)
cd apnea-ecg-database-1.0.0/
wfdb2mat(paramName);
[tm, data] = rdmat(append(paramName, 'm'));
[tmApn, apn] = rdann(paramName, 'apn');
cd ..

tab = makeLabelofHRV(tm, data, 100, Winsize, tmApn, apn);

for N = 1:height(tab)
    if tab.apn(N) == 0
        tab.label(N) = "Normal";
    else
        tab.label(N) = "Apnea";
    end
end
end