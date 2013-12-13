%% Guia 1 - Ejercicio de laboratorio 13
%
% Aproxime una onda cuadrada mediante series seno de diferente cantidad de
% t�rminos y discuta la relaci�n entre los resultados obtenidos y el
% fen�meno de Gibbs.

%% Resultados y c�digo fuente
% By changing N, the number of points plotted, and M, the number of coef?cients, the accuracy of the approximation
%changes. For our purposes we kept the number of points plotted at 1000 to ensure the most precise graph for the number
%of coef?cients used. We started using one coef?cient, setting M equal to 1. The Fourier Series compared to the actual
%function is shown in Figure 3. Evaluating the function for M = 10 (Figure 4), M = 50 (Figure 5), M = 100
%(Figure 6) and M = 1000 (Figure 7) it is easy to see how the series is almost perfectly approximated, but with visible
%discontinuity.


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
    title(sprintf('Se�al cuadrada y su aproximaci�n con %d t�rminos.',M));
    xlabel('t[s]');
    
end