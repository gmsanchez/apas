%% Guia 1 - Ejercicio de laboratorio 5
%
%% Enunciado
% Realice su propia implementación de las convoluciones lineal y circular 
% mediante la utilización de ciclo for. Compare los resultados con la función conv.

%% Código fuente y resultados
clear all;
close all;

fm = 50;
t = 0:1/fm:1-1/fm;

y = exp(-t);
w = cos(2*pi*t);

% Señales utilizadas
figure();
subplot(2,1,1),stem(t,y); title('exp(-t)'); xlabel('t');
subplot(2,1,2),stem(t,w); title('cos(2*pi*t)'); xlabel('t');

% Convolución lineal
figure()
plot(conv(y,w),'r+'), hold on;
plot(my_conv(y,w),'bo'), hold off;
title('Convolución lineal');
xlabel('muestras');

% Convolución circular
figure()
N = length(y);
plot(ifft(fft(y).*fft(w)),'r+'), hold on;
plot(my_cconv(y,w),'bo'), hold off;
title('Convolución circular');
xlabel('muestras');

%% Anexo: Codigo fuente de las funciones utilizadas
%

% Convolución lineal
dbtype my_conv.m

% Convolución circular
dbtype my_cconv.m
