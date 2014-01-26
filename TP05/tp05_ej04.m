%% Guia 5, Ejercicio 4
% Pruebe el desempeño de los algoritmos de MP y BP implementados en los 
% ejercicios anteriores utilizando señales aleatorias generadas mediante la 
% función del Ejercicio N° 1. Para ello genere 1000 señales a partir de 
% vectores de coeficientes aleatorios con l0(a) en el rango [1, 10] y 
% ? ? R30×50 también aleatorio. Luego aplique ambos métodos a cada señal 
% generada y grafique el error cuadrático medio de la reconstrucción de 
% x a partir de ?â, con cada uno de los métodos en función de l0(a).

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
