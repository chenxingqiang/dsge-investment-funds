function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = dsge_investment_funds.static_resid_tt(T, y, x, params);
end
residual = zeros(26, 1);
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
