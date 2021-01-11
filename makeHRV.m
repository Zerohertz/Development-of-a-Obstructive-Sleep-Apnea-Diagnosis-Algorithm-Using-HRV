function [time, val] = makeHRV(locat)
for num = (1:length(locat)-1)
    val(num) = (locat(num + 1) - locat(num)) * 1000;
    time(num) = locat(num);
end
end

