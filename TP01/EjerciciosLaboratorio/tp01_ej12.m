%% Guia 1 - Ejercicio de laboratorio 12
%
% Aproxime una onda cuadrada mediante series seno de diferente cantidad de
% tÃ©rminos y discuta la relaciÃ³n entre los resultados obtenidos y el
% fenÃ³meno de Gibbs.

%% Resultados y cÃ³digo fuente
% Vemos que al aumentar la cantidad de tÃ©rminos mejora la aproximaciÃ³n de
% la onda cuadrada. El fenÃ³meno de Gibbs aparece cuando se quiere aproximar
% una funciÃ³n que presenta una o mÃ¡s discontinuidades y se manifiesta
% mediante oscilaciones cerca de la discontinuidad. A pesar de que aumentemos
% la cantidad de tÃ©rminos de la aproximaciÃ³n, este fenÃ³meno persiste.

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
    title(sprintf('SeÃ±al cuadrada y su aproximaciÃ³n con %d tÃ©rminos.',M));
    xlabel('t[s]');
    
end