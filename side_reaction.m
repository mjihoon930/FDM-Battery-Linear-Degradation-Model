function J_s = side_reaction(in)

persistent  c

t = in(1);

if t==0  

    c = evalin('base','c');

end

u = in(2);
c_n = in(3);
alpha = in(4);
beta = in(5);
J_bar = in(6);

J_s = J_bar + alpha*(c_n-c.c_bar) + beta*(u-c.u_bar);
end