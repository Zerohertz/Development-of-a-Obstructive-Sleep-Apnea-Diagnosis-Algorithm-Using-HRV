

function tri = TRI(RR,num,w,overlap) 
%TRI Triangular Index.
%   tri = TRI(RR,num) computes the triangular index (TRI).
%   TRI is the reciprocal of the probability of the
%   hightest bin of the histogram of RR intervals with bin size w.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   measure will be retrospectively computed.
%   w is the bin size of the histogram.
%   TRI is a column vector with the same length as RR.
%   If num equals 0, the global measure will be computed.
%   Then, TRI is a numbers.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   tri = TRI(RR,num,w), where w is the histogram bin size.
%   (default: w=1/128)
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.TRI(RR,6) is [1;2;3;2;2.5;3;3;3;3]
%      and HRV.TRI(RR,0,1/64) is 3. 

    if nargin<2 || isempty(num)
        num = 0;
    end
    if nargin<4 || isempty(overlap)
        overlap = 1;
    end 
    if nargin<3
        [tri,~] = HRV.triangular_val(RR,num);
    else
        [tri,~] = HRV.triangular_val(RR,num,w,overlap);
    end    
end