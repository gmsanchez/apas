%% Guia 5, Ejercicio 4
% Pruebe el desempe�o de los algoritmos de MP y BP implementados en los 
% ejercicios anteriores utilizando se�ales aleatorias generadas mediante la 
% funci�n del Ejercicio N� 1. Para ello genere 1000 se�ales a partir de 
% vectores de coeficientes aleatorios con l0(a) en el rango [1, 10] y 
% ? ? R30�50 tambi�n aleatorio. Luego aplique ambos m�todos a cada se�al 
% generada y grafique el error cuadr�tico medio de la reconstrucci�n de 
% x a partir de ?�, con cada uno de los m�todos en funci�n de l0(a).

clear all
close all

realizations = 1000;
N = 30;
M = 50;

% Phi aleatorio
phi = normc(randn(N,M));
% Genero el vector a
a = zeros(M,realizations);
for r=1:realizations
    a(:,r) = get_a(M,l0,'col');
end
% Genero el vector x
x = phi*a;
