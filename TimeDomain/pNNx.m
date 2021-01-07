
function [hrv_pNNx,hrv_NNx] = pNNx(RR,num,x,flag,overlap) 
%pNNx Probability of intervals greater x ms or smaller -x ms.
%   [hrv_pNNx,hrv_NNx] = pNNx(RR,num,x) computes the number for which the
%   successive RR differences exceed x milliseconds and its proportion.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   measure will be retrospectively computed.
%   x is a number which specifies the limit of successive differences in
%   milliseconds.
%   hrv_pNNx is a column vector with the same length as RR. hrv_pNNx has
%   NaN values at those positions for which the sample size is smaller 5.
%   If num equals 0, the global measure will be computed.
%   hrv_pNNx is then a number.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   [hrv_pNNx,hrv_NNx] = pNNx(RR,num,x,flag), where flag is 0 or 1 to
%   specify normalization by n-1 or n. (default: 1)
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.pNNx(RR,6,20) is [NaN;NaN;NaN;NaN;NaN;1;1;1;1]
%      and  HRV.pNNx(RR,6,150) is [NaN;NaN;NaN;NaN;NaN;0;0;0;0]
%      and [hrv_pNNx,hrv_NNx] = HRV.pNNx(RR,0,20,0) is hrv_pNNx = 1.1429
%      and hrv_NNx = 8. 

    RR = RR(:);
    if nargin<3 || isempty(num) || isempty(x)
        error('HRV.pNNx: wrong number or types of arguments');
    end
    if nargin<4 || isempty(flag)
        flag = 1; %The flag is 0 or 1 to specify normalization by n-1 or n.
    end
    if nargin<5 || isempty(overlap)
        overlap = 1;
    end
    
    NNx = double(abs(diff(RR))>x/1000);
    NNx(isnan(diff(RR)))=NaN;
    
    if num==0
        hrv_NNx = HRV.nansum(NNx);
        hrv_pNNx = hrv_NNx./(sum(~isnan(NNx))-1+flag);
    else 
        if ceil(num*(1-overlap))>1
            j=1;
            ts = NaN(length(ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(NNx)),num);
            for i=ceil(num*(1-overlap)):ceil(num*(1-overlap)):length(NNx)
                ts(j,1:(1+i-max(1,(i-num+1)))) = NNx(max(1,(i-num+1)):i);
                j=j+1;
            end 
            samplesize = sum(~isnan(ts),2);
            
            hrv_NNx_tmp = HRV.nansum(ts,2);
            hrv_pNNx_tmp = hrv_NNx_tmp./(samplesize-1+flag);
            hrv_pNNx_tmp(samplesize<5) = NaN;
    
            hrv_NNx = NaN(length(RR),1);  
            hrv_NNx(ceil(num*(1-overlap))+1:ceil(num*(1-overlap)):length(NNx)+1) = hrv_NNx_tmp;        
            hrv_pNNx = NaN(length(RR),1);  
            hrv_pNNx(ceil(num*(1-overlap))+1:ceil(num*(1-overlap)):length(NNx)+1) = hrv_pNNx_tmp;  
        else
            ts = NaN(length(RR),num);
            for j=1:num
                ts(j+1:end,j) = NNx(1:end-j+1);
            end    
            samplesize = sum(~isnan(ts),2);

            hrv_NNx = HRV.nansum(ts,2);
            hrv_pNNx = hrv_NNx./(samplesize-1+flag);
            hrv_pNNx(samplesize<5) = NaN;
        end
    end
end