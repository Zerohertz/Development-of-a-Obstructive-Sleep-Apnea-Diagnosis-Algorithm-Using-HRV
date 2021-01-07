function dnf_num = dnf(c1, c2, al, be)
    dnf_num = 1/(al+be)*(al*(kurtosis(c1)/kurtosis(c2))+be*(sqrt(var(c1))/sqrt(var(c2))));
end