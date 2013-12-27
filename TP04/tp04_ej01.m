%% Guia 4 - Ejercicio 1
%

clear all
close all

%% Generación de señales.
% Se generaran las señales que se utilizarán en el resto de la guía.

L = 2^5;

xl = low(L);
xh = high(L);

subplot(2,1,1),stem(xl);
title('Señal generada con low'); xlabel('Muestras');
subplot(2,1,2),stem(xh);
title('Señal generada con high'); xlabel('Muestras');

fm = 1024;
t = 0:1/fm:1-1/fm;
N = length(t);
f0 = 0;
f1 = 500;
f = linspace(f0,f1,N);
%y = chirp(t,0,1,500);
y = sin(pi.*f.*t).*(1-t);

figure()
subplot(3,1,1),plot(t,y);
grid on; axis tight;
vf = -fm/2:fm/N:fm/2-fm/N;
subplot(3,1,2),plot(vf,fftshift(abs(fft(y))));
grid on; axis tight;
subplot(3,1,3),spectrogram(y,32,24,32,fm);

%% Anexo: Código fuente de las funciones utilizadas

%%
% Función low
dbtype low.m

%% 
% Función high
dbtype high.m