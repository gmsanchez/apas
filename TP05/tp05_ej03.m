%% Guia 5, Ejercicio 3
% Utilizando la "convexificaci�n" del problema de representaci�n rala en 
% t�rminos de la norma l1:
% min ||a||_1, sujeto a ?a = x
%  a
% implemente el algoritmo de b�squeda de bases (BP, del ingl�s Basis 
% Pursuit) mediante una funci�n que permita obtener, a partir de una se�al 
% x y un diccionario ?, el conjunto de coeficientes � �ptimo. Para ello
% puede utilizar las funciones del Toolbox de Optimizaci�n de Matlab.

%% Basis Pursuit mediante resoluci�n del problema de optimizaci�n planteado.
dbtype my_bp.m

%% Basis Pursuit mediante la linealizacion del problema de optimizaci�n 
% planteado.
dbtype my_lbp.m