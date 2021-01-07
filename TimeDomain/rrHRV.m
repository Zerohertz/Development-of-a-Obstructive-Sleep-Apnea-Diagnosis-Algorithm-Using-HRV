
function [med,qr,shift] = rrHRV(RR,num,type,overlap,grade,tolerance)
%rrHRV HRV based on relative RR intervals.
%   [med,qr,shift] = rrHRV(RR,num) computes the euclidean distance to the
%   center point of the return map of relative RR intervals of grade 1.
%   RR is a vector containing RR intervals in seconds.
%   num specifies the number of successive values for which the local
%   average heart rate will be computed.
%   med and qr are vectors of the same length as RR which is median (HRV)
%   and the interquartile range (annular intensity) of the euclidean
%   distance. 
%   shift is a matrix with the coordinates of the center point.
%   If num equals 0, the global measures will be computed.
%   For faster computation on local measures you can specify an overlap.
%   This is a value between 0 and 1. (default: 1)
%
%   [med,qr,shift] = rrHRV(RR,num,type), to specify the type of distance
%   measure (experimental usage). (default: 'central')
%   'central': The center point is computed from coordinates between -20
%   and +20 percent.
%   'central_shiftfilter': The center point is moving average filtered of
%   all coordinates in shift. Distances will be renewed.
%   'point2point': Without the use of a center point. Uses the length of
%   connected coordinates of the return map (The euclidean distance of
%   (rr(i),rr(i+1)) with (rr(i+1),rr(i+2))).
%
%   Example: If RR = repmat([1 .98 .9],1,3),
%      then HRV.rrHRV(RR) is 10.846 and [med,qr,shift] = HRV.rrHRV(RR)
%      results in med = 10.846 and qr = 6.8389 and 
%      shift = [-0.2899 -1.2171].

    if nargin<2 || isempty(num)
        num = 0;
    end
    if nargin<3 || isempty(type)
        type = 'central';
    end
    if nargin<4 || isempty(overlap)
        overlap = 1;
    end
    if nargin<5 || isempty(grade)
        grade = 1;
    end
    if nargin<6 || isempty(tolerance)
        tolerance = 20;
    end    

    rr_pct = HRV.rrx(RR,grade)*100;
    valid = abs(rr_pct)<tolerance;
    valid = valid(1:end-1) & valid(2:end);
    
    rr_med  = @(rr,z,valid) HRV.nanmedian(sqrt(sum([rr([valid; false])-z(1) rr([false; valid])-z(2)].^2,2)));
    rr_iqr  = @(rr,z,valid) diff(HRV.nanquantile(sqrt(sum([rr([valid; false])-z(1) rr([false; valid])-z(2)].^2,2)),[.25 .75]));
   
    if num>0
        med = NaN(size(rr_pct));
        qr = NaN(size(rr_pct));
        shift = NaN(length(rr_pct),2);        
    end
    
    if overlap==1
        steps = 1; 
    else
        steps = ceil(num*(1-overlap));
    end
    
    switch type
        case 'central'
            % euclidean measure to the center point
            if num==0
                z = [mean(rr_pct([valid; false])) mean(rr_pct([false; valid]))];
                shift = z;
                med = rr_med(rr_pct,z,valid);
                qr = rr_iqr(rr_pct,z,valid); 
            else
                for i=max(3,steps):steps:length(rr_pct)
                    rr_pct_part = rr_pct(max(i-num+1,1):i);
                    valid_part = valid(max(i-num+1,1):(i-1));
                    if sum(valid_part)>4
                        z = [mean(rr_pct_part([valid_part; false])) mean(rr_pct_part([false; valid_part]))];
                        shift(i,:) = z;
                        med(i) = rr_med(rr_pct_part,z,valid_part);
                        qr(i) = rr_iqr(rr_pct_part,z,valid_part);
                    end
                end 
            end  
            
        case 'central_shiftfilter'
            % euclidean measure to the filtered center point
            if num==0
                z = [mean(rr_pct([valid; false])) mean(rr_pct([false; valid]))];
                shift = z;
                med = rr_med(rr_pct,z,valid);
                qr = rr_iqr(rr_pct,z,valid); 
            else
                for i=3:length(rr_pct)
                    rr_pct_part = rr_pct(max(i-num+1,1):i);
                    valid_part = valid(max(i-num+1,1):(i-1));
                    if sum(valid_part)>4
                        z = [mean(rr_pct_part([valid_part; false])) mean(rr_pct_part([false; valid_part]))];
                        shift(i,:) = z;
                    end
                end
                shift = filter(ones(9,1)/9,1,shift);
                for i=max(3,steps):steps:length(rr_pct)
                    rr_pct_part = rr_pct(max(i-num+1,1):i);
                    valid_part = valid(max(i-num+1,1):(i-1));
                    med(i) = rr_med(rr_pct_part,shift(i,:),valid_part);
                    qr(i) = rr_iqr(rr_pct_part,shift(i,:),valid_part); 
                end             
            end
            
        case 'point2point'
            % euclidean distance of successive points 
            p2p = [NaN; sqrt(filter(ones(2,1),1,diff(rr_pct).^2))];
            if num==0
                quant = HRV.nanquantile(p2p',[.25 .5 .75]);
                med = quant(2);
                qr = quant(3)-quant(1);
            else              
                ts = NaN(length(rr_pct),num);
                for j=1:num
                    ts(j:end,j) = p2p(1:(end-j+1));
                end
                quant = HRV.nanquantile(ts,[.25 .5 .75]);
                med = quant(:,2);
                qr = quant(:,3)-quant(:,1);
            end
            
%         case 'allpoints'
%             % distance of all points to eachother           
%             p2p = NaN(length(rr_pct),num-1);
%             for j=1:num-1            
%                 p2p(:,j) = [NaN(j,1); sqrt(filter(ones(2,1),1,(rr_pct(j+1:end)-rr_pct(1:end-j)).^2))];
%                 p2p(j+1,j) = NaN;
%             end
%             
%             ts = NaN(length(rr_pct),nchoosek(num,2));
%             tmp = 1;
%             for j=1:num
%                 ts(:,tmp:tmp+num-j-1) = p2p(:,1:(end-j+1));
%                 tmp = tmp+num-j;
%             end
%             quant = HRV.nanquantile(ts,[.25 .5 .75]);
%             med = quant(:,2);
%             qr = quant(:,3)-quant(:,1);
                     
        otherwise
            warning('HRV.m: Unknown rrHRV type.')
    end
   
end