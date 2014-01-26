%% Guia 5, Ejercicio 1
% Implemente una funci髇 que permita generar una se馻l sint閠ica artificial
% x ? R^N a partir de un diccionario ? ? R^(N譓) dado y un vector aleatorio
% de coeficientes a ? R^M de "norma" l0 conocida. Suponga un modelo 
% generativo lineal del tipo x = ?a. Pruebe la funci髇 utilizando vectores 
% a cuyos elementos distintos de cero sean iid con distribuci髇 uniforme 
% en el rango [?2, -1] ? [1, 2].

clear all
close all

l0 = [1 5 2];
nl0 = length(l0);
phi = cell(1,1);

%% Inciso 1: Distribucion gaussiana normalizada
Inciso = 1;
phi{1} = normc(randn(64,128));
plot_ej5

%%
% Aqui podemos observar que la varianza de la se帽al x generada aumenta a 
% medida que la norma-0 de a aumenta. Esto se debe a que en los casos que 
% la norma-0 de a es mayor, dicho vector es menos ralo y la f贸rmula para 
% obtener la se帽al x mezcla m谩s cantidad de gaussianas.

%% Inciso 2: Base can贸nica
Inciso = 2;
phi{1} = eye(12);
plot_ej5

%%
% En este caso podemos observar que a medida que la norma-0 de a aumenta,
% se activar谩n m谩s 谩tomos de la base can贸nica, escalados por el valor
% correspondiente de a.

%% Inciso 3: Parte real de las exponenciales de la base de Fourier discreta
Inciso = 3;
phi{1} = normc(real(dftmtx(12)));
plot_ej5

%%
% En este inciso, se puede observar que al utilizar vectores a cuya norma-0
% sea 1, se activa uno de los 谩tomos correspondientes a una cosenoidal de
% la base de Fourier discreta, escalada en amplitud por el valor
% correspondiente de a. Al aumentar la norma-0 de a, la se帽al x pasa a ser
% una combinaci贸n lineal de cosenoidales.

%% Inciso 4: Base can贸nica junto con la parte real de las exponenciales de 
% la base de Fourier discreta
Inciso = 4;
phi{1} = [eye(64,64), real(dftmtx(64))];
plot_ej5

%%
% Aqui observamos que al utilizar vectores cuya norma-0 sea unitaria, se
% activan 谩tomos del diccionario que son parte de la base can贸nica o de la
% base de Fourier discreta. A medida que la norma-0 se incrementa, la se帽al
% x ser谩 una combinaci贸n lineal de dichos 谩tomos escalados por el valor
% correspondiente en el vector a.

%% Anexo: C贸digo fuente de funciones auxiliares

%% get_a
dbtype get_a.m

%% get_phi_a
dbtype get_phi_a.m

%% plot_ej5
dbtype plot_ej5.m
