% Reference : Sleep Apnea Identification using HRV Features of ECG Signals
% International Journal of Electrical and Computer Engineering, Vol.8, No.5
% out=SDseries(Val,N);
% SD1, SD2, SD1 SD2 ratio, S
%
function out=SDseries(N, paramName, DataType)

if DataType == 1
    cd ..
    cd AEDB
    cd apnea-ecg-database-1.0.0/
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, apn] = rdann(paramName, 'apn');
    cd ..
    [lo, ~, ~] = rrInterval(tm, data);
elseif DataType == 2
    cd ..
    cd MIT
    cd mit-bih-polysomnographic-database-1.0.0
    wfdb2mat(paramName);
    [tm, data] = rdmat(append(paramName, 'm'));
    [tmApn, ~, ~, ~, ~, apn] = rdann(paramName, 'st');
    cd ..
    [lo, ~, ~] = rrInterval(tm, data(:,1));
end

[~, Val] = makeHRV(lo);

cd ..
cd TimeDomain

sdsd=HRV.SDSD(Val,N);
sdnn=HRV.SDNN(Val,N);
SDone=sqrt(1/2.*sdsd.^2);
SDtwo=sqrt(2.*sdnn.^2-1/2.*sdsd.^2);
ratio=SDone./SDtwo;
S=pi.*SDone.*SDtwo

out=table(SDone,SDtwo,ratio,S,'VariableNames',{'SD1' 'SD2' 'Ratio' 'S'});

end