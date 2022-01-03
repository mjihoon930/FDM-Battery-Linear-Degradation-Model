function out =state_eqns_fdm_50(in)

persistent n  c

t=in(1);

if t==0
    
    c = evalin('base','c');
    n = evalin('base','n');
end

u = in(2);
alpha = in(3);
beta = in(4);
J_bar = in(5);

N = 50;
dr = n.R_n/N;

A = matrix_A_n(50);
%B = matrix_B_n(50);

C_n=in(6:end);

C = A*C_n;

C(end) = n.D_n*((dr*(N-1)-dr)*C_n(end-1))/(dr*(N-1)*dr^2) + (n.D_n/(dr*(N-1)*dr^2))*(-2*dr*(N-1) + (dr*(N-1)+dr)*(1/(1-(dr*alpha/(n.a_n*n.D_n*c.F)))))*C_n(end) + ((n.D_n*(dr*(N-1)+dr))/(dr*(N-1)*dr*(n.D_n*n.a_n*c.F-dr*alpha)))*((-1/(n.A_n*n.L_n))+beta)*u + ((n.D_n*(dr*(N-1)+dr))/(dr*(N-1)*dr))*(-1/(n.D_n*n.a_n*c.F-dr*alpha))*(-J_bar+alpha*c.c_bar+beta*c.u_bar);

out = C;
end


