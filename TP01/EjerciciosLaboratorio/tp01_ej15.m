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
N = length(x);
x1 = [x zeros(1, N-1)];
y1 = [y zeros(1, N-1)];


% 1. La sumatoria de convolución con ciclos for
w1 = my_conv(x,y);

% 2. la función conv,
w2 = conv(x,y);

% 3. la función filter,
w3 = filter(x1,1,y1); % uso con ceros agregados asi filter = conv

figure();
hold on;
plot(w1,'bo');
plot(w2,'r+');
plot(w3,'gs');
legend('my\_conv(x,y)','conv(x,y)','filter(x,y)');
grid on;

%%
% Como podemos observar a partir de la figura, tanto la función my_conv
% como la función filter de las señales con ceros agregados nos devuelven
% el mismo resultado que la convolución lineal.


% 4. las funciones fft y ifft utilizadas directamente como lo indica la propiedad,
w4 = ifft(fft(x).*fft(y));
wcirc = my_cconv(x,y);
figure();
plot(w4,'bs');
hold on;
plot(w3,'ro');
plot(wcirc,'g+');
legend('ifft(fft(x)*fft(y))','conv(x,y)','my\_cconv(x,y)');
grid on;

% 5. las funciones fft e ifft pero agregando N − 1 ceros tanto a x como a y.
w5 = ifft(fft(x1).*fft(y1));
figure();
plot(w5,'bo');
hold on;
plot(w3,'r+');
legend('ifft(fft(x1)*fft(y1))','conv(x,y)');
grid on;

%%
% Al comparar la convolucion lineal con la propiedad descripta en el ejercicio
% podemos ver que para señales discretas se cumple que la propiedad se
% cumple con la convolución circular. Si se agregan N-1 ceros a las
% señales, obtenemos la convolución lineal a partir de la circular.
