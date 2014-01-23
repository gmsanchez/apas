function [ a ] = my_mod_scs( x,phi,k0 )

if nargin<3
    k0 = 50;
end
% Inicializo a
a = phi'*x;
%k0 = 2;

options = optimoptions('fmincon','Algorithm','active-set');%,'Display','none');
norm2par=@(a)norm2(x,phi,a);
norm0par=@(a)norm0(a,k0);
a = fmincon(norm2par,a,phi,x,[],[],[],[],norm0par,options);
    

function [c,ceq] = norm0(x,k0,tol)
    if nargin<3
        tol = 1e-12;
    end
    c = length(find(abs(x)>tol))-k0;
    ceq = 0;
end

function [f] = norm2(x,phi,a)
    f = norm(x-phi*a,2).^2;
end

end

