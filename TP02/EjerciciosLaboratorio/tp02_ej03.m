%% Guia 2 - Ejercicio 3
%
%% Enunciado:
% Escriba un programa en Matlab que permita visualizar la convergencia de
% la fórmula de Poisson antes mencionada.

close all;
clear all;

T = 2;
n = 20;
w = -4*pi/T:0.001:4*pi/T;
p0 = 0.*w;

N = [1 10 100 1000];
lN = length(N);
for l=1:lN
    p0 = 0.*w;
    for k=-N(l):1:N(l)
        p0 = p0 + exp(-1i*k*T.*w);
    end
    subplot(lN,1,l); plot(w,p0);
    title(sprintf('n=%d',N(l)));
end

