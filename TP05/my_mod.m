function [ phi,a ] = my_mod( x,M )

%
tol0 = 1e-12;
% Supone que x son vectores columna. Cada columna es una realizacion.
N = size(x,1);
realizations = size(x,2);
% Si no pasamos el tamaño del diccionario, lo hacemos cuadrado.
if nargin<2
    M = length(x);
end

% Inicializo y normalizo Phi.
phi = normc(randn(N,M));
% Inicializo a
a = phi'*x;
% Error inicial
err0 = Inf;
err1 = norm(x-phi*a,'fro')^2;

k = 0;
% Sparse coding stage

options = optimoptions('fmincon','Algorithm','active-set','Display','none');

while (err0-err1)>tol0

for r=1:realizations
    %a(:,r) = my_bp(x(:,r),phi);
    
    norm2par=@(a)norm2(x(:,r),phi,a);
    %norm0par=@(a)norm0(a)
    a(:,r) = fmincon(norm2par,a(:,r),phi,x(:,r),[],[],[],[],@norm0,options);
end

figure(1); imagesc(a); drawnow;
phi = x*a'*inv(a*a');

err0 = err1;
err1 = norm(x-phi*a,'fro')^2;
k = k+1;

figure(2); imagesc(phi); drawnow;
fprintf('Iteracion %d, error %.20f\n',k,err0-err1);
end

function [c,ceq] = norm0(x)
    tol = 1e-12;
    c = length(find(abs(x)>tol))-5;
    ceq = 0;
end

function [f] = norm2(x,phi,a)
    f = norm(x-phi*a,2).^2;
end

end

