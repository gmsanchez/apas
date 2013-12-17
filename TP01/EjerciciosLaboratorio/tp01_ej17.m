%% Guia 1 - Ejercicio de laboratorio 17
%
%% Enunciado:
% Analice una señal senoidal cuya frecuencia crece linealmente desde cero
% hasta 8 veces la frecuencia de muestreo mediante la función anterior.
% Analice los resultados explicando claramente el fenómeno observado.


%% Código fuente y resultados

clear all;
close all;

fm = 1000;
t = 0:1/fm:1-1/fm;
y=chirp(t,0,1,8000);
figure()
my_spectrogram(y,1,64,1,1000);

%% Conclusiones
% En la figura podemos observar que el espectrograma grafica correctamente
% el crecimiento lineal de la frecuencia de la senoidal hasta la mitad de
% la frecuencia de muestreo utilizada (en este caso, la frecuencia se ve
% correctamente hasta los 500 Hz). A partir de cualquier frecuencia mayor a
% 500 Hz, se producirá alias.
%
% A partir de la frecuencia 501 hasta la 1000, la frecuencia ira
% decrementandose, dado que 501 Hz aparecen como 499 Hz debido al alias,
% 502 Hz como 498 Hz y así hasta llegar a 1000 Hz, que aparecen como 0 Hz.
% A partir de los 1001 Hz, la frecuencia irá incrementandose debido al
% alias, donde 10001 Hz aparecerá como 1 Hz, 1002 Hz como 2 Hz y así
% sucesivamente.