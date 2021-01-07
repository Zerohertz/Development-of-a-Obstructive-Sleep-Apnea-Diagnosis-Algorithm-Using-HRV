
function hrv_sdnn = SDNN(RR,num,flag,overlap)
%SDNN Standard deviation of NN intervals.
%   hrv_sdnn = SDNN(RR,num) is the standard deviation of NN intervals.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   standard deviation will be retrospectively computed.
%   hrv_sdnn is a column vector with the same length as RR. hrv_sdnn has
%   NaN values at those positions for which the sample size is smaller 5.
%   If num equals 0, the global standard deviation will be computed.
%   hrv_sdnn is then a number.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   hrv_sdnn = SDNN(RR,num,flag), where flag is 0 or 1 to specify
%   normalization by n-1 or n. (default: 1)
%
%   Example: If RR = repmat([1 .9],1,5),
%      then HRV.SDNN(RR,6) is [0;.05;.0471;.05;.049;.05;.05;.05;.05;.05]
%      and HRV.SDNN(RR,0,1) is 0.0500 and HRV.SDNN(RR,0,0) is 0.0527.

    RR = RR(:);
    if nargin<2 || isempty(num)
        num = 0;
    end
    if nargin<3 || isempty(flag)
        flag = 1; %The flag is 0 or 1 to specify normalization by n-1 or n.
    end
    if nargin<4 || isempty(overlap)
        overlap = 1;
    end
    
    if num==0
        hrv_sdnn = HRV.nanstd(RR,flag,1);
    else
        if ceil(num*(1-overlap))>1
            j=1;
            ts = NaN(length(ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(RR)),num);
            for i=ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(RR)
                ts(j,1:(1+i-max(1,(i-num+1)))) = RR(max(1,(i-num+1)):i);
                j=j+1;
            end
            samplesize = sum(~isnan(ts),2);
            hrv_sdnn_tmp = HRV.nanstd(ts,flag,2); 
            hrv_sdnn_tmp(samplesize<5) = NaN;
            
            hrv_sdnn = NaN(length(RR),1);  
            hrv_sdnn(ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(RR)) = hrv_sdnn_tmp;              
        else
            ts = NaN(length(RR),num);
            for j=1:num
                ts(j:end,j) = RR(1:end-j+1);
            end
            samplesize = sum(~isnan(ts),2);
            hrv_sdnn = HRV.nanstd(ts,flag,2);
            hrv_sdnn(samplesize<5) = NaN;
        end
    end
end