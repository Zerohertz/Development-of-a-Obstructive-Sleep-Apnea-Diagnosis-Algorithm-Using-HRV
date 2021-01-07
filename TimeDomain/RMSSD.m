
function hrv_rmssd = RMSSD(RR,num,flag,overlap)  
%RMSSD Root Mean Square of Successive Differences.
%   hrv_rmssd = RMSSD(RR,num) is the root mean square of successive
%   differences.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   RMSSD will be retrospectively computed.
%   hrv_rmssd is a column vector with the same length as RR. hrv_rmssd has
%   NaN values at those positions for which the sample size is smaller 5.
%   If num equals 0, the global measure will be computed.
%   hrv_rmssd is then a number.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   hrv_rmssd = RMSSD(RR,num,flag), where flag is 0 or 1 to specify
%   normalization by n-1 or n. (default: 1)
%
%   Example: If RR = repmat([1 .9],1,5),
%      then HRV.RMSSD(RR,6) is [NaN;NaN;NaN;NaN;NaN;0.1;0.1;0.1;0.1;0.1]
%      and HRV.RMSSD(RR,0,1) is 0.1000 and HRV.RMSSD(RR,0,0) is 0.1061.

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
    
    dRR = diff(RR).^2;
    if num==0
        hrv_rmssd = sqrt(HRV.nansum(dRR)./(sum(~isnan(dRR))-1+flag));
    else
        if ceil(num*(1-overlap))>1
            j=1;
            ts = NaN(length(ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(dRR)),num);
            for i=ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(dRR)
                ts(j,1:(1+i-max(1,(i-num+1)))) = dRR(max(1,(i-num+1)):i);
                j=j+1;
            end 
            samplesize = sum(~isnan(ts),2);
            hrv_rmssd_tmp = sqrt(HRV.nansum(ts,2)./(samplesize-1+flag)); 
            hrv_rmssd_tmp(samplesize<5) = NaN;
            
            hrv_rmssd = NaN(length(RR),1);  
            hrv_rmssd(ceil(num*(1-overlap))+1:ceil(num*(1-overlap)):length(RR)) = hrv_rmssd_tmp;  
        else
            ts = NaN(length(RR),num);
            for j=1:num
                ts(j+1:end,j) = dRR(1:end-j+1);
            end    
            samplesize = sum(~isnan(ts),2);
            hrv_rmssd = sqrt(HRV.nansum(ts,2)./(samplesize-1+flag));
            hrv_rmssd(samplesize<5) = NaN;
        end
    end
end