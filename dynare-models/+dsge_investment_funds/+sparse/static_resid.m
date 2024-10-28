function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = dsge_investment_funds.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(26, 1);
    residual(1) = (y(22)) - (params(1));
    residual(2) = (T(1)) - (y(22)*(1+y(5)));
    residual(3) = (y(4)*T(2)) - (T(1));
    residual(4) = (y(12)) - (y(22)*(y(12)+y(16)));
    residual(5) = (1) - (y(22)*(1+y(23)+params(11)*y(15)/y(11)));
    residual(6) = (y(16)) - (y(24)-y(11)*y(10)-y(14)+(1+y(23))*y(25)-T(4));
    residual(7) = (y(12)) - (y(11)*y(10)+y(14));
    residual(8) = (y(15)) - ((y(12)*params(16)-y(25))/y(11)*(1+y(12)*params(16)-y(25))/(y(12)*2*params(16)));
    residual(9) = (y(1)) - (T(6)*T(7));
    residual(10) = (y(17)) - (T(8)^(1/params(9)));
    residual(11) = (y(19)) - (y(9)^params(7));
    residual(12) = (y(18)) - (y(8)^params(7));
    residual(13) = (y(4)) - (y(1)*params(2)/y(3));
    residual(14) = (y(5)) - (y(1)*(1-params(2))/y(7)-params(3));
    residual(15) = (y(7)) - (y(6)+(1-params(3))*y(26));
    residual(16) = (y(7)) - (y(9)+y(8));
    residual(17) = (y(11)*y(8)) - (y(10));
    residual(18) = (y(9)) - (y(14)+y(13));
    residual(19) = (y(1)) - (T(4)+y(2)+y(6)+T(3)*0.5*params(10));
    residual(20) = (y(11)) - (1-y(15)*params(10));
    residual(21) = (log(y(20))) - (log(y(20))*params(12)+params(14)*x(1));
    residual(22) = (log(y(21))) - (log(y(21))*params(13)+params(15)*x(2));
    residual(23) = (y(23)) - (y(5));
    residual(24) = (y(24)) - (y(10));
    residual(25) = (y(25)) - (y(14));
    residual(26) = (y(26)) - (y(7));
end
