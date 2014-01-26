%% Guia 4, Ejercicio 6
%
close all;
clear all;

% Obtenemos nuestra senoidal
get_senoidal

%% Inciso a) Escriba una funci�n que permita calcular la descomposici�n 
% Paquetes de Onditas completa (es decir sobre el �rbol completo), iterando 
% con la funci�n dstep tanto sobre los coeficientes de aproximaci�n como en 
% los de escala, hasta el nivel deseado.

[Lo_D,Hi_D,Lo_R,Hi_R] = db4(1);
lvl = 4;

subplot(lvl+1,1,1)
plot(y);
title('Se~nal original.');

for k=1:lvl
c = dpoc(y,Lo_D,Hi_D,k);
subplot(lvl+1,1,k+1)
plot(c);
if k==1
    title(sprintf('DPOC %d nivel.',k));
else
    title(sprintf('DPOC %d niveles.',k));
end
end

%% Inciso b) Escriba una una funci�n wpdec que permita ingresar la 
% estructura del �rbol de descomposici�n deseado y devuelva los 
% coeficientes de la descomposici�n obtenida, iterando la funci�n dstep 
% sobre los coeficientes adecuados.

dbtype my_wpdec;

%% Inciso c) Escriba una funci�n wprec que reconstruya mediante la 
% iteraci�n de la funci�n rstep, una se�al, dada su descomposici�n generada 
% con wpdec y la estructura del �rbol.

dbtype my_wprec

%% Inciso d) Utilice esta descomposici�n y reconstrucci�n sobre una se�al 
% cualquiera. Grafique la se�al original, la reconstruida y el error de 
% reconstrucci�n. Utilice los filtros Haar y Daubechies normalizados.
Lo_D = cell(1,2); Hi_D = cell(1,2);
Lo_R = cell(1,2); Hi_R = cell(1,2);

[Lo_D{1},Hi_D{1},Lo_R{1},Hi_R{1}] = haar(1);
[Lo_D{2},Hi_D{2},Lo_R{2},Hi_R{2}] = db4(1);
wav{1} = 'Haar';
wav{2} = 'DB2';

terminalnodes = [7 8 4 5 13 14];

for k = 1:length(Lo_D)
    fprintf('===== %s =====\n',wav{k});
    % Descomposicion
    [c0,t0] =  my_wpdec(y,Lo_D{k},Hi_D{k},3,terminalnodes);
    plot(t0);
    figure();
    plot(c0); title(sprintf('Coeficientes generados con %s',wav{k}));

    % Reconstruccion
    yr = my_wprec(c0,Lo_R{k},Hi_R{k},t0);
    figure();
    subplot(3,1,1),plot(y);
    title('Se~nal original');
    subplot(3,1,2),plot(yr);
    title('Se~nal reconstruida');
    subplot(3,1,3),plot(yr-y);
    title(sprintf('Error de reconstruccion utilizando %s',wav{k}));
end

%% Anexo: C�digo fuente de funciones utilizadas

%% get_senoidal
dbtype get_senoidal.m

%% dpoc
dbtype dpoc.m