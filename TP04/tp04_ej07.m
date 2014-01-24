%% Guia 4, Ejercicio 7
%
close all;
clear all;

N = 2^7;
c = zeros(N,1);
c(2) = 1;
% Supongo descomposición TODD completa de nivel 5
t = ntree(2,5);
% Filtros de Haar
[Lo_D,Hi_D,Lo_R,Hi_R] = haar(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y)

% Filtros DB2
[Lo_D,Hi_D,Lo_R,Hi_R] = db4(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y)