function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = dsge_investment_funds.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(26, 1);
    residual(1) = (y(48)) - (params(1)*(y(54)/y(28))^(-params(4)));
    residual(2) = (T(1)) - (y(48)*(1+y(31)));
    residual(3) = (y(30)*T(2)) - (T(1));
    residual(4) = (y(38)) - (y(48)*(y(64)+y(68)));
    residual(5) = (1) - (y(48)*(1+y(49)+params(11)*y(67)/y(63)));
    residual(6) = (y(42)) - (y(24)-y(10)*y(37)-y(14)+(1+y(23))*y(25)-T(4));
    residual(7) = (y(38)) - (y(14)+y(10)*y(37));
    residual(8) = (y(41)) - ((y(38)*params(16)-y(25))/y(37)*(1+y(38)*params(16)-y(25))/(y(38)*2*params(16)));
    residual(9) = (y(27)) - (T(6)*T(7));
    residual(10) = (y(43)) - (T(8)^(1/params(9)));
    residual(11) = (y(45)) - (y(9)^params(7));
    residual(12) = (y(44)) - (y(8)^params(7));
    residual(13) = (y(30)) - (y(27)*params(2)/y(29));
    residual(14) = (y(31)) - (y(27)*(1-params(2))/y(7)-params(3));
    residual(15) = (y(7)) - (y(32)+(1-params(3))*y(26));
    residual(16) = (y(7)) - (y(9)+y(8));
    residual(17) = (y(37)*y(8)) - (y(10));
    residual(18) = (y(9)) - (y(14)+y(39));
    residual(19) = (y(27)) - (T(4)+y(28)+y(32)+T(3)*0.5*params(10));
    residual(20) = (y(37)) - (1-y(41)*params(10));
    residual(21) = (log(y(46))) - (params(12)*log(y(20))+params(14)*x(1));
    residual(22) = (log(y(47))) - (params(13)*log(y(21))+params(15)*x(2));
    residual(23) = (y(49)) - (y(31));
    residual(24) = (y(50)) - (y(10));
    residual(25) = (y(51)) - (y(14));
    residual(26) = (y(52)) - (y(7));
end
