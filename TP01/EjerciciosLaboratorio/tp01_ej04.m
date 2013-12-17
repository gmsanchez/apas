%% Guia 1 - Ejercicio de laboratorio 4

%% Enunciado
% Considere el sistema
%
% $$H(z) = \frac{ 1-2z^-1+2z^-2-z^-3}{(1-z^-1)(1-0.5z^-1)(1-0.2z^-1)} $$
%
% 1. Dibuje el diagrama de polos y ceros. ¿Es estable el sistema?
% 2. Determine la respuesta al impulso del sistema.

%% Inciso 1: Diagrama de polos y ceros
% El sistema es estable. Dos de sus polos están en el interior del círculo
% unitario y el tercer polo ubicado sobre la circunferencia está cancelado
% por un cero.

close all;
clear all;

%             1-2*z^-1+2*z^-2-z^-3
% H(z) ----------------------------------
%      (1-z^-1)*(1-0.5*z^-1)*(1-0.2*z^-1)

% P(z) = 1-1.7*z^-1+0.8*z^-2-0.1*z^-3

Z = [1, -2, 2, -1];
P = [1, -1.7, 0.8, -0.1];

zplane(Z,P)
title('Diagrama de polos y ceros de H(z)');
grid on;

%% Inciso 2: Respuesta al impulso
% Al obtener la respuesta al impulso $h$ del sistema, podemos ver que
% es asintóticamente estable, dado que $\lim_{k \to +\infty} h(k) = 0$.

figure();
[h,t] = impz(Z,P,1000);
plot(t,h); hold on;
plot(t,h,'bo');
axis([0 20 -max(h) max(h)]);
title('Respuesta al impulso del sistema');
grid on;
