clear all
close all
clc

t = [0 5 10];
u = [0 0 0];

%Parameter
%Negative
n.R_n = 3.5*10^(-4); 
n.D_n = 5.29*10^(-11);
n.L_n = 3.4*10^-3;
n.A_n = 1818; 
n.e_n = 0.55;
n.a_n = 3*n.e_n/n.R_n; 
n.c_max_n = 31.07*10^(-3);
n.theta_0n = 0;
n.theta_100n = 0.8;
n.R_film_n = 0.001;
n.alpha_n = 0.5;

c.F = 96487; 
c.T_ref = 298.15;
c.T_inf = 298.15;
c.R_c = 0;
c.R_u = 8.314;
c.c_e = 1.2*10^(-3);
c.k_ref_p = 1.0614*10^(-4);
c.k_ref_n = 0.079;
c.E_a_p = 25*10^(3);
c.E_a_n = 40*10^(3);
c.c_bar = n.c_max_n*0.5;
c.u_bar = 0;

d.K_p = 0.0575;
d.R_sei = 0.001;
d.M_p = 0.162;
d.rho_p = 1690*10^(-6);
d.i_o_s = 3.9*10^-12;
d.U_ref_s = 0.4;


%initial state
C_avg_n = 0.5*n.c_max_n;

initial_50_n = repmat(C_avg_n, 1, 49);

t_final = 10;

sim('FDM_Degradation_oglm.slx',t_final)

save LM_0.mat 
