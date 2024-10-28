function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = dsge_investment_funds.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(26, 1);
    residual(1) = (y(28)) - (params(1)*(y(33)/y(13))^(-params(4)));
    residual(2) = (T(1)) - (y(28)*(1+y(16)));
    residual(3) = (y(15)*T(2)) - (T(1));
    residual(4) = (y(19)) - (y(28)*(y(35)+y(37)));
    residual(5) = (1) - (y(28)*(1+y(29)+params(11)*y(36)/y(34)));
    residual(6) = (y(22)) - (y(9)-y(4)*y(18)-y(5)+(1+y(8))*y(10)-T(4));
    residual(7) = (y(19)) - (y(5)+y(4)*y(18));
    residual(8) = (y(21)) - ((y(19)*params(16)-y(10))/y(18)*(1+y(19)*params(16)-y(10))/(y(19)*2*params(16)));
    residual(9) = (y(12)) - (T(6)*T(7));
    residual(10) = (y(23)) - (T(8)^(1/params(9)));
    residual(11) = (y(25)) - (y(3)^params(7));
    residual(12) = (y(24)) - (y(2)^params(7));
    residual(13) = (y(15)) - (y(12)*params(2)/y(14));
    residual(14) = (y(16)) - (y(12)*(1-params(2))/y(1)-params(3));
    residual(15) = (y(1)) - (y(17)+(1-params(3))*y(11));
    residual(16) = (y(1)) - (y(3)+y(2));
    residual(17) = (y(18)*y(2)) - (y(4));
    residual(18) = (y(3)) - (y(5)+y(20));
    residual(19) = (y(12)) - (T(4)+y(13)+y(17)+T(3)*0.5*params(10));
    residual(20) = (y(18)) - (1-y(21)*params(10));
    residual(21) = (log(y(26))) - (params(12)*log(y(6))+params(14)*x(it_, 1));
    residual(22) = (log(y(27))) - (params(13)*log(y(7))+params(15)*x(it_, 2));
    residual(23) = (y(29)) - (y(16));
    residual(24) = (y(30)) - (y(4));
    residual(25) = (y(31)) - (y(5));
    residual(26) = (y(32)) - (y(1));

end
