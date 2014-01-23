%% Guia 5, Ejercicio 5
%

%clear all
close all

l0 = 2;
nl0 = length(l0);

% Base canónica
N = 20;
M = 20;
% phi = eye(N,M);
phi = normc(real(dftmtx(N)));
realizations = 1000;
a = zeros(M,realizations);

for r=1:realizations
    a(:,r) = get_a(M,l0,'col');
end

x = phi*a;


%%
[phi_hat,a_hat] = my_mod(x,M,l0);

norm(x-phi_hat*a,'fro')

%%
k = 1;
close all
plot(x(:,k),'r-o'); hold on; plot(phi_hat*a_hat(:,k),'b-+');
