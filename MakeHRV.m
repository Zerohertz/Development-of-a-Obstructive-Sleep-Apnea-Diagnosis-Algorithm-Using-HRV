function [time, val] = MakeHRV(locat)
for num = (1:length(locat)-1)
    val(num) = locat(num + 1) - locat(num);
    time(num) = locat(num);
end
