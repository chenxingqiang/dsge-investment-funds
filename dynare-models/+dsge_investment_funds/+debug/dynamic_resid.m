function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(8, 1);
lhs = NaN(26, 1);
rhs = NaN(26, 1);
T(1) = y(28)^(-params(4));
T(2) = y(29)^params(5);
T(3) = y(41)^2;
T(4) = params(11)*0.5*T(3);
T(5) = y(29)^params(2);
T(6) = y(46)*T(5);
T(7) = y(43)^(1-params(2));
T(8) = params(8)*y(45)^params(9)+(1-params(8))*y(44)^params(9);
lhs(1) = y(48);
rhs(1) = params(1)*(y(54)/y(28))^(-params(4));
lhs(2) = T(1);
rhs(2) = y(48)*(1+y(31));
lhs(3) = y(30)*T(2);
rhs(3) = T(1);
lhs(4) = y(38);
rhs(4) = y(48)*(y(64)+y(68));
lhs(5) = 1;
rhs(5) = y(48)*(1+y(49)+params(11)*y(67)/y(63));
lhs(6) = y(42);
rhs(6) = y(24)-y(10)*y(37)-y(14)+(1+y(23))*y(25)-T(4);
lhs(7) = y(38);
rhs(7) = y(14)+y(10)*y(37);
lhs(8) = y(41);
rhs(8) = (y(38)*params(16)-y(25))/y(37)*(1+y(38)*params(16)-y(25))/(y(38)*2*params(16));
lhs(9) = y(27);
rhs(9) = T(6)*T(7);
lhs(10) = y(43);
rhs(10) = T(8)^(1/params(9));
lhs(11) = y(45);
rhs(11) = y(9)^params(7);
lhs(12) = y(44);
rhs(12) = y(8)^params(7);
lhs(13) = y(30);
rhs(13) = y(27)*params(2)/y(29);
lhs(14) = y(31);
rhs(14) = y(27)*(1-params(2))/y(7)-params(3);
lhs(15) = y(7);
rhs(15) = y(32)+(1-params(3))*y(26);
lhs(16) = y(7);
rhs(16) = y(9)+y(8);
lhs(17) = y(37)*y(8);
rhs(17) = y(10);
lhs(18) = y(9);
rhs(18) = y(14)+y(39);
lhs(19) = y(27);
rhs(19) = T(4)+y(28)+y(32)+T(3)*0.5*params(10);
lhs(20) = y(37);
rhs(20) = 1-y(41)*params(10);
lhs(21) = log(y(46));
rhs(21) = params(12)*log(y(20))+params(14)*x(1);
lhs(22) = log(y(47));
rhs(22) = params(13)*log(y(21))+params(15)*x(2);
lhs(23) = y(49);
rhs(23) = y(31);
lhs(24) = y(50);
rhs(24) = y(10);
lhs(25) = y(51);
rhs(25) = y(14);
lhs(26) = y(52);
rhs(26) = y(7);
end
