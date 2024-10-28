%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'dsge_investment_funds';
M_.dynare_version = '6.2';
oo_.dynare_version = '6.2';
options_.dynare_version = '6.2';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eps_a'};
M_.exo_names_tex(1) = {'eps\_a'};
M_.exo_names_long(1) = {'eps_a'};
M_.exo_names(2) = {'eps_d'};
M_.exo_names_tex(2) = {'eps\_d'};
M_.exo_names_long(2) = {'eps_d'};
M_.endo_names = cell(26,1);
M_.endo_names_tex = cell(26,1);
M_.endo_names_long = cell(26,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'Y'};
M_.endo_names_long(1) = {'Y'};
M_.endo_names(2) = {'C'};
M_.endo_names_tex(2) = {'C'};
M_.endo_names_long(2) = {'C'};
M_.endo_names(3) = {'N'};
M_.endo_names_tex(3) = {'N'};
M_.endo_names_long(3) = {'N'};
M_.endo_names(4) = {'W'};
M_.endo_names_tex(4) = {'W'};
M_.endo_names_long(4) = {'W'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'R'};
M_.endo_names(6) = {'I'};
M_.endo_names_tex(6) = {'I'};
M_.endo_names_long(6) = {'I'};
M_.endo_names(7) = {'K'};
M_.endo_names_tex(7) = {'K'};
M_.endo_names_long(7) = {'K'};
M_.endo_names(8) = {'K_b'};
M_.endo_names_tex(8) = {'K\_b'};
M_.endo_names_long(8) = {'K_b'};
M_.endo_names(9) = {'K_l'};
M_.endo_names_tex(9) = {'K\_l'};
M_.endo_names_long(9) = {'K_l'};
M_.endo_names(10) = {'B'};
M_.endo_names_tex(10) = {'B'};
M_.endo_names_long(10) = {'B'};
M_.endo_names(11) = {'Q_b'};
M_.endo_names_tex(11) = {'Q\_b'};
M_.endo_names_long(11) = {'Q_b'};
M_.endo_names(12) = {'Q_s'};
M_.endo_names_tex(12) = {'Q\_s'};
M_.endo_names_long(12) = {'Q_s'};
M_.endo_names(13) = {'D_hh'};
M_.endo_names_tex(13) = {'D\_hh'};
M_.endo_names_long(13) = {'D_hh'};
M_.endo_names(14) = {'D_if'};
M_.endo_names_tex(14) = {'D\_if'};
M_.endo_names_long(14) = {'D_if'};
M_.endo_names(15) = {'B_sales'};
M_.endo_names_tex(15) = {'B\_sales'};
M_.endo_names_long(15) = {'B_sales'};
M_.endo_names(16) = {'DIV_if'};
M_.endo_names_tex(16) = {'DIV\_if'};
M_.endo_names_long(16) = {'DIV_if'};
M_.endo_names(17) = {'Z'};
M_.endo_names_tex(17) = {'Z'};
M_.endo_names_long(17) = {'Z'};
M_.endo_names(18) = {'Z_b'};
M_.endo_names_tex(18) = {'Z\_b'};
M_.endo_names_long(18) = {'Z_b'};
M_.endo_names(19) = {'Z_l'};
M_.endo_names_tex(19) = {'Z\_l'};
M_.endo_names_long(19) = {'Z_l'};
M_.endo_names(20) = {'A'};
M_.endo_names_tex(20) = {'A'};
M_.endo_names_long(20) = {'A'};
M_.endo_names(21) = {'delta_d'};
M_.endo_names_tex(21) = {'delta\_d'};
M_.endo_names_long(21) = {'delta_d'};
M_.endo_names(22) = {'Lambda'};
M_.endo_names_tex(22) = {'Lambda'};
M_.endo_names_long(22) = {'Lambda'};
M_.endo_names(23) = {'i_d'};
M_.endo_names_tex(23) = {'i\_d'};
M_.endo_names_long(23) = {'i_d'};
M_.endo_names(24) = {'AUX_ENDO_LAG_25_1'};
M_.endo_names_tex(24) = {'AUX\_ENDO\_LAG\_25\_1'};
M_.endo_names_long(24) = {'AUX_ENDO_LAG_25_1'};
M_.endo_names(25) = {'AUX_ENDO_LAG_29_1'};
M_.endo_names_tex(25) = {'AUX\_ENDO\_LAG\_29\_1'};
M_.endo_names_long(25) = {'AUX_ENDO_LAG_29_1'};
M_.endo_names(26) = {'AUX_ENDO_LAG_22_1'};
M_.endo_names_tex(26) = {'AUX\_ENDO\_LAG\_22\_1'};
M_.endo_names_long(26) = {'AUX_ENDO_LAG_22_1'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'alpha'};
M_.param_names_tex(2) = {'alpha'};
M_.param_names_long(2) = {'alpha'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'sigma'};
M_.param_names_tex(4) = {'sigma'};
M_.param_names_long(4) = {'sigma'};
M_.param_names(5) = {'sigma_n'};
M_.param_names_tex(5) = {'sigma\_n'};
M_.param_names_long(5) = {'sigma_n'};
M_.param_names(6) = {'sigma_d'};
M_.param_names_tex(6) = {'sigma\_d'};
M_.param_names_long(6) = {'sigma_d'};
M_.param_names(7) = {'gamma'};
M_.param_names_tex(7) = {'gamma'};
M_.param_names_long(7) = {'gamma'};
M_.param_names(8) = {'v'};
M_.param_names_tex(8) = {'v'};
M_.param_names_long(8) = {'v'};
M_.param_names(9) = {'epsilon'};
M_.param_names_tex(9) = {'epsilon'};
M_.param_names_long(9) = {'epsilon'};
M_.param_names(10) = {'kappa_hh'};
M_.param_names_tex(10) = {'kappa\_hh'};
M_.param_names_long(10) = {'kappa_hh'};
M_.param_names(11) = {'kappa_if'};
M_.param_names_tex(11) = {'kappa\_if'};
M_.param_names_long(11) = {'kappa_if'};
M_.param_names(12) = {'rho_a'};
M_.param_names_tex(12) = {'rho\_a'};
M_.param_names_long(12) = {'rho_a'};
M_.param_names(13) = {'rho_d'};
M_.param_names_tex(13) = {'rho\_d'};
M_.param_names_long(13) = {'rho_d'};
M_.param_names(14) = {'sig_a'};
M_.param_names_tex(14) = {'sig\_a'};
M_.param_names_long(14) = {'sig_a'};
M_.param_names(15) = {'sig_d'};
M_.param_names_tex(15) = {'sig\_d'};
M_.param_names_long(15) = {'sig_d'};
M_.param_names(16) = {'phi'};
M_.param_names_tex(16) = {'phi'};
M_.param_names_long(16) = {'phi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 26;
M_.param_nbr = 16;
M_.orig_endo_nbr = 23;
M_.aux_vars(1).endo_index = 24;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 10;
M_.aux_vars(1).orig_lead_lag = -1;
M_.aux_vars(1).orig_expr = 'B(-1)';
M_.aux_vars(2).endo_index = 25;
M_.aux_vars(2).type = 1;
M_.aux_vars(2).orig_index = 14;
M_.aux_vars(2).orig_lead_lag = -1;
M_.aux_vars(2).orig_expr = 'D_if(-1)';
M_.aux_vars(3).endo_index = 26;
M_.aux_vars(3).type = 1;
M_.aux_vars(3).orig_index = 7;
M_.aux_vars(3).orig_lead_lag = -1;
M_.aux_vars(3).orig_expr = 'K(-1)';
M_.predetermined_variables = [ 7 8 9 10 14 ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 17 19 21 22];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 26;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 2;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 2;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 2;
M_.lead_lag_incidence = [
 0 12 0;
 0 13 33;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 1 0 0;
 2 0 0;
 3 0 0;
 4 0 0;
 0 18 34;
 0 19 35;
 0 20 0;
 5 0 0;
 0 21 36;
 0 22 37;
 0 23 0;
 0 24 0;
 0 25 0;
 6 26 0;
 7 27 0;
 0 28 0;
 8 29 0;
 9 30 0;
 10 31 0;
 11 32 0;]';
M_.nstatic = 10;
M_.nfwrd   = 5;
M_.npred   = 11;
M_.nboth   = 0;
M_.nsfwrd   = 5;
M_.nspred   = 11;
M_.ndynamic   = 16;
M_.dynamic_tmp_nbr = [8; 14; 3; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Lambda' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'Q_s' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'DIV_if' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'B_sales' ;
  9 , 'name' , 'Y' ;
  10 , 'name' , 'Z' ;
  11 , 'name' , 'Z_l' ;
  12 , 'name' , 'Z_b' ;
  13 , 'name' , 'W' ;
  14 , 'name' , 'R' ;
  15 , 'name' , 'K' ;
  16 , 'name' , '16' ;
  17 , 'name' , '17' ;
  18 , 'name' , 'K_l' ;
  19 , 'name' , '19' ;
  20 , 'name' , 'Q_b' ;
  21 , 'name' , '21' ;
  22 , 'name' , '22' ;
  23 , 'name' , 'i_d' ;
};
M_.mapping.Y.eqidx = [9 13 14 19 ];
M_.mapping.C.eqidx = [1 2 3 19 ];
M_.mapping.N.eqidx = [3 9 13 ];
M_.mapping.W.eqidx = [3 13 ];
M_.mapping.R.eqidx = [2 14 23 ];
M_.mapping.I.eqidx = [15 19 ];
M_.mapping.K.eqidx = [14 15 16 ];
M_.mapping.K_b.eqidx = [12 16 17 ];
M_.mapping.K_l.eqidx = [11 16 18 ];
M_.mapping.B.eqidx = [6 7 17 ];
M_.mapping.Q_b.eqidx = [5 6 7 8 17 20 ];
M_.mapping.Q_s.eqidx = [4 7 8 ];
M_.mapping.D_hh.eqidx = [18 ];
M_.mapping.D_if.eqidx = [6 7 8 18 ];
M_.mapping.B_sales.eqidx = [5 6 8 19 20 ];
M_.mapping.DIV_if.eqidx = [4 6 ];
M_.mapping.Z.eqidx = [9 10 ];
M_.mapping.Z_b.eqidx = [10 12 ];
M_.mapping.Z_l.eqidx = [10 11 ];
M_.mapping.A.eqidx = [9 21 ];
M_.mapping.delta_d.eqidx = [22 ];
M_.mapping.Lambda.eqidx = [1 2 4 5 ];
M_.mapping.i_d.eqidx = [5 6 23 ];
M_.mapping.eps_a.eqidx = [21 ];
M_.mapping.eps_d.eqidx = [22 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [7 8 9 10 14 20 21 23 24 25 26 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(26, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(26, 1), 'log_deflator', cell(26, 1), 'growth_factor', cell(26, 1), 'log_growth_factor', cell(26, 1));
M_.NNZDerivatives = [82; 67; -1; ];
M_.dynamic_g1_sparse_rowval = int32([14 15 16 26 12 16 17 11 16 18 6 7 17 24 6 7 18 25 21 22 6 6 6 8 15 9 13 14 19 1 2 3 19 3 9 13 3 13 2 14 23 15 19 6 7 8 17 20 4 7 8 18 6 8 19 20 6 9 10 10 12 10 11 9 21 22 1 2 4 5 5 23 24 25 26 1 5 4 5 4 21 22 ]);
M_.dynamic_g1_sparse_colval = int32([7 7 7 7 8 8 8 9 9 9 10 10 10 10 14 14 14 14 20 21 23 24 25 25 26 27 27 27 27 28 28 28 28 29 29 29 30 30 31 31 31 32 32 37 37 37 37 37 38 38 38 39 41 41 41 41 42 43 43 44 44 45 45 46 46 47 48 48 48 48 49 49 50 51 52 54 63 64 67 68 79 80 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 1 1 5 8 11 15 15 15 15 19 19 19 19 19 19 20 21 21 22 23 25 26 30 34 37 39 42 44 44 44 44 44 49 52 53 53 57 58 60 62 64 66 67 71 73 74 75 76 76 77 77 77 77 77 77 77 77 77 78 79 79 79 80 81 81 81 81 81 81 81 81 81 81 81 82 83 ]);
M_.dynamic_g2_sparse_indices = int32([1 28 28 ;
1 28 54 ;
1 54 54 ;
2 28 28 ;
2 31 48 ;
3 28 28 ;
3 29 29 ;
3 29 30 ;
4 64 48 ;
4 68 48 ;
5 63 63 ;
5 63 67 ;
5 63 48 ;
5 67 48 ;
5 48 49 ;
6 10 37 ;
6 41 41 ;
6 23 25 ;
7 10 37 ;
8 37 37 ;
8 37 38 ;
8 37 25 ;
8 38 38 ;
8 38 25 ;
8 25 25 ;
9 29 29 ;
9 29 43 ;
9 29 46 ;
9 43 43 ;
9 43 46 ;
10 44 44 ;
10 44 45 ;
10 45 45 ;
11 9 9 ;
12 8 8 ;
13 27 29 ;
13 29 29 ;
14 27 7 ;
14 7 7 ;
17 8 37 ;
19 41 41 ;
21 20 20 ;
21 46 46 ;
22 21 21 ;
22 47 47 ;
]);
M_.lhs = {
'Lambda'; 
'C^(-sigma)'; 
'W*N^sigma_n'; 
'Q_s'; 
'1'; 
'DIV_if'; 
'Q_s'; 
'B_sales'; 
'Y'; 
'Z'; 
'Z_l'; 
'Z_b'; 
'W'; 
'R'; 
'K(-1)'; 
'K(-1)'; 
'Q_b*K_b(-1)'; 
'K_l(-1)'; 
'Y'; 
'Q_b'; 
'log(A)'; 
'log(delta_d)'; 
'i_d'; 
'AUX_ENDO_LAG_25_1'; 
'AUX_ENDO_LAG_29_1'; 
'AUX_ENDO_LAG_22_1'; 
};
M_.static_tmp_nbr = [8; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 1;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 1];
M_.block_structure_stat.block(1).variable = [ 22];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 21];
M_.block_structure_stat.block(2).variable = [ 20];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 22];
M_.block_structure_stat.block(3).variable = [ 21];
M_.block_structure_stat.block(4).Simulation_Type = 6;
M_.block_structure_stat.block(4).endo_nbr = 22;
M_.block_structure_stat.block(4).mfs = 22;
M_.block_structure_stat.block(4).equation = [ 4 5 6 7 8 9 10 11 12 13 14 15 16 17 26 19 20 2 3 23 24 25];
M_.block_structure_stat.block(4).variable = [ 16 23 14 12 15 17 19 9 18 4 1 26 8 10 7 6 11 2 3 5 24 25];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 18];
M_.block_structure_stat.block(5).variable = [ 13];
M_.block_structure_stat.variable_reordered = [ 22 20 21 16 23 14 12 15 17 19 9 18 4 1 26 8 10 7 6 11 2 3 5 24 25 13];
M_.block_structure_stat.equation_reordered = [ 1 21 22 4 5 6 7 8 9 10 11 12 13 14 15 16 17 26 19 20 2 3 23 24 25 18];
M_.block_structure_stat.incidence.sparse_IM = [
 1 22;
 2 2;
 2 5;
 2 22;
 3 2;
 3 3;
 3 4;
 4 12;
 4 16;
 4 22;
 5 11;
 5 15;
 5 22;
 5 23;
 6 10;
 6 11;
 6 14;
 6 15;
 6 16;
 6 23;
 6 24;
 6 25;
 7 10;
 7 11;
 7 12;
 7 14;
 8 11;
 8 12;
 8 15;
 8 25;
 9 1;
 9 3;
 9 17;
 9 20;
 10 17;
 10 18;
 10 19;
 11 9;
 11 19;
 12 8;
 12 18;
 13 1;
 13 3;
 13 4;
 14 1;
 14 5;
 14 7;
 15 6;
 15 7;
 15 26;
 16 7;
 16 8;
 16 9;
 17 8;
 17 10;
 17 11;
 18 9;
 18 13;
 18 14;
 19 1;
 19 2;
 19 6;
 19 15;
 20 11;
 20 15;
 21 20;
 22 21;
 23 5;
 23 23;
 24 10;
 24 24;
 25 14;
 25 25;
 26 7;
 26 26;
];
M_.block_structure_stat.tmp_nbr = 11;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 3 2 3 20 3 4 22 1 4 5 2 3 5 16 17 6 7 7 8 8 13 7 9 10 19 6 10 11 16 12 15 9 13 14 3 4 14 21 11 12 13 15 12 16 2 3 4 5 14 17 16 18 19 6 10 19 11 18 20 3 21 3 5 22 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 1 2 2 2 3 3 3 4 4 4 5 5 5 5 5 6 6 7 7 8 8 9 9 10 10 11 11 11 11 12 12 13 13 13 14 14 14 14 15 15 15 15 16 16 17 17 17 17 17 17 18 18 18 19 19 19 20 20 20 21 21 22 22 22 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 3 6 9 12 17 19 21 23 25 27 31 33 36 40 44 46 52 55 58 61 63 66 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([9 13 14 19 2 3 19 3 9 13 3 13 2 14 23 15 19 14 15 16 26 12 16 17 11 16 18 6 7 17 24 5 6 7 8 17 20 4 7 8 18 6 7 18 25 5 6 8 19 20 4 6 9 10 10 12 10 11 9 21 22 1 2 4 5 5 6 23 6 24 6 8 25 15 26 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 2 2 2 3 3 3 4 4 5 5 5 6 6 7 7 7 7 8 8 8 9 9 9 10 10 10 10 11 11 11 11 11 11 12 12 12 13 14 14 14 14 15 15 15 15 15 16 16 17 17 18 18 19 19 20 20 21 22 22 22 22 23 23 23 24 24 25 25 25 26 26 ]);
M_.static_g1_sparse_colptr = int32([1 5 8 11 13 16 18 22 25 28 32 38 41 42 46 51 53 55 57 59 61 62 66 69 71 74 76 ]);
M_.params(1) = 0.994;
beta = M_.params(1);
M_.params(2) = 0.67;
alpha = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 1;
sigma = M_.params(4);
M_.params(5) = 3;
sigma_n = M_.params(5);
M_.params(6) = 1;
sigma_d = M_.params(6);
M_.params(7) = 0.627;
gamma = M_.params(7);
M_.params(8) = 0.678;
v = M_.params(8);
M_.params(9) = 0.499;
epsilon = M_.params(9);
M_.params(10) = 0.005;
kappa_hh = M_.params(10);
M_.params(11) = 0.005;
kappa_if = M_.params(11);
M_.params(12) = 0.96;
rho_a = M_.params(12);
M_.params(13) = 0.60;
rho_d = M_.params(13);
M_.params(14) = 0.0054;
sig_a = M_.params(14);
M_.params(15) = 0.001;
sig_d = M_.params(15);
M_.params(16) = 0.5;
phi = M_.params(16);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(20) = 1;
oo_.steady_state(21) = 1;
oo_.steady_state(1) = 1;
oo_.steady_state(2) = 0.7;
oo_.steady_state(3) = 0.33;
oo_.steady_state(7) = 5;
oo_.steady_state(6) = M_.params(3)*oo_.steady_state(7);
oo_.steady_state(8) = 0.5;
oo_.steady_state(9) = oo_.steady_state(7)-oo_.steady_state(8);
oo_.steady_state(10) = oo_.steady_state(8);
oo_.steady_state(11) = 0.99;
oo_.steady_state(14) = 0.05;
oo_.steady_state(13) = oo_.steady_state(9)-oo_.steady_state(14);
oo_.steady_state(12) = oo_.steady_state(14)+oo_.steady_state(11)*oo_.steady_state(10);
oo_.steady_state(15) = 0.02;
oo_.steady_state(16) = 0.02;
oo_.steady_state(4) = M_.params(2)*oo_.steady_state(1)/oo_.steady_state(3);
oo_.steady_state(5) = oo_.steady_state(1)*(1-M_.params(2))/oo_.steady_state(7)-M_.params(3);
oo_.steady_state(19) = oo_.steady_state(9)^M_.params(7);
oo_.steady_state(18) = oo_.steady_state(8)^M_.params(7);
oo_.steady_state(17) = (M_.params(8)*oo_.steady_state(19)^M_.params(9)+(1-M_.params(8))*oo_.steady_state(18)^M_.params(9))^(1/M_.params(9));
oo_.steady_state(22) = M_.params(1);
oo_.steady_state(23) = oo_.steady_state(5);
oo_.steady_state(24)=oo_.steady_state(10);
oo_.steady_state(25)=oo_.steady_state(14);
oo_.steady_state(26)=oo_.steady_state(7);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.drop = 1000;
options_.hp_filter = 1600;
options_.irf = 40;
options_.irf_shocks = {'eps_a';'eps_d'};
options_.order = 2;
options_.periods = 10000;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dsge_investment_funds_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
