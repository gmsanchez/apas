%% Guia 1 - Ejercicio de laboratorio 18
%

%% Enunciado
% Realice el espectrograma de una señal senoidal cuya frecuencia crezca
% linealmente entre 100 y 200 Hz. Grafique el resultado con las escalas de
% tiempo y frecuencia adecuadas. Analice y discuta el resultado obtenido.

clear all;
close all;

fm = 1000;
t = 0:1/fm:1-1/fm;
y = chirp(t,100,1,200);
figure()
my_spectrogram(y,1,64,2,1000);

%% Conclusiones
% El espectrograma muestra la señal senoidal con una frecuencia que
% presenta un crecimiento lineal. Puede verse claramente que en el tiempo
% t=0s la frecuencia está en 100 Hz y en el tiempo t=0.999s la frecuencia
% está en 200 Hz.