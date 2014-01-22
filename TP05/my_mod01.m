function [ phi, a ] = my_mod01( x,M )
%MY_MOD01 Summary of this function goes here
%   Detailed explanation goes here
N = size(x,1);
if nargin<2
    M = size(x,1);
end
realizations = size(x,2);

phi = normc(x(:,randperm(realizations,M)))
pause

% Fijo Phi, minimizo a
a = phi'*x;

err0 = Inf;
err1 = normfro(x,phi,a);

while (err0-err1)>1e-12

    for k=1:realizations
        x(:,k)
        a(:,k)
        %a(:,k) = my_lbp(x(:,k),phi);
    end
%normfroparm=@(a)normfro(x,phi,a);
%a = fmincon(normfroparm,a);

%normfroparm=@(phi)normfro(x,phi,a);
phi = normc(x*a'*inv(a*a'))
pause(2) %fminunc(normfroparm,phi)

err0 = err1;
err1 = normfro(x,phi,a);
end

    function [f] = normfro(x,phi,a)
        f = norm(x-phi*a,'fro')^2;
    end
end

