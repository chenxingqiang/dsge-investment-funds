function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 22);

T = dsge_investment_funds.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(9) = (-y(33))/(y(13)*y(13));
T(10) = getPowerDeriv(y(33)/y(13),(-params(4)),1);
T(11) = getPowerDeriv(y(13),(-params(4)),1);
T(12) = getPowerDeriv(y(14),params(5),1);
T(13) = getPowerDeriv(y(14),params(2),1);
T(14) = y(26)*T(13);
T(15) = (-(y(19)*params(16)-y(10)))/(y(18)*y(18));
T(16) = y(19)*2*params(16)*((1+y(19)*params(16)-y(10))*params(16)/y(18)+params(16)*(y(19)*params(16)-y(10))/y(18))-2*params(16)*(y(19)*params(16)-y(10))/y(18)*(1+y(19)*params(16)-y(10));
T(17) = getPowerDeriv(y(23),1-params(2),1);
T(18) = (1-params(8))*getPowerDeriv(y(24),params(9),1);
T(19) = getPowerDeriv(T(8),1/params(9),1);
T(20) = params(8)*getPowerDeriv(y(25),params(9),1);
T(21) = (-1)/y(18);
T(22) = (1+y(19)*params(16)-y(10))*T(21)-(y(19)*params(16)-y(10))/y(18);

end
