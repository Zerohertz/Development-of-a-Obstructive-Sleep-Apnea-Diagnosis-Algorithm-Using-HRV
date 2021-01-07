
function tinn = TINN(RR,num,w,overlap) 
%TINN Triangular Interpolation of NN histogram.
%   tinn = TINN(RR,num) computes the TINN value.
%   TINN is the width of the trinangular function, which has the best fit
%   to the NN histogram with bin size w.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   measure will be retrospectively computed.
%   w is the bin size of the histogram.
%   TINN is a column vectors with the same length as RR.
%   If num equals 0, the global measure will be computed.
%   Then, TINN is a number.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   tinn = TINN(RR,num,w), where w is the histogram bin size.
%   (default: w=1/128)
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.TINN(RR,6) is
%      [.0156;.0156;.0156;.0156;.0156;.0156;.0156;.0156;.0156;.0156]
%      and HRV.TINN(RR,0,1/64) is 0.0313.

    if nargin<2 || isempty(num)
        num = 0;
    end
    if nargin<4 || isempty(overlap)
        overlap = 1;
    end    
    if nargin<3
        [~,tinn] = HRV.triangular_val(RR,num);
    else
        [~,tinn] = HRV.triangular_val(RR,num,w,overlap);
    end 
end