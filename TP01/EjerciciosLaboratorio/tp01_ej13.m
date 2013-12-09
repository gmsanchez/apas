%% Guia 1 - Ejercicio de laboratorio 13
%
%% Inciso 1
% Genere una señal
%
% $$g(t) = \sin(2 \pi f_1 t) + 4 \sin(2 \pi f_2 t) $$
%
% con $f_1=10\,Hz$ y $f_2=20\,Hz$ y obtenga su versión discreta con
% período de muestreo $T_m = 0.001 \, seg$ en el intervalo de tiempo
% $t = [0,...,1)$.
clear all;
close all;

% Configuración de los parámetros

f1 = 10; f2 = 20;
tm = 0.001; fm = 1/tm;
t = [0:tm:1-tm];

% Generación de la señal en su versión discreta

s = sin(2*pi*f1*t)+4*sin(2*pi*f2*t);

S = fft(s);

N = length(s);
f = [0:fm/N:fm-fm/N];

subplot(3,1,1),stem(t,s); title('Señal inciso 1');
subplot(3,1,2);stem(f,abs(S)); title('Espectro de magnitud de la TDF');
xlabel('muestras');

% Verifico relación de Parseval, las energíasas tienen que ser iguales.
es = sum(s.^2);
eS = sum(abs(S).^2)/N;

fprintf('Energia de la señal: %f\n', es); xlabel('t[s]');
fprintf('Energia de la transformada: %f\n', eS);
subplot(3,1,3);bar([es eS]); title('Energía de la señal y su transformada');

%% Inciso 2
% Modifico s[n] de forma tal que $g(t) = \sin(2 \pi f_1 t) + 4 \sin(2 \pi f_2 t) + 4$
% Se puede ver que en el espectro de magnitud de  esta nueva señal existe 
% una componente en la frecuencia cero, que corresponde a la constante que se agregó.

s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;
S1 = fft(s1);
figure;
subplot(2,1,1),stem(t,s1); title('Señal inciso 2'); xlabel('t[s]');
subplot(2,1,2);stem(f,abs(S1)); title('Espectro de magnitud de la TDF');
xlabel('muestras');
axis([-10, length(s1), 0, max(S1)*1.1]); % Acomodo los ejes para que se visualice correctamente.



%% Inciso 3
% Modifico las frecuencias de las señales seno de forma tal que $f_1 = 10\,Hz$ y $f2=10.5\,Hz$.
% Nuestra resolucion frecuencial es 1 Hz, por lo que no vemos correctamente la senoidal de 10,5 Hz.

figure;
f2 = 10.5;
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t)+4;
S1 = fft(s1);
subplot(2,1,1),stem(t,s1); title('Señal inciso 3'); xlabel('t[s]');
subplot(2,1,2);stem(f,abs(S1)); title('Espectro de magnitud de la TDF');
xlabel('muestras');

%% Inciso 4
% Modico el intervalo de tiempo de análisis de la siguiente manera
% $t=[0,...,0.72) \, seg$. De esta forma, la resolución frecuencial se ve
% modificada a $\Delta f = 1.3889 \, Hz$. Dado que las frecuencias $f_1$ y $f_2$ no son
% múltiplos de $\Delta f$, no hay una única componente del espectro de
% magnitud que represente a cada una de las frecuencias de las senoidales.

figure;
t = [0:tm:0.72-tm];
f2 = 20; % Vuelvo f2 a su valor inicial
s1 = sin(2*pi*f1*t)+4*sin(2*pi*f2*t);

N = length(s1);
deltaf = 1/(tm*N);

fprintf('Resolución frecuencial de %.4f Hz\n',deltaf);

S1 = fft(s1);
subplot(2,1,1),stem(t,s1); title('Señal inciso 4'); xlabel('t[s]');
N = length(s1);
%f = [0:fm/N:fm-fm/N];
subplot(2,1,2);stem(abs(S1)); title('Espectro de magnitud de la TDF');
xlabel('muestras');

