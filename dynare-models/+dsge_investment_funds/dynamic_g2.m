function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = dsge_investment_funds.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(67,1);
g2_j = zeros(67,1);
g2_v = zeros(67,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=3;
g2_i(9)=3;
g2_i(10)=3;
g2_i(11)=3;
g2_i(12)=4;
g2_i(13)=4;
g2_i(14)=4;
g2_i(15)=4;
g2_i(16)=5;
g2_i(17)=5;
g2_i(18)=5;
g2_i(19)=5;
g2_i(20)=5;
g2_i(21)=5;
g2_i(22)=5;
g2_i(23)=5;
g2_i(24)=5;
g2_i(25)=6;
g2_i(26)=6;
g2_i(27)=6;
g2_i(28)=6;
g2_i(29)=6;
g2_i(30)=7;
g2_i(31)=7;
g2_i(32)=8;
g2_i(33)=8;
g2_i(34)=8;
g2_i(35)=8;
g2_i(36)=8;
g2_i(37)=8;
g2_i(38)=8;
g2_i(39)=8;
g2_i(40)=8;
g2_i(41)=9;
g2_i(42)=9;
g2_i(43)=9;
g2_i(44)=9;
g2_i(45)=9;
g2_i(46)=9;
g2_i(47)=9;
g2_i(48)=9;
g2_i(49)=10;
g2_i(50)=10;
g2_i(51)=10;
g2_i(52)=10;
g2_i(53)=11;
g2_i(54)=12;
g2_i(55)=13;
g2_i(56)=13;
g2_i(57)=13;
g2_i(58)=14;
g2_i(59)=14;
g2_i(60)=14;
g2_i(61)=17;
g2_i(62)=17;
g2_i(63)=19;
g2_i(64)=21;
g2_i(65)=21;
g2_i(66)=22;
g2_i(67)=22;
g2_j(1)=481;
g2_j(2)=501;
g2_j(3)=1261;
g2_j(4)=1281;
g2_j(5)=481;
g2_j(6)=613;
g2_j(7)=1069;
g2_j(8)=481;
g2_j(9)=521;
g2_j(10)=522;
g2_j(11)=560;
g2_j(12)=1354;
g2_j(13)=1088;
g2_j(14)=1432;
g2_j(15)=1090;
g2_j(16)=1321;
g2_j(17)=1323;
g2_j(18)=1399;
g2_j(19)=1315;
g2_j(20)=1087;
g2_j(21)=1393;
g2_j(22)=1089;
g2_j(23)=1082;
g2_j(24)=1120;
g2_j(25)=135;
g2_j(26)=667;
g2_j(27)=801;
g2_j(28)=283;
g2_j(29)=359;
g2_j(30)=135;
g2_j(31)=667;
g2_j(32)=681;
g2_j(33)=682;
g2_j(34)=720;
g2_j(35)=673;
g2_j(36)=369;
g2_j(37)=721;
g2_j(38)=712;
g2_j(39)=370;
g2_j(40)=361;
g2_j(41)=521;
g2_j(42)=530;
g2_j(43)=872;
g2_j(44)=533;
g2_j(45)=989;
g2_j(46)=881;
g2_j(47)=884;
g2_j(48)=998;
g2_j(49)=921;
g2_j(50)=922;
g2_j(51)=960;
g2_j(52)=961;
g2_j(53)=81;
g2_j(54)=41;
g2_j(55)=443;
g2_j(56)=519;
g2_j(57)=521;
g2_j(58)=430;
g2_j(59)=12;
g2_j(60)=1;
g2_j(61)=57;
g2_j(62)=665;
g2_j(63)=801;
g2_j(64)=201;
g2_j(65)=1001;
g2_j(66)=241;
g2_j(67)=1041;
g2_v(1)=(-(params(1)*(T(10)*(-((-y(33))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13))+T(9)*T(9)*T(23))));
g2_v(2)=(-(params(1)*(T(10)*(-1)/(y(13)*y(13))+T(9)*1/y(13)*T(23))));
g2_v(3)=g2_v(2);
g2_v(4)=(-(params(1)*1/y(13)*1/y(13)*T(23)));
g2_v(5)=T(24);
g2_v(6)=(-1);
g2_v(7)=g2_v(6);
g2_v(8)=(-T(24));
g2_v(9)=y(15)*getPowerDeriv(y(14),params(5),2);
g2_v(10)=T(12);
g2_v(11)=g2_v(10);
g2_v(12)=(-1);
g2_v(13)=g2_v(12);
g2_v(14)=(-1);
g2_v(15)=g2_v(14);
g2_v(16)=(-(y(28)*(-((-(params(11)*y(36)))*(y(34)+y(34))))/(y(34)*y(34)*y(34)*y(34))));
g2_v(17)=(-(y(28)*(-params(11))/(y(34)*y(34))));
g2_v(18)=g2_v(17);
g2_v(19)=(-((-(params(11)*y(36)))/(y(34)*y(34))));
g2_v(20)=g2_v(19);
g2_v(21)=(-(params(11)/y(34)));
g2_v(22)=g2_v(21);
g2_v(23)=(-1);
g2_v(24)=g2_v(23);
g2_v(25)=1;
g2_v(26)=g2_v(25);
g2_v(27)=2*params(11)*0.5;
g2_v(28)=(-1);
g2_v(29)=g2_v(28);
g2_v(30)=(-1);
g2_v(31)=g2_v(30);
g2_v(32)=(-((1+y(19)*params(16)-y(10))*(-((-(y(19)*params(16)-y(10)))*(y(18)+y(18))))/(y(18)*y(18)*y(18)*y(18))/(y(19)*2*params(16))));
g2_v(33)=(-((y(19)*2*params(16)*(params(16)*T(15)+(1+y(19)*params(16)-y(10))*(-params(16))/(y(18)*y(18)))-2*params(16)*(1+y(19)*params(16)-y(10))*T(15))/(y(19)*2*params(16)*y(19)*2*params(16))));
g2_v(34)=g2_v(33);
g2_v(35)=(-(((1+y(19)*params(16)-y(10))*1/(y(18)*y(18))-T(15))/(y(19)*2*params(16))));
g2_v(36)=g2_v(35);
g2_v(37)=(-((y(19)*2*params(16)*y(19)*2*params(16)*y(19)*2*params(16)*(params(16)*params(16)/y(18)+params(16)*params(16)/y(18))-T(16)*(2*params(16)*y(19)*2*params(16)+2*params(16)*y(19)*2*params(16)))/(y(19)*2*params(16)*y(19)*2*params(16)*y(19)*2*params(16)*y(19)*2*params(16))));
g2_v(38)=(-((y(19)*2*params(16)*(params(16)*T(21)-params(16)/y(18))-2*params(16)*T(22))/(y(19)*2*params(16)*y(19)*2*params(16))));
g2_v(39)=g2_v(38);
g2_v(40)=(-(((-T(21))-T(21))/(y(19)*2*params(16))));
g2_v(41)=(-(T(7)*y(26)*getPowerDeriv(y(14),params(2),2)));
g2_v(42)=(-(T(14)*T(17)));
g2_v(43)=g2_v(42);
g2_v(44)=(-(T(7)*T(13)));
g2_v(45)=g2_v(44);
g2_v(46)=(-(T(6)*getPowerDeriv(y(23),1-params(2),2)));
g2_v(47)=(-(T(5)*T(17)));
g2_v(48)=g2_v(47);
g2_v(49)=(-(T(19)*(1-params(8))*getPowerDeriv(y(24),params(9),2)+T(18)*T(18)*T(25)));
g2_v(50)=(-(T(18)*T(20)*T(25)));
g2_v(51)=g2_v(50);
g2_v(52)=(-(T(20)*T(20)*T(25)+T(19)*params(8)*getPowerDeriv(y(25),params(9),2)));
g2_v(53)=(-(getPowerDeriv(y(3),params(7),2)));
g2_v(54)=(-(getPowerDeriv(y(2),params(7),2)));
g2_v(55)=(-((-params(2))/(y(14)*y(14))));
g2_v(56)=g2_v(55);
g2_v(57)=(-((-((-(y(12)*params(2)))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))));
g2_v(58)=(-((-(1-params(2)))/(y(1)*y(1))));
g2_v(59)=g2_v(58);
g2_v(60)=(-((-((-(y(12)*(1-params(2))))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
g2_v(61)=1;
g2_v(62)=g2_v(61);
g2_v(63)=(-(2*params(11)*0.5+2*0.5*params(10)));
g2_v(64)=(-(params(12)*(-1)/(y(6)*y(6))));
g2_v(65)=(-1)/(y(26)*y(26));
g2_v(66)=(-(params(13)*(-1)/(y(7)*y(7))));
g2_v(67)=(-1)/(y(27)*y(27));
g2 = sparse(g2_i,g2_j,g2_v,26,1521);
end
