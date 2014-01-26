%% Guia 5, Ejercicio 6
% Utilice el algoritmo MOD desarrollado en el ejercicio anterior para 
% estimar los diccionarios utilizados a partir de los datos artificiales 
% generados en el Ejercicio N� 4. Grafique el error cuadr�tico medio en la 
% estimaci�n de  ??, utilizando BP y MP para el c�lculo de los 
% coeficientes, en funci�n de l0(a).

clear all
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
