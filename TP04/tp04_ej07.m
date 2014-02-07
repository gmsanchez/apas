%% Guia 4, Ejercicio 7
%
close all;
clear all;

N = 2^7;
% Supongo descomposici�n TODD completa de nivel 5
t = ntree(2,5);

%% Inciso a)
% Genere una se�al con todos ceros de longitud N = 2^7. Suponga 
% que ésta es el resultado de una descomposici�n TODD hasta nivel 5, que 
% tiene los coeficientes [a5d5d4d3d2d1]. En la posici�n correspondiente a 
% a5[2] (en el vector total ser� la posici�n 2) coloque un 1. Reconstruya 
% usando la TODD inversa, y grafique la se�al obtenida. Utilice para ello 
% los filtros de Haar y los Daubechies. Esto permite obtener la funci�n de 
% escala para dichos filtros, comp�relas con las que aparecen en la 
% bibliograf�a (por ejemplo, en la pagina 23 de [2] para la Haar, y en 
% p�gina 253 de [1] para la Daubechies con p = 2 momentos desvanecientes).
c = zeros(N,1);
c(2) = 1;

% Filtros de Haar
[Lo_D,Hi_D,Lo_R,Hi_R] = haar(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y), axis normal, grid on;

% Filtros DB2
[Lo_D,Hi_D,Lo_R,Hi_R] = db4(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y), axis normal, grid on;

%% Inciso b)
% Genere una se�al con todos ceros de longitud N = 2^7. Suponga 
% que �sta es el resultado de una descomposici�n TODD hasta nivel 5, que 
% tiene los coeficientes [a5d5d4d3d2d1]. En la posici�n correspondiente a 
% d5[2] (en el vector total ser� la posici�n 6) coloque un 1. Reconstruya 
% usando la TODD inversa, y grafique la se�al obtenida. Utilice para ello 
% los filtros de Haar y los Daubechies. Esto permite obtener la funci�n de 
% escala para dichos filtros, comp�relas con las que aparecen en la 
% bibliograf�a (por ejemplo en p�gina 24 de [2] para la Haar, y en p�gina 
% 253 de [1] para la Daubechies con p = 2 momentos desvanecientes).
c = c.*0;
c(6) = 1;

% Filtros de Haar
[Lo_D,Hi_D,Lo_R,Hi_R] = haar(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y), axis normal, grid on;

% Filtros DB2
[Lo_D,Hi_D,Lo_R,Hi_R] = db4(1);
y = my_wprec(c,Lo_R,Hi_R,t);
figure(),plot(y), axis normal, grid on;