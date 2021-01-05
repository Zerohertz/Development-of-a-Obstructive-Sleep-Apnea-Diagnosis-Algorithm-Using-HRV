function [tab] = makeTableofHRV(tm, data, SamplingRate, Windowsize)
[f, p] = windowHRV(tm, data(:, 1), SamplingRate, Windowsize);
F = freqHRVCI(f, p);
sp = windowSpO2(data(:, 5), SamplingRate, Windowsize);
tab = table(F(:, 1), F(:, 2), F(:, 3), sp');
tab.Properties.VariableNames{'Var1'} = 'VLF';
tab.Properties.VariableNames{'Var2'} = 'LF';
tab.Properties.VariableNames{'Var3'} = 'HF';
tab.Properties.VariableNames{'Var4'} = 'SpO2';
end

