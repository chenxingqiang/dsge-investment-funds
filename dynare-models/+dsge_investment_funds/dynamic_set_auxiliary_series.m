function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_ENDO_LAG_25_1=ds.B(-1);
ds.AUX_ENDO_LAG_29_1=ds.D_if(-1);
ds.AUX_ENDO_LAG_22_1=ds.K(-1);
end
