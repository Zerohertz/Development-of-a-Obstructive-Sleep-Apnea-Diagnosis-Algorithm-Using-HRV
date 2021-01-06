function [F] = freqHRVCI(f, P)
for N = (1:length(f(1,:)))
[f1, f2, f3] = freqHRVanalysis(f(:, N), P(:, N));
F(N, 1) = f1;
F(N, 2) = f2;
F(N, 3) = f3;
end
end

