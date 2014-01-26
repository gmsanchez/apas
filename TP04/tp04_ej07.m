%% Guia 4, Ejercicio 7
%
close all;
clear all;

N = 2^7;
% Supongo descomposición TODD completa de nivel 5
t = ntree(2,5);

%% Inciso a) Genere una señal con todos ceros de longitud N = 2^7. Suponga 
% que ésta es el resultado de una descomposición TODD hasta nivel 5, que 
% tiene los coeficientes [a5d5d4d3d2d1]. En la posición correspondiente a 
% a5[2] (en el vector total será la posición 2) coloque un 1. Reconstruya 
% usando la TODD inversa, y grafique la señal obtenida. Utilice para ello 
% los filtros de Haar y los Daubechies. Esto permite obtener la función de 
% escala para dichos filtros, compárelas con las que aparecen en la 
% bibliografía (por ejemplo, en la pagina 23 de [2] para la Haar, y en 
% página 253 de [1] para la Daubechies con p = 2 momentos desvanecientes).
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

%% Inciso b) Genere una señal con todos ceros de longitud N = 2^7. Suponga 
% que ésta es el resultado de una descomposición TODD hasta nivel 5, que 
% tiene los coeficientes [a5d5d4d3d2d1]. En la posición correspondiente a 
% d5[2] (en el vector total será la posición 6) coloque un 1. Reconstruya 
% usando la TODD inversa, y grafique la señal obtenida. Utilice para ello 
% los filtros de Haar y los Daubechies. Esto permite obtener la función de 
% escala para dichos filtros, compárelas con las que aparecen en la 
% bibliografía (por ejemplo en página 24 de [2] para la Haar, y en página 
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