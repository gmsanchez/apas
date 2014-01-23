%% Guia 5, Ejercicio 5
%

%clear all
close all

l0 = 2;
nl0 = length(l0);

% Base canónica
N = 5;
M = 5;
phi = eye(N,M);
phi = normc(real(dftmtx(N)));
realizations = 2000;
a = zeros(M,realizations);

for r=1:realizations
    a(:,r) = get_a(M,l0,'col');
end

x = phi*a;

break
%%
[phi_hat,a_hat] = my_mod(x,M);