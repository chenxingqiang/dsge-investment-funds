function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = dsge_investment_funds.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 22
    T = [T; NaN(22 - size(T, 1), 1)];
end
T(9) = (-y(54))/(y(28)*y(28));
T(10) = getPowerDeriv(y(54)/y(28),(-params(4)),1);
T(11) = getPowerDeriv(y(28),(-params(4)),1);
T(12) = getPowerDeriv(y(29),params(5),1);
T(13) = getPowerDeriv(y(29),params(2),1);
T(14) = y(46)*T(13);
T(15) = (-(y(38)*params(16)-y(25)))/(y(37)*y(37));
T(16) = y(38)*2*params(16)*((1+y(38)*params(16)-y(25))*params(16)/y(37)+params(16)*(y(38)*params(16)-y(25))/y(37))-2*params(16)*(y(38)*params(16)-y(25))/y(37)*(1+y(38)*params(16)-y(25));
T(17) = getPowerDeriv(y(43),1-params(2),1);
T(18) = (1-params(8))*getPowerDeriv(y(44),params(9),1);
T(19) = getPowerDeriv(T(8),1/params(9),1);
T(20) = params(8)*getPowerDeriv(y(45),params(9),1);
T(21) = (-1)/y(37);
T(22) = (1+y(38)*params(16)-y(25))*T(21)-(y(38)*params(16)-y(25))/y(37);
end
