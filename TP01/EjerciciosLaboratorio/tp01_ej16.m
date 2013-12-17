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
s128_4 = my_spectrogram(y,1,128,4,fm);
title('Ventanas de 128 de ancho espaciadas en 4');
figure()
s128_128 = my_spectrogram(y,1,128,128,fm); % Distinto solapamiento
title('Ventanas de 128 de ancho espaciadas en 96');
figure()
s32_4 = my_spectrogram(y,1,32,4,fm);
title('Ventanas de 32 de ancho espaciadas en 4');

%% Conclusiones
% Se generó una señal que es suma de dos senoidales localizadas en el
% tiempo y un chirp cuadrático.
% Se realizó el espectrograma de esta señal utilizando ventanas de Hanning.
% 
% Se utilizaron ventanas de un ancho de 128 y un espaciado de 4 como 
% espectrograma de referencia.
%
% En el primer caso, se cambió el espaciado entre ventanas a 128. En la
% figura podemos ver que se mantiene la resolución frecuencial, pero la 
% resolución temporal se ve afectada. Puede verse claramente en los
% rectángulos correspondientes a las senoidales, donde se aprecia la
% considerable pérdida de localización temporal.
%
% En el segundo caso, se cambió el ancho de ventana a 32 y se mantuvo el espaciado
% original de 4. En la figura podemos ver que la resolución frecuencial
% ha empeorado y que se mantiene la resolución temporal. Si bien este es un
% caso bastante extremo, las cajas correspondientes a las senoidales
% permiten observar que tanto se ha perdido la localización frecuencial.

%% Anexo: Código fuente de my_spectrogram
dbtype my_spectrogram.m