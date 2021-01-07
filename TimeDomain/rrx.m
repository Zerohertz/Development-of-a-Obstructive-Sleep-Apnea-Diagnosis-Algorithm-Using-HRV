
function rr = rrx(RR,grade)
%rrx Relative RR intervals of grade x.
%   rr = rrx(RR) computes relative RR intervals of grade 1, which is the
%   the difference of consecutive RR intervals weighted by their mean. 
%   RR is a vector containing RR intervals in seconds.
%   rr is a vector of the same length as RR. rr(1) is NaN due to the fact,
%   that a predessor for the first RR interval is missing.
%
%   rr = rrx(RR,grade), to specify the grade for comparing RR(i) with
%   RR(i-grade). (default: 1)
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.rrx(RR) is [NaN;-0.0202;-0.0851;0.1053;-0.0202;-0.0851;...
%      0.1053;-0.0202;-0.0851] and HRV.rrx(RR,3) is
%      [NaN;NaN;NaN;0;0;0;0;0;0;0] 

    RR = RR(:);
    if nargin<2
        grade = 1;
    end
    rr = [NaN(grade,1); 2*(RR((1+grade):end)-RR(1:(end-grade)))./...
        (RR((1+grade):end)+RR(1:(end-grade)))];
end
