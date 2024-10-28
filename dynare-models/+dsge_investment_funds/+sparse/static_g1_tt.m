function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = dsge_investment_funds.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(9) = getPowerDeriv(y(2),(-params(4)),1);
T(10) = getPowerDeriv(T(8),1/params(9),1);
end
