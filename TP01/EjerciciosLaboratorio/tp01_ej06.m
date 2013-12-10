%% Guia 1 - Ejercicio de laboratorio 6
%
%% Enunciado
% Dado el sistema 6y[n]-4y[n-1]+5y[n-2] = x[n]-2x[n-1]+x[n-2], inicialmente
% en reposo, obtenga la respuesta al escal�n unitario mediante la ecuaci�n
% en diferencias y luego comp�rela con la calculada mediante la sumatoria
% de convoluci�n, para lo que deber� encontrar previamente su respuesta al impulso.

%% C�digo fuente

clear all;
close all;

d = zeros(1,100); d(1) = 1; % Impulso
u = ones(1,100); % Escalon


h = sist_ej06(d); % Respuesta al impulso
y1 = sist_ej06(u); % Respuesta al escal�n unitario
y2 = conv(u,h); % Conv. del escal�n unitario con la respuesta al impulso

plot(y1,'r+');
xlabel('muestras');
grid on;
hold on;
plot(y2(1:length(y1)),'bo'); % Dibujo las mismas muestras que y1
legend('Respuesta al escalon unitario','Convoluci�n del escal�n unitario con la respuesta al impulso','Location','Best');
%% Conclusiones
% La salida de un sistema LTI es igual a la convoluci�n de la entrada con 
% la respuesta del sistema a un impulso.

%% C�digo fuente de la funci�n sist_ej06.m
dbtype sist_ej06.m
