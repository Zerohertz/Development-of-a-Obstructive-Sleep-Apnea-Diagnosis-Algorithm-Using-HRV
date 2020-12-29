function [VLF, LF, HF] = freqHRVanalysis(freq, amp)
i = 1;
j = 1;
k = 1;
VLF_amp(1) = 1;
LF_amp(1) = 1;
HF_amp(1) = 1;
for num = (1:length(freq))
    if 0.003 <= freq(num) && freq(num) < 0.05
        %VLF_freq(i) = freq(num);
        VLF_amp(i) = amp(num);
        i = i + 1;
    elseif 0.05 <= freq(num) && freq(num) < 0.15
        %LF_freq(j) = freq(num);
        LF_amp(j) = amp(num);
        j = j + 1;
    elseif 0.15 <= freq(num) && freq(num) <= 0.4
        %HF_freq(k) = freq(num);
        HF_amp(k) = amp(num);
        k = k + 1;
    end
    VLF = mean(VLF_amp);
    LF = mean(LF_amp);
    HF = mean(HF_amp);    
end

