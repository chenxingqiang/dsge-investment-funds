function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = dsge_investment_funds.static_g1_tt(T, y, x, params);
end
g1 = zeros(26, 26);
g1(1,22)=1;
g1(2,2)=T(9);
g1(2,5)=(-y(22));
g1(2,22)=(-(1+y(5)));
g1(3,2)=(-T(9));
g1(3,3)=y(4)*getPowerDeriv(y(3),params(5),1);
g1(3,4)=T(2);
g1(4,12)=1-y(22);
g1(4,16)=(-y(22));
g1(4,22)=(-(y(12)+y(16)));
g1(5,11)=(-(y(22)*(-(params(11)*y(15)))/(y(11)*y(11))));
g1(5,15)=(-(y(22)*params(11)/y(11)));
g1(5,22)=(-(1+y(23)+params(11)*y(15)/y(11)));
g1(5,23)=(-y(22));
g1(6,10)=y(11);
g1(6,11)=y(10);
g1(6,14)=1;
g1(6,15)=params(11)*0.5*2*y(15);
g1(6,16)=1;
g1(6,23)=(-y(25));
g1(6,24)=(-1);
g1(6,25)=(-(1+y(23)));
g1(7,10)=(-y(11));
g1(7,11)=(-y(10));
g1(7,12)=1;
g1(7,14)=(-1);
g1(8,11)=(-((1+y(12)*params(16)-y(25))*(-(y(12)*params(16)-y(25)))/(y(11)*y(11))/(y(12)*2*params(16))));
g1(8,12)=(-((y(12)*2*params(16)*((1+y(12)*params(16)-y(25))*params(16)/y(11)+params(16)*(y(12)*params(16)-y(25))/y(11))-(y(12)*params(16)-y(25))/y(11)*(1+y(12)*params(16)-y(25))*2*params(16))/(y(12)*2*params(16)*y(12)*2*params(16))));
g1(8,15)=1;
g1(8,25)=(-(((1+y(12)*params(16)-y(25))*(-1)/y(11)-(y(12)*params(16)-y(25))/y(11))/(y(12)*2*params(16))));
g1(9,1)=1;
g1(9,3)=(-(T(7)*y(20)*getPowerDeriv(y(3),params(2),1)));
g1(9,17)=(-(T(6)*getPowerDeriv(y(17),1-params(2),1)));
g1(9,20)=(-(T(5)*T(7)));
g1(10,17)=1;
g1(10,18)=(-((1-params(8))*getPowerDeriv(y(18),params(9),1)*T(10)));
g1(10,19)=(-(T(10)*params(8)*getPowerDeriv(y(19),params(9),1)));
g1(11,9)=(-(getPowerDeriv(y(9),params(7),1)));
g1(11,19)=1;
g1(12,8)=(-(getPowerDeriv(y(8),params(7),1)));
g1(12,18)=1;
g1(13,1)=(-(params(2)/y(3)));
g1(13,3)=(-((-(y(1)*params(2)))/(y(3)*y(3))));
g1(13,4)=1;
g1(14,1)=(-((1-params(2))/y(7)));
g1(14,5)=1;
g1(14,7)=(-((-(y(1)*(1-params(2))))/(y(7)*y(7))));
g1(15,6)=(-1);
g1(15,7)=1;
g1(15,26)=(-(1-params(3)));
g1(16,7)=1;
g1(16,8)=(-1);
g1(16,9)=(-1);
g1(17,8)=y(11);
g1(17,10)=(-1);
g1(17,11)=y(8);
g1(18,9)=1;
g1(18,13)=(-1);
g1(18,14)=(-1);
g1(19,1)=1;
g1(19,2)=(-1);
g1(19,6)=(-1);
g1(19,15)=(-(params(11)*0.5*2*y(15)+0.5*params(10)*2*y(15)));
g1(20,11)=1;
g1(20,15)=params(10);
g1(21,20)=1/y(20)-params(12)*1/y(20);
g1(22,21)=1/y(21)-params(13)*1/y(21);
g1(23,5)=(-1);
g1(23,23)=1;
g1(24,10)=(-1);
g1(24,24)=1;
g1(25,14)=(-1);
g1(25,25)=1;
g1(26,7)=(-1);
g1(26,26)=1;

end
