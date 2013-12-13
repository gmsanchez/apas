%% Guia 1 - Ejercicio de laboratorio 9
%

%% Enunciado y resultados
% Discretice una señal senoidal con frecuencia 4000 Hz. y duración 2 seg., utilizando
% una frecuencia de muestreo de 129 Hz. Grafique el resultado y estime la frecuencia de
% la onda sinusoidal que se observa en la figura. Analice y obtenga conclusiones.

clear all;
close all;

fm = 129;
tm = 1/fm;
f = 4000;

t = 0:tm:2-tm;
s = sin(2*pi*f*t);
N = length(t);
df = fm/N;
deltaf = 0:df:fm-df;

subplot(2,1,1), stem(t,s); title('Señal ejercicio 9');
xlabel('t'); ylabel('s[t]');
subplot(2,1,2), stem(deltaf,abs(fft(s)));
title('Espectro de magnitud de la TDF'); xlabel('\omega'); ylabel('F[\omega]');

% Estimamos la frecuencia de la onda senoidal observada en la figura.

k = ceil(f/fm);
falias = k*fm-f;

if falias>fm/2
    falias = fm/2-(falias-fm/2);
end
if deltaf(3) == falias
    display(sprintf('f=%d Hz aparece como alias de %d Hz.',...
    f,deltaf(3)));
end