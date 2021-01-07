% Reference : Sleep Apnea Identification using HRV Features of ECG Signals
% International Journal of Electrical and Computer Engineering, Vol.8, No.5
% out=SDseries(Val,N);
% SD1, SD2, SD1 SD2 ratio, S
%
function out=SDseries(Val,N);


sdsd=SDSD(Val,N);
sdnn=SDNN(Val,N);
SDone=sqrt(1/2.*sdsd.^2);
SDtwo=sqrt(2.*sdnn.^2-1/2.*sdsd.^2);
ratio=SDone./SDtwo;
S=pi.*SDone.*SDtwo

out=table(SDone,SDtwo,ratio,S,'VariableNames',{'SD1' 'SD2' 'Ratio' 'S'});

