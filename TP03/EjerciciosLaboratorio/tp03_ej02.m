%% Guia 3 - Ejercicio 2
%

clear all;
close all;


% Nombre de la ondita y cantidad de iteraciones
wav = 'db6'
iter = [2 3 4];
N = length(iter);

for i = 1:N
    [phi,psi,xval] = wavefun(wav,iter(i));
    figure(1)
    subplot(N,2,2*(i-1)+1),plot(xval,psi);
    subplot(N,2,2*(i-1)+2),plot(fftshift(abs(fft(psi))));
    figure(2)
    subplot(N,2,2*(i-1)+1),plot(xval,phi);
    subplot(N,2,2*(i-1)+2),plot(fftshift(abs(fft(phi))));
end

