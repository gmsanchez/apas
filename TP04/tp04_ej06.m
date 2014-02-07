%% Guia 4, Ejercicio 6
%
close all;
clear all;

% Obtenemos nuestra senoidal
get_senoidal

%% Inciso a) 
% Escriba una función que permita calcular la descomposición Paquetes de 
% Onditas completa (es decir sobre el árbol completo), iterando 
% con la funció dstep tanto sobre los coeficientes de aproximación como en 
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

%% Inciso b)
% Escriba una una funci�n wpdec que permita ingresar la 
% estructura del árbol de descomposición deseado y devuelva los 
% coeficientes de la descomposición obtenida, iterando la función dstep 
% sobre los coeficientes adecuados.

dbtype my_wpdec;

%% Inciso c)
% Escriba una función wprec que reconstruya mediante la 
% iteración de la función rstep, una señal, dada su descomposición generada 
% con wpdec y la estructura del árbol.

dbtype my_wprec

%% Inciso d)
% Utilice esta descomposici�n y reconstrucción sobre una señal 
% cualquiera. Grafique la se�al original, la reconstruida y el error de 
% reconstrucción. Utilice los filtros Haar y Daubechies normalizados.
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

%% Anexo: Código fuente de funciones utilizadas

%% get_senoidal
dbtype get_senoidal.m

%% dpoc
dbtype dpoc.m