function [VLF, LF, HF] = freqHRVtotal(f, P)
for N = (1:length(f(1,:)))
[f1, f2, f3] = freqHRVanalysis(f(:, N), P(:, N));
VLF(N) = f1;
LF(N) = f2;
HF(N) = f3;
end
end

