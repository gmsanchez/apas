%% Guia 2 - Ejercicio 3
%
%% Enunciado:
% Escriba un programa en Matlab que permita visualizar la convergencia de
% la fórmula de Poisson antes mencionada.

%% Código fuente y resultados

close all;
clear all;

T = 2;
n = 20;
w = -4*pi/T:0.001:4*pi/T;
p0 = 0.*w;

N = [1 10 100 1000];
lN = length(N);
for l=1:lN
    p0 = 0.*w;
    for k=-N(l):1:N(l)
        p0 = p0 + exp(-1i*k*T.*w);
    end
    subplot(lN,1,l); plot(w,real(p0));
    title(sprintf('n=%d',N(l)));
    ymax = max(p0);
    ymin = min(p0);
    axis([w(1)*1.1 w(end)*1.1 ymin-ymin*1.1 ymax*1.1]);
    grid on;
    set(gca,'XTick',[-2*pi -pi 0 pi 2*pi])
end

%% Conclusion
% Se puede observar en la figura que a medida que N aumenta, la sumatoria de
% exponenciales tiende a un tren de deltas espaciados en múltiplos enteros
% de $\pi$. Este espaciamiento cumple la condición descripta en el teorema
% 2.4 del libro, que dice que los deltas están espaciados en $2 \pi / T$,
% con T=2.