%% Guia 4 - Ejercicio 1
%
clear all
close all

%% Generación de señales.

L = 2^5;

xl = low(L);
xh = high(L);
h = ma_filter(0);
g = md_filter(0);

% figure()
% subplot(3,1,1),stem(xl); 
% subplot(3,1,2),stem(cconv(xl,h,L));
% subplot(3,1,3),stem(cconv(xl,g,L));

figure()
subplot(3,1,1),stem(xl); 
subplot(3,1,2),stem(my_cconv(xl,h));
subplot(3,1,3),stem(my_cconv(xl,g));

% figure()
% subplot(3,1,1),stem(xh);
% subplot(3,1,2),stem(cconv(xh,h,L));
% subplot(3,1,3),stem(cconv(xh,g,L));

figure()
subplot(3,1,1),stem(xh);
subplot(3,1,2),stem(my_cconv(xh,h));
subplot(3,1,3),stem(my_cconv(xh,g));

