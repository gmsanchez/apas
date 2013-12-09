%% Guia 1 - Ejercicio de laboratorio 8
%

%% Enunciado y resultados
% Discretice una señal senoidal con frecuencia 5 Hz. y duraci ón 1 seg.
% Utilice las siguientes frecuencias de muestreo:
% 1000, 100, 25, 10, 4, 1 y 0,5 Hz. Grafique y analice el resultado en
% cada uno de los casos.

clear all;
close all;

fm = [1000, 100, 25, 10, 4, 1, 0.5];
tm = 1./fm;
f = 5;
K = length(tm);
for i=1:K
    t = 0:tm(i):1-tm(i);
    s{i} = sin(2*pi*f*t);
    subplot(K,1,i);
    stem(t,s{i});
    title(sprintf('%0.1f Hz',fm(i)));
end