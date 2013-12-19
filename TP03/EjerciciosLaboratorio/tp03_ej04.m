%% Guia 3 - Ejercicio 4
%

%% Enunciado
% Sobre la misma señal, explore la descomposición ondita generada mediante 
% la transformada ondita diádica discreta (tambien llamada DWT), que es el
% lgoritmo explorado en la sección 7.3.1:
%
% a) La función dwt permite generar un nivel de descomposición, es decir, a 
% partir de la señ̃al en un espacio, obtiene los coeficientes de 
% aproximación y detalle de la siguiente escala. Explore su uso, generando
% iterativamente la % descomposición hasta nivel L = 3.
%
% b) La función idwt permite reconstruir un nivel de la descomposición.
% Explore la reconstrucción para la señal descompuesta hasta escala L = 3
% del caso anterior.
%
% c) Compare sus resultados con las funciones wavedec y waverec, que permiten
% realizar la descomposición y reconstrucción completa hasta el nivel deseado.
%
% d ) Escriba una función en Matlab que permita visualizar en graficas separadas,
% la señ̃al original y los coeficientes de la descomposició́n para cada escala. Por
% ejemplo, si se aplicó́ una descomposición hasta nivel 2, debe producir una gráfica
% con 4 subgráficas, una para la señ̃al original, otra para los coeficientes de detalle
% para la escala j = 1, otra para los coeficientes de detalle en escala j = 2 y otra
% para los coeficientes de aproximación a escala j = 2. Pruebe esta función para
% la señ̃al seleccionada, haciendo una descomposición hasta el nivel 3.
%
% e) A partir de la descomposición obtenida con wavedec, la función wrcoef permite
% obtener la reconstrucción a partir de los coeficientes de aproximación de detalle
% del nivel que se desee, es decir, permite obtener la proyección sobre Vj y Wj .
% Escriba una función que permita graficar en subgráficas, la señ̃al original y las
% proyecciones en los subespacios W1 , . . . , Wp y Vp para una descomposición con
% p niveles. Pruebe esta función sobre una descomposició́n multiresolución hasta
% nivel p = 3.

clear all;
close all;

load internet-traffic-data-in-bits-fr1

x = internet_traffic_data_in_bits_ft_quantity(512:512+2^11-1);

%% Inciso a 
%
wav = 'db9';
[cA1,cD1] = dwt(x,wav,'per');
[cA2,cD2] = dwt(cA1,wav,'per');
[cA3,cD3] = dwt(cA2,wav,'per');

%% Inciso b
%
xr2 = idwt(cA3,cD3,wav,'per');
fprintf('La reconstruccion de nivel 3 tiene un error de %.4f\n', ... 
    norm(cA2-xr2));
xr1 = idwt(xr2,cD2,wav,'per');
fprintf('La reconstruccion de nivel 1 tiene un error de %.4f\n', ... 
    norm(cA1-xr1));
xr0 = idwt(xr1,cD1,wav,'per');
fprintf('La reconstruccion de nivel 0 tiene un error de %.4f\n', ...
    norm(x-xr0));

%% Inciso c
%
[C,L] = wavedec(x,3,wav,'per');
c1_err = norm(C-[cA3 cD3 cD2 cD1]);
fprintf('La decomposición tiene un error de %.4f\n', ...
    c1_err);

xrec_c = waverec(C,L,wav);
c2_err = norm(xrec_c-xr0);
fprintf('La reconstruccion tiene un error de %.4f\n', ...
    c2_err);

%% Inciso d
%
graf_wavedec(x,C,L)

%% Inciso e
%
%%
% Reconstruccion con las aproximaciones
graf_wrcoef(x,C,L,wav,'a')

%%
% Reconstruccion con los detalles
graf_wrcoef(x,C,L,wav,'d')

%% Anexo

%%
% Función graf_wavedec
dbtype graf_wavedec.m

%%
% Función graf_wrcoef
dbtype graf_wrcoef.m