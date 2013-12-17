%% Guia 1 - Ejercicio de laboratorio 16
%
%% Enunciado:
% Realice un función para el cálculo y graficación de un espectrograma a
% partir de ciclos for y la transformada rápida de Fourier (fft). Utilice
% diferentes solapamientos y anchos de ventana para el análisis. Analice y
% discuta los resultados a la luz del principio de incertidumbre de Heisenberg.

%% Código fuente y resultados
clear all;
close all;

fm = 1000;
t=0:1/fm:2-1/fm;                    % 2 secs @ 1kHz sample rate
y=chirp(t,100,1,200,'q');           % Start @ 100Hz, cross 200Hz at t=1sec
s1 = 0.*t;
s1(400:600) = sin(2*pi*300*t(400:600));
s2 = 0.*t;
s2(1750:1950) = sin(2*pi*100*t(1750:1950));
y = y+s1+s2;
%figure(1)
%spectrogram(y,128,120,128,1E3); % Display the spectrogram
figure()
s128_0 = my_spectrogram(y,1,128,0,fm,1);
title('Ventanas de 128 de ancho sin solapar');
figure()
s128_32 = my_spectrogram(y,1,64,32,fm,1); % Distinto solapamiento
title('Ventanas de 128 de ancho solapadas en 32');
figure()
s32_0 = my_spectrogram(y,1,32,0,fm,1);
title('Ventanas de 32 de ancho sin solapar');

%% Conclusiones
% Se generó una señal que es suma de dos senoidales localizadas en el
% tiempo y un chirp cuadrático y se realizó el espectrograma de esta señal 
% utilizando ventanas de Hanning.
% 
% Se utilizaron ventanas de un ancho de 128 sin solapar como referencia.
%
% En el primer caso, se cambió el espaciado entre ventanas a 32. En este
% caso podemos ver que el espectrograma mantiene la resolución frecuencial
% y mejora la resolución temporal. Esto se debe a que el hecho de permitir
% solapamiento de ventanas hace que entren más ventanas en el mismo
% intervalo de tiempo. La resolución frecuencial se mantiene debido a que
% el tamaño de la ventana es el mismo, sin embargo ahora tenemos varias
% ventanas que capturan la misma información.
%
% En el segundo caso, se cambió el ancho de ventana a 32 y se quitó el
% solapamiento. En la figura podemos ver que la resolución frecuencial
% ha empeorado y que la resolución temporal ha mejorado. Esto se nota
% principalmente en el caso de las senoidales localizadas en el tiempo,
% donde ahora el rectángulo correspondiente a su frecuencia se encuentra
% menos definido.

%% Anexo: Código fuente de my_spectrogram
dbtype my_spectrogram.m