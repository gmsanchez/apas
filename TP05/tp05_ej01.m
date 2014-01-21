%% Guia 5, Ejercicio 1
%
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
% Aqui podemos observar que la varianza de la señal x generada aumenta a 
% medida que la norma-0 de a aumenta. Esto se debe a que en los casos que 
% la norma-0 de a es mayor, dicho vector es menos ralo y la fórmula para 
% obtener la señal x mezcla más cantidad de gaussianas.

%% Inciso 2: Base canónica
Inciso = 2;
phi{1} = eye(12);
plot_ej5

%%
% En este caso podemos observar que a medida que la norma-0 de a aumenta,
% se activarán más átomos de la base canónica, escalados por el valor
% correspondiente de a.

%% Inciso 3: Parte real de las exponenciales de la base de Fourier discreta
Inciso = 3;
phi{1} = normc(real(dftmtx(12)));
plot_ej5

%%
% En este inciso, se puede observar que al utilizar vectores a cuya norma-0
% sea 1, se activa uno de los átomos correspondientes a una cosenoidal de
% la base de Fourier discreta, escalada en amplitud por el valor
% correspondiente de a. Al aumentar la norma-0 de a, la señal x pasa a ser
% una combinación lineal de cosenoidales.

%% Inciso 4: Base canónica junto con la parte real de las exponenciales de 
% la base de Fourier discreta
Inciso = 4;
phi{1} = [eye(64,64), real(dftmtx(64))];
plot_ej5

%%
% Aqui observamos que al utilizar vectores cuya norma-0 sea unitaria, se
% activan átomos del diccionario que son parte de la base canónica o de la
% base de Fourier discreta. A medida que la norma-0 se incrementa, la señal
% x será una combinación lineal de dichos átomos escalados por el valor
% correspondiente en el vector a.

%% Anexo: Código fuente de funciones auxiliares

%% get_a
dbtype get_a.m

%% get_phi_a
dbtype get_phi_a.m

%% plot_ej5
dbtype plot_ej5.m
