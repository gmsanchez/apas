%% Guia 4 - Ejercicio 1
%
clear all
close all

%% Generación de señales.

L = 2^5;

xl = low(L);
xh = high(L);
h = ma_filter();
g = md_filter();

figure()
subplot(3,1,1),stem(xl); 
subplot(3,1,2),stem(cconv(xl,h));
subplot(3,1,3),stem(cconv(xl,g));

figure()
subplot(3,1,1),stem(xh);
subplot(3,1,2),stem(cconv(xh,h));
subplot(3,1,3),stem(cconv(xh,g));

