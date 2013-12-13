%% Guia 1 - Ejercicio de laboratorio 12
%
% Aproxime una onda cuadrada mediante series seno de diferente cantidad de
% términos y discuta la relación entre los resultados obtenidos y el
% fenómeno de Gibbs.

%% Resultados y código fuente
% Vemos que al aumentar la cantidad de términos mejora la aproximación de
% la onda cuadrada. El fenómeno de Gibbs aparece cuando se quiere aproximar
% una función que presenta una o más discontinuidades y se manifiesta
% mediante oscilaciones cerca de la discontinuidad. A pesar de que aumentemos
% la cantidad de términos de la aproximación, este fenómeno persiste.

clear all;
close all;

f0 = 1;
fm = 500;
t = 0:1/fm:2-1/fm;
y = square(2*pi*f0*t); % Genero una cuadrada de f0 Hz

L = length(t);
for N=0:5:20 % Iteramos sobre la cantidad de bases
    if N==0
        M = N+1;
    else
        M = N;
    end
    s = 0.*y;
    
    for k=1:1:M
        sk = sin(2*pi*k*t*f0);
        ak = dot(y,sk)/dot(sk,sk);
        s = s + ak*sk;
    end

    figure(M)
    plot(t,y,'r'); hold on;
    plot(t,s,'b'); hold off;
    grid on;
    title(sprintf('Señal cuadrada y su aproximación con %d términos.',M));
    xlabel('t[s]');
    
end