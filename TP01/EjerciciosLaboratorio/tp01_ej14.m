%% Guia 1 - Ejercicio de laboratorio 14
%
%% Enunciado:
% Indicar el conjunto de parámetros que permiten que una función generada
% mediante
%
% $$g(t) = \sin(2 \pi f_1 t) + 4 \sin(2 \pi f_2 t) $$
%
% coincidan con el espectro de magnitud de la señal de la figura que puede verse en la guía de
% trabajos prácticos.

%% Código fuente y resultados
% Todas las señales, excepto la del inciso 2, pueden generar el espectro
% de la figura.
% El siguiente código verifica si cada señal generada puede tener el
% espectro de magnitud de la figura, considerando la posibilidad de que haya
% senoidales con alias.

clear all;
close all;

CM = 128; % Cantidad de muestras se~nal original.
T = [249e-3,498e-3,993e-3,498e-3,993e-3,124.5e-3];
fm = [512,128,128,256,128,1024];
tm = 1./fm;
f1 = [112,56,100,56,100,3872];
f2 = [200,200,50,868,78,5520];
L = length(T);

for k=1:1:L
    
fprintf('Enunciado %d\n',k);

t = 0:tm(k):T(k);
s = sin(2*pi*f1(k)*t)+4*sin(2*pi*f2(k)*t);
N = length(t);
deltaf = 0:fm(k)/N:fm(k)-fm(k)/N;

% subplot(L,1,k),
figure(k)
stem(abs(fft(s)));
grid on; axis([1,N,0,300]);
set(gca,'YTick',[0,64,256]);
set(gca,'XTick',[1, 29, 51, 79, 101, 128]);
title(sprintf('sin(2*pi*%d*t)+2*sin(2*pi*%d*t)',f1(k),f2(k)));

if N~=CM
    display('Cantidad de muestras erroneas.');
else
    % Controlo si la frecuencia f1 tiene alias o no
    if f1(k)<fm(k)/2
        if deltaf(29) == f1(k)
            display(sprintf('f1=%d Hz coincide con %d Hz.',...
                f1(k),deltaf(29)));
        end
    else
        s = ceil(f1(k)/fm(k));
        f1alias = s*fm(k)-f1(k);
        if f1alias>fm(k)/2
            f1alias = fm(k)/2-(f1alias-fm(k)/2);
        end
        if deltaf(29) == f1alias
            display(sprintf('f1=%d Hz aparece como alias de %d Hz.',...
                f1(k),deltaf(29)));
        end
    end
    % Controlo si la frecuencia f2 tiene alias o no
    if f2(k)<fm(k)/2
        if deltaf(51) == f2(k)
            display(sprintf('f1=%d Hz coincide con %d Hz.',...
                f2(k),deltaf(51)));
        end
    else
        w = ceil(f2(k)/fm(k));
        f2alias = w*fm(k)-f2(k);
        if f2alias>fm(k)/2
            f2alias = fm(k)/2-(f2alias-fm(k)/2);
        end
        if deltaf(51) == f2alias
            display(sprintf('f2=%d Hz aparece como alias de %d Hz.',...
                f2(k),deltaf(51)));
        end
    end
end
fprintf('\n');
end