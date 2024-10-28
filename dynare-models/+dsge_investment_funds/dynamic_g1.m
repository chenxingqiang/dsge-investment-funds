function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = dsge_investment_funds.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(26, 39);
g1(1,13)=(-(params(1)*T(9)*T(10)));
g1(1,33)=(-(params(1)*T(10)*1/y(13)));
g1(1,28)=1;
g1(2,13)=T(11);
g1(2,16)=(-y(28));
g1(2,28)=(-(1+y(16)));
g1(3,13)=(-T(11));
g1(3,14)=y(15)*T(12);
g1(3,15)=T(2);
g1(4,19)=1;
g1(4,35)=(-y(28));
g1(4,37)=(-y(28));
g1(4,28)=(-(y(35)+y(37)));
g1(5,34)=(-(y(28)*(-(params(11)*y(36)))/(y(34)*y(34))));
g1(5,36)=(-(y(28)*params(11)/y(34)));
g1(5,28)=(-(1+y(29)+params(11)*y(36)/y(34)));
g1(5,29)=(-y(28));
g1(6,4)=y(18);
g1(6,18)=y(4);
g1(6,5)=1;
g1(6,21)=params(11)*0.5*2*y(21);
g1(6,22)=1;
g1(6,8)=(-y(10));
g1(6,9)=(-1);
g1(6,10)=(-(1+y(8)));
g1(7,4)=(-y(18));
g1(7,18)=(-y(4));
g1(7,19)=1;
g1(7,5)=(-1);
g1(8,18)=(-((1+y(19)*params(16)-y(10))*T(15)/(y(19)*2*params(16))));
g1(8,19)=(-(T(16)/(y(19)*2*params(16)*y(19)*2*params(16))));
g1(8,21)=1;
g1(8,10)=(-(T(22)/(y(19)*2*params(16))));
g1(9,12)=1;
g1(9,14)=(-(T(7)*T(14)));
g1(9,23)=(-(T(6)*T(17)));
g1(9,26)=(-(T(5)*T(7)));
g1(10,23)=1;
g1(10,24)=(-(T(18)*T(19)));
g1(10,25)=(-(T(19)*T(20)));
g1(11,3)=(-(getPowerDeriv(y(3),params(7),1)));
g1(11,25)=1;
g1(12,2)=(-(getPowerDeriv(y(2),params(7),1)));
g1(12,24)=1;
g1(13,12)=(-(params(2)/y(14)));
g1(13,14)=(-((-(y(12)*params(2)))/(y(14)*y(14))));
g1(13,15)=1;
g1(14,12)=(-((1-params(2))/y(1)));
g1(14,16)=1;
g1(14,1)=(-((-(y(12)*(1-params(2))))/(y(1)*y(1))));
g1(15,17)=(-1);
g1(15,1)=1;
g1(15,11)=(-(1-params(3)));
g1(16,1)=1;
g1(16,2)=(-1);
g1(16,3)=(-1);
g1(17,2)=y(18);
g1(17,4)=(-1);
g1(17,18)=y(2);
g1(18,3)=1;
g1(18,20)=(-1);
g1(18,5)=(-1);
g1(19,12)=1;
g1(19,13)=(-1);
g1(19,17)=(-1);
g1(19,21)=(-(params(11)*0.5*2*y(21)+0.5*params(10)*2*y(21)));
g1(20,18)=1;
g1(20,21)=params(10);
g1(21,6)=(-(params(12)*1/y(6)));
g1(21,26)=1/y(26);
g1(21,38)=(-params(14));
g1(22,7)=(-(params(13)*1/y(7)));
g1(22,27)=1/y(27);
g1(22,39)=(-params(15));
g1(23,16)=(-1);
g1(23,29)=1;
g1(24,4)=(-1);
g1(24,30)=1;
g1(25,5)=(-1);
g1(25,31)=1;
g1(26,1)=(-1);
g1(26,32)=1;

end
