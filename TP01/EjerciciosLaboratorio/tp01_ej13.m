clear all;
close all;

f1 = 10; f2 = 20;
tm = 0.001; fm = 1/tm;

t = [0:tm:1-tm];

s = sin(2*pi*f1*t)+4*sin(2*pi*f2*t);

S = fft(s);

N = length(s);
f = [0:fm/N:fm-fm/N];

subplot(3,1,1),stem(t,s);
title('Inciso 1');
subplot(3,1,2);stem(f,abs(S));

% verifico relaciond de Parseval
% las energías tienen que ser iguales
es = sum(s.^2);
eS = sum(abs(S).^2)/N;

fprintf('Energia de la se~nal: %f\n', es);
fprintf('Energia de la transformada: %f\n', eS);
subplot(3,1,3);bar([es eS]);

% Inciso 2
figure;
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;
S1 = fft(s1);
subplot(2,1,1),stem(t,s1);
title('Inciso 2');
subplot(2,1,2);stem(f,abs(S1));

% Inciso 3
figure;
f2 = 11;
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;
S1 = fft(s1);
subplot(2,1,1),stem(t,s1);
title('Inciso 3');
subplot(2,1,2);stem(f,abs(S1));

% Inciso 4
% Se ve mal porque tenemos 1000Hz y 1000 muestras.
% Nuestra resolucion frecuencial es 1, por lo que no vemos
% correctamente 10,5.
figure;
f2 = 10.5;
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;
S1 = fft(s1);
subplot(2,1,1),stem(t,s1);
title('Inciso 4');
subplot(2,1,2);stem(f,abs(S1));

% Inciso 5
t = [0:tm:0.72-tm];
figure;
f2 = 20;
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t);
S1 = fft(s1);
subplot(2,1,1),stem(t,s1);
title('Inciso 5');
N = length(s1);
f = [0:fm/N:fm-fm/N];
subplot(2,1,2);stem(f,abs(S1));

