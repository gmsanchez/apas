%% Guia 4 - Ejercicio 1
%
clear all
close all

%% Generaci�n de se~nales.
% Se generaran las se~nales que se utilizar�n en el resto de la gu�a.

%% Inciso a) Funci�n low
dbtype low.m

%% Inciso b) Funci�n high
dbtype high.m

%% Inciso c)
% A continuaci�n se ven las gr�ficas de cada se�al junto con su espectro de
% magnitud. Se puede apreciar que la se�al low tiene componentes en las
% bajas frecuencias mientras que la se�al high tiene componentes en las
% altas frecuencias. Eso tambi�n se puede ver en la representaci�n temporal
% de la se�al al notar la cantidad de oscilaciones que presenta cada una de
% ellas.

L = 2^5;
xl = low(L);
xh = high(L);

figure()
subplot(2,1,1),stem(xl);
title('Se~nal low'); xlabel('Muestras');
subplot(2,1,2),stem(abs(fft(xl)));
title('Espectro de magnitud de low'); xlabel('Muestras');

figure()
subplot(2,1,1),stem(xh);
title('Se~nal high'); xlabel('Muestras');
subplot(2,1,2),stem(abs(fft(xh)));
title('Espectro de magnitud de high'); xlabel('Muestras');

%% Inciso d)
% Se genera una se~nal sinusoidal muestreada a 1024 Hz, durante un segundo, 
% cuya frecuencia aumenta linealmente desde 0 a 500 Hz durante su duraci�n. 
% La amplitud de la se~nal decae linealmente desde 1 a 0 en el lapso de 
% tiempo.

dbtype get_senoidal

% Genero la senoidal
get_senoidal


%% Inciso e)
% Al ver el espectro de magnitud de esta se~nal, podemos apreciar que se
% ve que existen componentes desde 0 a 500 Hz y que la amplitud decae
% linealmente a medida que aumentamos la frecuencia. Esto coincide con la
% forma en que se gener� la se~nal, dado que a medida que la frecuencia
% crece, la amplitud decae (y ambas lo hacen a la misma tasa). El
% espectrograma muestra claramente la evoluci�n de la frecuencia de la 
% se~nal a medida que pasa el tiempo.

figure()
subplot(3,1,1),plot(t,y);
title('Se~nal senoidal'); xlabel('Tiempo [s]');
grid on; axis tight;
vf = -fm/2:fm/N:fm/2-fm/N;
subplot(3,1,2),plot(vf,fftshift(abs(fft(y))));
title('Espectro de magnitud'); xlabel('Frecuencia [Hz]');
grid on; axis tight;
subplot(3,1,3),spectrogram(y,32,24,32,fm);
title('Espectrograma');
