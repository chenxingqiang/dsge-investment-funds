function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 8);

T(1) = y(2)^(-params(4));
T(2) = y(3)^params(5);
T(3) = y(15)^2;
T(4) = params(11)*0.5*T(3);
T(5) = y(3)^params(2);
T(6) = y(20)*T(5);
T(7) = y(17)^(1-params(2));
T(8) = params(8)*y(19)^params(9)+(1-params(8))*y(18)^params(9);

end
