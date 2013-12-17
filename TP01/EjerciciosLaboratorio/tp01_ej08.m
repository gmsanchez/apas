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
    %subplot(K,1,i);
    figure();
    stem(t,s{i});
    axis([0 1 -1 1])
    title(sprintf('fm = %0.1f Hz',fm(i)));
end

%% Conclusiones
% En las figuras podemos observar que la señal se "ve" de 5 Hz hasta utilizar
% 25 Hz de frecuencia muestreo. Al utilizar 10 Hz de frecuencia de muestreo, se
% capturan los cruces por cero de la senoidal. Al ser submuestreada a 4 Hz,
% la senoidal de 5 Hz aparece como una de 1 Hz por efecto del alias.
% Utilizando frecuencias de muestreo menores, la representación de la señal
% se ve sumamente deteriorada, llegando a tener una señal vacía en el caso
% de 0.5 Hz.