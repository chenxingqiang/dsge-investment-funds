function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = dsge_investment_funds.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 25
    T = [T; NaN(25 - size(T, 1), 1)];
end
T(23) = getPowerDeriv(y(54)/y(28),(-params(4)),2);
T(24) = getPowerDeriv(y(28),(-params(4)),2);
T(25) = getPowerDeriv(T(8),1/params(9),2);
end
