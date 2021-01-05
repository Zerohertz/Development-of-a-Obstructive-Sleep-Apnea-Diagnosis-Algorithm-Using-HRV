function [tab] = makeLabelofHRV(tm, data, SamplingRate, Windowsize, Apn)
[f, p] = windowHRV(tm, data(:, 1), SamplingRate, Windowsize);
F = freqHRVCI(f, p);
sp = windowSpO2(data(:, 5), SamplingRate, Windowsize);

for N = (1:length(sp)) % 78(Normal) / 65(Apnea)
    apn(N) = mean(Apn(Windowsize * (N - 1) + 1:Windowsize * N));
end

apn = abs(apn - 78) / (78 - 65);
tab = table(F(:, 1), F(:, 2), F(:, 3), sp', apn');
tab.Properties.VariableNames{'Var1'} = 'VLF';
tab.Properties.VariableNames{'Var2'} = 'LF';
tab.Properties.VariableNames{'Var3'} = 'HF';
tab.Properties.VariableNames{'Var4'} = 'SpO2';
tab.Properties.VariableNames{'Var5'} = 'apn';
end

