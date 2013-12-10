%% Guia 1 - Ejercicio de laboratorio 5
%
%% Enunciado
% Realice su propia implementaci�n de las convoluciones lineal y circular 
% mediante la utilizaci�n de ciclo for. Compare los resultados con la funci�n conv.

%% C�digo fuente y resultados
clear all;
close all;

fm = 50;
t = 0:1/fm:1-1/fm;

y = exp(-t);
w = cos(2*pi*t);

% Se�ales utilizadas
figure();
subplot(2,1,1),stem(t,y); title('exp(-t)'); xlabel('t');
subplot(2,1,2),stem(t,w); title('cos(2*pi*t)'); xlabel('t');

% Convoluci�n lineal
figure()
plot(conv(y,w),'r+'), hold on;
plot(my_conv(y,w),'bo'), hold off;
title('Convoluci�n lineal');
xlabel('muestras');

% Convoluci�n circular
figure()
N = length(y);
plot(ifft(fft(y).*fft(w)),'r+'), hold on;
plot(my_cconv(y,w),'bo'), hold off;
title('Convoluci�n circular');
xlabel('muestras');

%% Anexo: Codigo fuente de las funciones utilizadas
%

% Convoluci�n lineal
dbtype my_conv.m

% Convoluci�n circular
dbtype my_cconv.m
