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

%% Haar
h = ma_filter(1);
g = md_filter(1);
%% DB4
[h, g] = db4(1);

%% Respuesta en frecuencia

w = 0:2*pi/200:2*pi;
Hw = 0.*w;
for k=1:length(h)
    Hw = Hw + h(k)*exp(-1i*w*(k-1));
end

Gw = 0.*w;
for k=1:length(g)
    Gw = Gw + g(k)*exp(-1i*w*(k-1));
end

% Verifico ecuacion 7e
eq7e = abs(Hw).^2+abs(Gw).^2;

figure()
plot(w,abs(Hw),'r',w,abs(Gw),'b',w,eq7e,'g');
