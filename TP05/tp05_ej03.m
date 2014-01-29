%% Guia 5, Ejercicio 3
% Utilizando la "convexificación" del problema de representación rala en 
% términos de la norma l1:
% min ||a||_1, sujeto a ?a = x
%  a
% implemente el algoritmo de búsqueda de bases (BP, del inglés Basis 
% Pursuit) mediante una función que permita obtener, a partir de una señal 
% x y un diccionario $\Phi$, el conjunto de coeficientes â óptimo. Para ello
% puede utilizar las funciones del Toolbox de Optimización de Matlab.

%% Basis Pursuit mediante resolución del problema de optimización planteado.
dbtype my_bp.m

%% Basis Pursuit mediante la linealizacion del problema de optimización 
% planteado.
dbtype my_lbp.m