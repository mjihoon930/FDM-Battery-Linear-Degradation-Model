function [Y] = output_C_50(in)

persistent n c

t=in(1);


if t==0
    
    c = evalin('base','c');
    n = evalin('base','n');
end

N=50;
dr_n = n.R_n/N;

for i=N-1
    C(1,i)=0;
    if i==N-1
        C(1,i)=1;
    end
end

u=in(2);
alpha = in(3);
beta = in(4);
J_bar = in(5);
c_s_n = in(6:54);

Y(1) = C*c_s_n*(1/(1-(dr_n*alpha/(n.D_n*n.a_n*c.F)))) + dr_n*((beta-(1/(n.A_n*n.L_n)))/((n.D_n*n.a_n*c.F)-dr_n*alpha))*u + dr_n*((J_bar-alpha*c.c_bar-beta*c.u_bar)/((n.D_n*n.a_n*c.F)-dr_n*alpha));
end