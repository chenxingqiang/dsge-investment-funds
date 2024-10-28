function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = y(28)^(-params(4));
T(2) = y(29)^params(5);
T(3) = y(41)^2;
T(4) = params(11)*0.5*T(3);
T(5) = y(29)^params(2);
T(6) = y(46)*T(5);
T(7) = y(43)^(1-params(2));
T(8) = params(8)*y(45)^params(9)+(1-params(8))*y(44)^params(9);
end
