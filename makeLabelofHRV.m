function [tab] = makeLabelofHRV(tm, ecg, SamplingRate, Windowsize, tmApn, Apn)
init = tmApn(1);
tm = tm(init:length(tm));
ecg = ecg(init:length(ecg));

[f, p] = windowHRV(tm, ecg, SamplingRate, Windowsize);
F = freqHRVCI(f, p);

for N = (1:length(F)) % 78(Normal) / 65(Apnea)
    apn(N) = mean(Apn(Windowsize * (N - 1) + 1:Windowsize * N));
end

apn = abs(apn - 78) / (78 - 65);
tab = table(F(:, 1), F(:, 2), F(:, 3), apn');
tab.Properties.VariableNames{'Var1'} = 'VLF';
tab.Properties.VariableNames{'Var2'} = 'LF';
tab.Properties.VariableNames{'Var3'} = 'HF';
tab.Properties.VariableNames{'Var4'} = 'apn';
end
