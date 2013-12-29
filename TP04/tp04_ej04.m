%% Guia 4 - Ejercicio 1
%

%% Código fuente y resultados
clear all
close all

%% Inciso a)
% Función que realiza el sobremuestreo de una señal mediante el agregado de 
% ceros. Por ejemplo, para la señal [1 2 3] debe producir [0 1 0 2 0 3].
dbtype my_upsample.m

%% Inciso b)
% Implemente la primer etapa de la reconstrucción con banco de filtros en 
% la función rstep.

dbtype my_rstep.m

%% Incisos c) y d)
% Utilice esta función para reconstruir la señal sinusoidal anteriormente 
% analizada con los filtros Haar y DB4 normalizados. Grafique la magnitud 
% de la transformada de Fourier de las señales después del sobremuestreo y 
% después del filtrado (pero antes de sumar las señales)

% Obtenemos nuestra senoidal
get_senoidal

%% Inciso c) Haar
	
% Haar
h = ma_filter(1);
g = md_filter(1);

Lo_D{1} = h;
Hi_D{1} = g;
Title{1} = 'Haar';

% Obtenemos los coeficientes de aproximación y detalle
[ ca{1}, cd{1} ] = my_dstep(y,Lo_D{1},Hi_D{1});

% Graficamos
plot_ej4c;

%% Inciso d) DB4
	
% DB4
[h, g] = db4(1);

Lo_D{1} = h;
Hi_D{1} = g;
Title{1} = 'DB4';

% Obtenemos los coeficientes de aproximación y detalle
[ ca{1}, cd{1} ] = my_dstep(y,Lo_D{1},Hi_D{1});

% Graficamos
plot_ej4c;

%% Anexo
% script plot_ej4c.m
dbtype plot_ej4c.m
