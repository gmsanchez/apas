function [ phi,a ] = my_mod( x,M )

% Si no pasamos el numero de atomos, lo hacemos cuadrado.
if nargin<2
    M = length(x);
end

% Tolerancia para la optimizacion
tol0 = 1e-12;
% Supone que x son vectores columna. Cada columna es una realizacion.
N = size(x,1);
realizations = size(x,2);

% Inicializo y normalizo Phi.
% phi = normc(randn(N,M));
phi = x(:,randperm(realizations,M))
pause
% Inicializo a
a = phi'*x;
% Error inicial
err0 = Inf;
err1 = norm(x-phi*a,'fro')^2;

k = 0;
% Sparse coding stage

%options = optimoptions('fmincon','Algorithm','active-set','Display','none');

while abs(err0-err1)>tol0

for r=1:realizations
    a(:,r)=my_mod_scs(x(:,r),phi);
end

% figure(1); imagesc(a); drawnow;
phi = x*a'*inv(a*a')
% 
err0 = err1;
err1 = norm(x-phi*a,'fro')^2;
k = k+1;
% 
% figure(2); imagesc(phi); drawnow;
fprintf('Iteracion %d, error %.20f\n',k,err0-err1);
pause(2)
end

% function [c,ceq] = norm0(x,k0,tol)
%     if nargin<3
%         tol = 1e-12;
%     end
%     c = length(find(abs(x)>tol))-k0;
%     ceq = 0;
% end
% 
% function [f] = norm2(x,phi,a)
%     f = norm(x-phi*a,2).^2;
% end

end

