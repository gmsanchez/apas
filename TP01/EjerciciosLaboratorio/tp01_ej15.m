%% Guia 1 - Ejercicio de laboratorio 15
%
%% Enunciado:
% Verifique las condiciones de aplicabilidad para la propiedad
%
% $$x * y = \mathcal{F}^{-1} \{ \mathcal{F}\{x\} \mathcal{F}\{y\} \} $$
%
% utilizando señales de N muestras y comparando los resultados de la
% convolución calculada mediante
%
% 1. la sumatoria de convolución con ciclos for,
%
% 2. la función conv,
%
% 3. la función filter,
%
% 4. las funciones fft y ifft utilizadas directamente como lo indica la propiedad,
%
% 5. las funciones fft e ifft pero agregando N − 1 ceros tanto a x como a y.

%% Código fuente y resultados

clear all;
close all;

fm = 50;
t = 0:1/fm:1-1/fm;

x = sin(2*pi*10*t);
y = exp(-t);
w0 = conv(x,y);

%% 1. La sumatoria de convolución con ciclos for
w = my_conv(x,y);
figure();
plot(w,'bo');
hold on;
plot(w0,'r+');
legend('my\_conv(x,y)','conv(x,y)');
grid on;

%% 2. la función conv,

%% 3. la función filter,
w = filter(x,1,y);
figure();
plot(w,'bo');
hold on;
plot(w0,'r+');
legend('filter(x,y)','conv(x,y)');
grid on;

%% 4. las funciones fft y ifft utilizadas directamente como lo indica la propiedad,
w = ifft(fft(x).*fft(y));
wcirc = my_cconv(x,y);
figure();
plot(w,'bs');
hold on;
plot(w0,'ro');
plot(wcirc,'g+');
legend('ifft(fft(x)*fft(y))','conv(x,y)','my\_cconv(x,y)');
grid on;

%% 5. las funciones fft e ifft pero agregando N − 1 ceros tanto a x como a y.
N = length(x);
x1 = [x zeros(1, N-1)];
y1 = [y zeros(1, N-1)];
w = ifft(fft(x1).*fft(y1));
figure();
plot(w,'bo');
hold on;
plot(w0,'r+');
legend('ifft(fft(x)*fft(y))','conv(x,y)');
grid on;
