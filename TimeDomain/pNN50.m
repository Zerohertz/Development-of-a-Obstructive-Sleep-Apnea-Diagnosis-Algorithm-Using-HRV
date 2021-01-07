

function hrv_pNN50 = pNN50(RR,num,flag,overlap)
%pNN50 Probability of intervals greater 50 ms or smaller -50 ms.
%   hrv_pNN50 = pNN50(RR,num) computes the proportion for which the
%   successive RR differences exceed 50 milliseconds.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   measure will be retrospectively computed.
%   hrv_pNN50 is a column vector with the same length as RR. hrv_pNN50 has
%   NaN values at those positions for which the sample size is smaller 5.
%   If num equals 0, the global measure will be computed.
%   hrv_pNN50 is then a number.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   [hrv_pNN50 = pNN50(RR,num,x,flag), where flag is 0 or 1 to
%   specify normalization by n-1 or n. (default: 1)
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.pNN50(RR,6) is [NaN;NaN;NaN;NaN;NaN;0.6;.6667;.6667;.6667]
%      and HRV.pNN50(RR,6,0) is [NaN;NaN;NaN;NaN;NaN;0.75;.8;.8;.8]. 

    if nargin<2 || isempty(num)
        num = 0;
    end    
    if nargin<3 || isempty(flag)
        flag = 1; %The flag is 0 or 1 to specify normalization by n-1 or n.
    end  
    if nargin<4 || isempty(overlap)
        overlap = 1;
    end    
    hrv_pNN50 = HRV.pNNx(RR,num,50,flag,overlap);
end
