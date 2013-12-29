%% Guia 4, Ejercicio 5
%

%% Código fuente y resultados
%

clear all;
close all;

%% Inciso a)
% Implemente una función maxlevel que determine el nivel máximo de 
% descomposición admitido por una señal.

dbtype maxlevel

%% Inciso b)
% Implemente una función que realice la descomposición hasta el nivel 
% deseado, para generar la TODD.

dbtype todd.m

%% Inciso c)
% Implemente una función que realice la descomposición iterativamente desde 
% el nivel dado

dbtype itodd.m

%% Inciso d)
% Aplique a una señal cualquiera las funciones de descomposición y 
% reconstrucción en forma secuencial y compare la señal original con la 
% reconstruida. Grafique la señal original, la señal reconstruida y el 
% error de reconstrucción. Utilice los filtros Haar y Daubechies 
% normalizados.
 
% Obtenemos nuestra senoidal
get_senoidal

%% Haar
display('=== Haar ===')
h = ma_filter(1);
g = md_filter(1);

% Genero descomposición hasta el nivel 5
N = 5;
[a,d,c,l] = todd(y,h,g,N);
% Comparo con dwt
[a1,d1] = dwt(y,h,g,'mode','per');
[a2,d2] = dwt(a1,h,g,'mode','per');
[a3,d3] = dwt(a2,h,g,'mode','per');
[a4,d4] = dwt(a3,h,g,'mode','per');
[a5,d5] = dwt(a4,h,g,'mode','per');

% Reconstruyo la señal
yr = itodd(c,l,h,g);

% Saco resultados
plot_ej5d

%% DB4
display('=== DB4 ===')
[h,g] = db4(1);

% Genero descomposición hasta el nivel 5
N = 5;
[a,d,c,l] = todd(y,h,g,N);
% Comparo con dwt
[a1,d1] = dwt(y,h,g,'mode','per');
[a2,d2] = dwt(a1,h,g,'mode','per');
[a3,d3] = dwt(a2,h,g,'mode','per');
[a4,d4] = dwt(a3,h,g,'mode','per');
[a5,d5] = dwt(a4,h,g,'mode','per');

% Reconstruyo la señal
yr = itodd(c,l,h,g);

% Saco resultados
plot_ej5d

%% Anexo
% script plot_ej5d.m
dbtype plot_ej5d.m