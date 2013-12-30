%% Guia 4 - Ejercicio 3
%

%% Código fuente y resultados
%

clear all
close all

%% Inciso a)
% Función que realizce el submuestreo de una señal, preservando las 
% muestras de índice impar (1,3,5, etc).

dbtype my_downsample.m

%% Inciso b)
% Implemente la primer etapa de la descomposición con banco de filtros 
% en la función dstep

dbtype my_dstep.m

%% Incisos c) y d)
% Utilice dstep sobre la señal generada en el inciso 1.d). Use los 
% filtros Haar y DB4 normalizados Grafique la magnitud de la 
% transformada de Fourier de las señales después del filtrado, y 
% después del submuestreo, y compárelas con la de la señal original
% ya analizada.	

% Obtenemos nuestra senoidal
get_senoidal

% Graficamos su espectro de magnitud
figure()
plot(abs(fft(y)));
title('Espectro de magnitud de la senoidal');
xlabel('Muestras'); axis tight

%% Inciso c) Haar
	
% Haar
[Lo_D{1},Hi_D{1}] = haar(1,'d');
Title{1} = 'Haar';
wav{1} = 'haar';

% Graficamos
plot_ej3c;

%% Inciso d) DB4
	
% DB4
[Lo_D{1}, Hi_D{1}] = db4(1,'d');
Title{1} = 'DB4';
wav{1} = 'db2';
% Graficamos
plot_ej3c;

%% Anexo
% script plot_ej3c.m
dbtype plot_ej3c.m