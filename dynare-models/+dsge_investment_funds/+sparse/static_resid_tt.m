function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = y(2)^(-params(4));
T(2) = y(3)^params(5);
T(3) = y(15)^2;
T(4) = params(11)*0.5*T(3);
T(5) = y(3)^params(2);
T(6) = y(20)*T(5);
T(7) = y(17)^(1-params(2));
T(8) = params(8)*y(19)^params(9)+(1-params(8))*y(18)^params(9);
end
